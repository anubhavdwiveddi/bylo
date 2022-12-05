<?php
defined('BASEPATH') or exit('No direct script access allowed');

class FriendCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        is_login();
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('session');
        $this->load->model(array('FriendModel'));
        //$this->check_session();
    }

    public function sent_request()
    {
        $receiver_id = $this->input->post('receiver_id');
        $datetime = date('Y-m-d h:i:s');
        if (!empty($receiver_id)) {
            $table = 'tr07_sent_request';
            $where = array('receiver_id'    => $receiver_id, 'sender_id' => $this->session->userdata('id'));
            $check_request = $this->FriendModel->checkvalidation($table, $where);
            if($check_request){
                $where = array('id' => $check_request->id);
                $delete_record = $this->FriendModel->delete_record($table, $where);
                if($delete_record){
                    $data = array(
                        'sender_id' => $this->session->userdata('id'),
                        'receiver_id' => $receiver_id,
                        'request_sender_id' => $this->session->userdata('id'),
                        'status' => 2,
                        'datetime' => $datetime,
                    );
                    $accept_request = $this->FriendModel->insert_all($table, $data);
                    if($accept_request){
                        $response = array('status' => 1, 'message' => 'Request_sent');
                    }else {
                        $response = array('status' => 0, 'message' => 'issue');
                    }
                }else {
                    $response = array('status' => 0, 'message' => 'Server issue ');
                }
            }else {
                $data = array(
                    'sender_id' => $this->session->userdata('id'),
                    'receiver_id' => $receiver_id,
                    'request_sender_id' => $this->session->userdata('id'),
                    'status' => 2,
                    'datetime' => $datetime,
                );
                $accept_request = $this->FriendModel->insert_all($table, $data);
                if ($accept_request) {
                    $response = array('status' => 1, 'message' => 'Request_sent');
                } else {
                    $response = array('status' => 0, 'message' => 'issue');
                }
            }
            echo json_encode($response);
        }
    }

    public function confirm_request()
    {
        $id = $this->input->post('id');
        $datetime = date('Y-m-d h:i:s');

        if (!empty($id)) {
            $data = array(
                'status' => 1,
            );
            $table = 'tr07_sent_request';
            $where = array('id' => $id);
            $data['request'] = $this->FriendModel->update_all($table, $where, $data);
            if ($data) {
                $response = array('status' => 1, 'message' => 'Request_sent');
            } else {
                $response = array('status' => 0, 'message' => 'issue');
            }
        } else {
            $response = array('status' => 0, 'message' => 'issue');
        }
        echo json_encode($response);
    }

public function delete_request()
{
    $id = $this->input->post('id');
    if (!empty($id)) {
        $data = array(
            'status' => 0
        );
        $table = 'tr07_sent_request';
        $where = array('id' => $id);
        $data['sent_request'] = $this->FriendModel->update_all($table, $where, $data);

        if ($data) {
            $response = array('status' => 1, 'message' => 'Request_sent');
        } else {
            $response = array('status' => 0, 'message' => 'issue');
        }
    }else {
        $response = array('status' => 0, 'message' => 'issue');
    }
    echo json_encode($response);
}
}