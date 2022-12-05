<?php
defined('BASEPATH') or exit('No direct script access allowed');

class StoryCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        //is_login();
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('session');
        $this->load->model(array('StoryModel'));
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    public function insert_story()
    {
        $foldername = 'story';
        $post_content = $this->input->post('post_content');
        $id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        $date = date('Y-m-d');
        $image = '';

        if (!empty($_FILES['image']['name'])) {
            $config['max_width'] = 500;
            $config['max_height'] = 500;
            $config['upload_path'] = './upload/' . $foldername . '';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
            $config['max_size'] = '10000';
            $image = $_FILES['image']['name'];
            $arr = explode('.', $image);
            $image = end($arr);

            if ($image == 'jpeg' || $image == 'jpg' || $image == 'png') {
                $check = uploadimgfile("image", $folder = "", $prefix = "profile_");
                $image = $check['data']['name'];
                $data = array(
                    'story_image' => $image,
                    'user_id' => $id,
                    'story_content' => $post_content,
                    'date' => $date,
                    'status' => 1,
                    'datetime' => $datetime
                );
                $table = 'tr05_user_story';
                $data['story'] = $this->StoryModel->insert_all($table, $data);
                if ($data) {
                    $response = array('status' => 1, 'message' => 'story are create successfully');
                } else {
                    $response = array('status' => 0, 'message' => 'story are not created');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select valid File Format');
            }
            echo json_encode($response);
        }
    }

    public function insert_post()
    {
        if (empty($this->session->userdata('id'))) {
            $response = ['status' => 3, 'message' => 'login your account.'];
        } else {
            $post_content = $this->input->post('post_content');
            $publish_story = $this->input->post('publish_story');
            $page_name = $this->input->post('page_name');
            $tag_friends = $this->input->post('tag_friends');
            $image = $_FILES['postimg']['name'];
            $video_upload = '';
            $datetime = date('Y-m-d H:i:s');
            $year = date('Y');
            $date = date('d');
            $month = date('m');
            $hours = date('h');
            $min = date('m');
            $sec = date('s');
            $post_story_id = random_number($year, $date, $month, $hours, $min, $sec);
            $page_id = generate_random();
            if((!empty($post_content)) || (!empty($image))) {
                if (!empty($page_name)) {
                    $table = 'tr02_user_pages';
                    $where = array('page_name' => $page_name);
                    $user_page_id = $this->StoryModel->checkvalidation($table, $where);
                    if (!empty($user_page_id->id)) {

                        $config['max_width'] = 500;
                        $config['max_height'] = 500;
                        $config['upload_path'] = './upload/';
                        $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                        $config['max_size'] = '10000';
                        $image = $_FILES['postimg']['name'];
                        $arr = explode('.', $image);
                        $image = end($arr);

                        //image upload code
                        if ($image == 'jpeg' || $image == 'jpg' || $image == 'png') {
                            $check = uploadimgfile("postimg", $folder = "", $prefix = "profile_");
                            $image = $check['data']['name'];
                            if ($image) {
                                $data = array(
                                    'page_name' => $user_page_id->id,
                                    'image' => $image,
                                    'content' => $post_content,
                                    'video' => $video_upload,
                                    'user_tag' => '',
                                    'user_id' => $this->session->userdata('id'),
                                    'post_story_id' => $post_story_id,
                                    'page_id' => $page_id,
                                    'status' => 1,
                                    'publish_story' => $publish_story,
                                    'datetime' => $datetime,
                                );
                                $table = 'tr06_create_post';
                                $data['insert_post'] = $this->StoryModel->insert_all($table, $data);
                                if ($data) {
                                    $response = array('status' => 200, 'message' => 'Post are create successfully');
                                } else {
                                    $response = array('status' => 0, 'message' => 'some issue on the server');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'image are not upload');
                            }
                        } else {
                            $response = array('status' => 0, 'message' => 'Please select correct image format( Jpeg | jpg| png).');
                        }

                    } else {
                        $response = array('status' => 0, 'message' => 'There are some Technical issues.');
                    }
                } else {
                    if(!empty($_FILES['postimg']['name'])){
                        $config['max_width'] = 500;
                        $config['max_height'] = 500;
                        $config['upload_path'] = './upload/';
                        $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                        $config['max_size'] = '10000';
                        $image = $_FILES['postimg']['name'];
                        $arr = explode('.', $image);
                        $image = end($arr);
                        $check = uploadimgfile("postimg", $folder = "", $prefix = "profile_");
                        $image = $check['data']['name'];
                    }
                    $data = array(
                        'page_name' => '',
                        'image' => $image,
                        'content' => $post_content,
                        'video' => $video_upload,
                        'user_tag' => '',
                        'user_id' => $this->session->userdata('id'),
                        'post_story_id' => $post_story_id,
                        'page_id' => $page_id,
                        'status' => 1,
                        'publish_story' => $publish_story,
                        'datetime' => $datetime,
                    );
                    $table = 'tr06_create_post';
                    $data['insert_post'] = $this->StoryModel->insert_all($table, $data);
                    if ($data) {
                        $response = array('status' => 200, 'message' => 'Post are create successfully');
                    } else {
                        $response = array('status' => 0, 'message' => 'some issue on the server');
                    }
                }
            }else {
                $response = array('status' => 0, 'message' => 'Select at least image');
            }
        }
        echo json_encode($response);
    }


    public function like_unlike()
    {
        $user_id = $this->session->userdata('id');
        if (empty($user_id)) {
            $response = ['status' => 3, 'message' => 'Some issue on the server side'];
        } else {
            $post_id = $this->input->post('post_id');
            $datetime = date('Y-m-d h:i:s');
            $table = 'tr06_post_like_unlike';
            $where = array('post_id' => $post_id, 'user_id' => $user_id);
            $check_like = $this->StoryModel->check_data($table, $where);
            if ($check_like) {
                if ($check_like->status == 0) {
                    $data = array(
                        'status' => 1,
                        'unlike_date' => $datetime,
                    );
                    $result['like_post'] = $this->StoryModel->update_all($table, $where, $data);
                    if ($result) {
                        $response = ['status' => 1, 'message' => 'you like this post', 'like_status' => 1];
                    } else {
                        $response = ['status' => 0, 'message' => 'Some issue on the server side'];
                    }
                } else {
                    $data = array(
                        'status' => 0,
                        'unlike_date' => $datetime,
                    );
                    $result['like_post'] = $this->StoryModel->update_all($table, $where, $data);
                    if ($result) {
                        $response = ['status' => 1, 'message' => 'you like this post', 'like_status' => 0];
                    } else {
                        $response = ['status' => 0, 'message' => 'Some issue on the server side'];
                    }
                }
            } else {
                $data = array(
                    'user_id' => $user_id,
                    'post_id' => $post_id,
                    'status' => 1,
                    'like_date' => $datetime,
                );
                $result['like_post'] = $this->StoryModel->insert_all($table, $data);
                if ($result) {
                    $response = ['status' => 1, 'message' => 'you like this post'];
                } else {
                    $response = ['status' => 0, 'message' => 'Some issue on the server side'];
                }
            }
        }
        echo json_encode($response);
    }

    public function user_comments()
    {
        if (empty($this->session->userdata('id'))) {
            $response = ['status' => 3, 'message' => 'login your account.'];
        } else {
            $comment = $this->input->post('comment');
            $post_id = $this->input->post('post_id');
            $page_id = $this->input->post('page_id');
            $user_id = $this->input->post('user_id');
            $datetime = date('Y-m-d, h:i:s');
            if (empty($comment)) {
                $response = array('status' => 0, 'message' => 'Enter your comments.');
            } else {
                $data = array(
                    'comment' => $comment,
                    'user_id' => $user_id,
                    'post_id' => $post_id,
                    'status' => 1,
                    'parent_id' => 0,
                    'datetime' => $datetime
                );
                $table = 'tr06_post_comment';
                $result['insert_comments'] = $this->StoryModel->insert_all($table, $data);
                if ($result) {
                    $response = ['status' => 1, 'message' => 'your Comments saved'];
                } else {
                    $response = ['status' => 0, 'message' => 'your Comments not saved'];
                }
            }
        }
        echo json_encode($response);
    }

    public function user_comments_reply()
    {
        if (empty($this->session->userdata('id'))) {
            $response = ['status' => 3, 'message' => 'login your account.'];
        } else {
            $reply_comment = $this->input->post('reply_comment');
            $post_id = $this->input->post('post_id');
            $comment_id = $this->input->post('comment_id');
            $user_id = $this->input->post('user_id');
            $datetime = date('Y-m-d, h:i:s');
            if (empty($reply_comment)) {
                $response = array('status' => 0, 'message' => 'Enter your comments.');
            } else {
                $data = array(
                    'comment' => $reply_comment,
                    'user_id' => $user_id,
                    'post_id' => $post_id,
                    'status' => 1,
                    'parent_id' => $comment_id,
                    'datetime' => $datetime
                );
                $table = 'tr06_post_comment';
                $result['insert_comments'] = $this->StoryModel->insert_all($table, $data);
                if ($result) {
                    $response = ['status' => 1, 'message' => 'your Comments saved'];
                } else {
                    $response = ['status' => 0, 'message' => 'your Comments not saved'];
                }
            }
        }
        echo json_encode($response);
    }

    public function delete_post()
    {
        $post_id = $this->input->post('post_id');
        $data = array(
            'status' => 0,
        );
        $table = 'tr06_create_post';
        $where = array('id' => $post_id);
        $data['delete_post'] = $this->StoryModel->update_all($table, $where, $data);
        if ($data) {
            $response = array('status' => 1, 'message' => 'post are removed');
        } else {
            $response = array('status' => 1, 'message' => 'Some Technical Issue');
        }
        echo json_encode($response);
    }

    public function replay_comments($id)
    {
        $user_id = $this->session->userdata('id');
        $table = 'tr06_post_comment';
        $where = array('post_id' => $id, 'status' => 1);
        $data = $this->StoryModel->fetch_page_data($table, $where);
        $sendtemp = array();
        foreach ($data as $row) {
            $sendtemp[] = $row;
        }
        echo json_encode($data);
    }
}
