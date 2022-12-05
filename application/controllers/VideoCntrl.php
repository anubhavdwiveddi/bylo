<?php
defined('BASEPATH') or exit('No direct script access allowed');

class VideoCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->library('session');
        $this->load->model(array('VideoModel', 'RegisterModel'));
    }
    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    

    public function video_watch($id)
    {
        $data = array();
        $seo = array();
        $table = 'tr02_video_data';
        $table1 = 'tr01_user';
        $select = 'tr01_user.first_name, tr01_user.last_name, tr02_video_data.*';
        $JOIN1 = 'tr02_video_data.user_id = tr01_user.id';
        $where = array('tr02_video_data.status' => 1, 'tr02_video_data.Video_id' => $id);
        $data['video'] = $this->VideoModel->fetch_data_two_order_row($table, $table1, $JOIN1, $select, $where);
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("video-watch.tpl", $data);
    }

    public function like_video()
    {
        $user_id = $this->session->userdata('id');
        if (empty($user_id)) {
            $response = ['status' => 3, 'message' => 'User are not login'];
        } else {
            $video_id = $this->input->post('video_id');
            $table = 'tr02_public_video_like';
            $where = ['video_id' => $video_id, 'user_id' => $this->session->userdata('id')];
            $check_already_exist = $this->VideoModel->check_already_exist($table, $where);
            if ($check_already_exist) {
                if ($check_already_exist->status == 0) {
                    $data = [
                        'status' => 1,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                    $where = ['video_id' => $video_id, 'user_id' => $this->session->userdata('id')];
                    $result['like_photo'] = $this->VideoModel->update_all($table, $where, $data);
                } else {
                    $data = [
                        'status' => 0,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                }
                $where = ['video_id' => $video_id, 'user_id' => $this->session->userdata('id')];
                $result['like_photo'] = $this->VideoModel->update_all($table, $where, $data);
            } else {
                $data = [
                    'video_id' => $video_id,
                    'user_id' => $this->session->userdata('id'),
                    'status' => 1,
                    'date' => date('Y-m-d'),
                    'datetime' => date('Y-m-d h:i:s'),
                ];
                $result['like_photo'] = $this->VideoModel->insert_all($table, $data);
            }
            if ($result) {
                $response = ['status' => 1, 'message' => 'Like Done', 'like_status' => $check_already_exist->status];
            } else {
                $response = ['status' => 0, 'message' => 'There are some technical error'];
            }
        }
        api_response($response);
    }

    public function video_comment()
    {
        if($this->session->userdata('id') == ''){
            $response = ['status' => 3, 'message' => 'Login you account'];
        }else {
            $video_comment = $this->input->post('comment');
            $video_id = $this->input->post('video_id');
            $comment_image = '';
            if (!empty($video_comment)) {
                $data = [
                    'user_id' => $this->session->userdata('id'),
                    'video_id' => $video_id,
                    'comment' => $video_comment,
                    'comment_image' => '',
                    'parent_id' => 0,
                    'status' => 1,
                    'date' => date('Y-m-d'),
                    'datetime' => date('Y-m-d h:i:s'),
                ];
                $table = 'tr02_public_video_comment';
                $result = $this->VideoModel->insert_all($table, $data);
                if ($result) {
                    $response = ['status' => 1, 'message' => 'Successfully'];
                } else {
                    $response = ['status' => 0, 'message' => 'Not Successfully'];
                }
            } else if (!empty($_FILES['comment_image']['name'])) {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $comment_image = $_FILES['comment_image']['name'];
                $arr = explode('.', $comment_image);
                $comment_image = end($arr);

                if ($comment_image == 'jpeg' || $comment_image == 'jpg' || $comment_image == 'png') {
                    $check = uploadimgfile("comment_image", $folder = "", $prefix = "profile_");
                    $comment_image = $check['data']['name'];
                    if ($comment_image) {
                        $data = [
                            'user_id' => $this->session->userdata('id'),
                            'video_id' => $video_id,
                            'comment' => '',
                            'comment_image' => $comment_image,
                            'parent_id' => 0,
                            'status' => 1,
                            'date' => date('Y-m-d'),
                            'datetime' => date('Y-m-d h:i:s'),
                        ];
                        $table = 'tr02_public_video_comment';
                        $result = $this->VideoModel->insert_all($table, $data);
                        if ($result) {
                            $response = ['status' => 1, 'message' => 'Successfully'];
                        } else {
                            $response = ['status' => 0, 'message' => 'Not Successfully'];
                        }
                    } else {
                        $response = ['status' => 0, 'message' => 'Select Image'];
                    }
                } else {
                    $response = ['status' => 0, 'message' => 'Not Successfully'];
                }
            } else {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $comment_image = $_FILES['comment_image']['name'];
                $arr = explode('.', $comment_image);
                $comment_image = end($arr);

                if ($comment_image == 'jpeg' || $comment_image == 'jpg' || $comment_image == 'png') {
                    $check = uploadimgfile("comment_image", $folder = "", $prefix = "profile_");
                    $comment_image = $check['data']['name'];
                    if ($comment_image) {
                        $data = [
                            'user_id' => $this->session->userdata('id'),
                            'video_id' => $video_id,
                            'comment' => $video_comment,
                            'comment_image' => $comment_image,
                            'parent_id' => 0,
                            'status' => 1,
                            'date' => date('Y-m-d'),
                            'datetime' => date('Y-m-d h:i:s'),
                        ];
                        $table = 'tr02_public_video_comment';
                        $result = $this->VideoModel->insert_all($table, $data);
                        if ($result) {
                            $response = ['status' => 1, 'message' => 'Successfully'];
                        } else {
                            $response = ['status' => 0, 'message' => 'Not Successfully'];
                        }
                    } else {
                        $response = ['status' => 0, 'message' => 'Not Successfully'];
                    }
                } else {
                    $response = ['status' => 0, 'message' => 'Not Successfully'];
                }
            }
        }
        echo json_encode($response);
    }

    public function replay_video_comment($id)
    {
        $table = 'tr02_public_video_comment';
        $table1 = 'tr01_user';
        $select = 'tr02_public_video_comment.*, tr01_user.first_name,  tr01_user.last_name, tr01_user.profile_image';
        $JOIN = 'tr01_user.id = tr02_public_video_comment.user_id';
        $where = array('tr02_public_video_comment.video_id' => $id);
        $order = 'id';
        $result = $this->VideoModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
        $sendtemp = array();
        foreach ($result as $row) {
            $sendtemp[] = $row;
        }
        echo json_encode($result);
    }
}