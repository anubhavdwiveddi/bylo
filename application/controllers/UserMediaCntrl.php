<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserMediaCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('session');
        $this->load->model(array('PublicMediaModel', 'RegisterModel'));
        //$this->check_session();
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    // Public function show on all media user visibility are 2 means public image

    

    public function like_photos()
    {
        if (!empty($this->session->userdata('id'))) {
            $photos_id = $this->input->post('photos_id');
            $table = 'tr02_public_photo_like';
            $where = ['photo_id' => $photos_id, 'user_id' => $this->session->userdata('id')];
            $check_already_exist = $this->PublicMediaModel->check_already_exist($table, $where);
            if ($check_already_exist) {
                if ($check_already_exist->status == 0) {
                    $data = [
                        'status' => 1,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                } else {
                    $data = [
                        'status' => 0,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                }
                $result['like_photo'] = $this->PublicMediaModel->update_all($table, $where, $data);
            } else {
                $data = [
                    'photo_id' => $photos_id,
                    'user_id' => $this->session->userdata('id'),
                    'status' => 1,
                    'date' => date('Y-m-d'),
                    'datetime' => date('Y-m-d h:i:s'),
                ];
                $result['like_photo'] = $this->PublicMediaModel->insert_all($table, $data);
            }
            if ($result) {
                $response = ['status' => 1, 'message' => 'Like Done', 'like_status' => $check_already_exist->status];
            } else {
                $response = ['status' => 0, 'message' => 'There are some technical error'];
            }
        } else {
            $response = ['status' => 203, 'message' => 'Please login your account'];
        }
        api_response($response);
    }

    public function photo_comment()
    {
        $Comment = $this->input->post('Comment');
        $photos_id = $this->input->post('photos_id');
        $comment_image = '';

        if (!empty($Comment)) {
            $data = [
                'user_id' => $this->session->userdata('id'),
                'photos_id' => $photos_id,
                'parent_id' => 0,
                'comment' => $Comment,
                'comment_image' => '',
                'status' => 1,
                'date' => date('Y-m-d'),
                'datetime' => date('Y-m-d h:i:s'),
            ];
            $table = 'tr02_public_photo_comment';
            $result = $this->PublicMediaModel->insert_all($table, $data);
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
                        'photos_id' => $photos_id,
                        'parent_id' => 0,
                        'comment' => '',
                        'comment_image' => $comment_image,
                        'status' => 1,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                    $table = 'tr02_public_photo_comment';
                    $result = $this->PublicMediaModel->insert_all($table, $data);
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
                        'photos_id' => $photos_id,
                        'parent_id' => 0,
                        'comment' => $Comment,
                        'comment_image' => $comment_image,
                        'status' => 1,
                        'date' => date('Y-m-d'),
                        'datetime' => date('Y-m-d h:i:s'),
                    ];
                    $table = 'tr02_public_photo_comment';
                    $result = $this->PublicMediaModel->insert_all($table, $data);
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
        echo json_encode($response);
    }

    public function replay_photo_comment($id)
    {
        $table = 'tr02_public_photo_comment';
        $table1 = 'tr01_user';
        $select = 'tr02_public_photo_comment.*, tr01_user.first_name,  tr01_user.last_name, tr01_user.profile_image';
        $JOIN = 'tr01_user.id = tr02_public_photo_comment.user_id';
        $where = array('tr02_public_photo_comment.photos_id' => $id, 'tr02_public_photo_comment.status' => 1);
        $order = 'id';
        $result = $this->PublicMediaModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
        $sendtemp = array();
        foreach ($result as $row) {
            $sendtemp[] = $row;
        }
        echo json_encode($result);
    }

}