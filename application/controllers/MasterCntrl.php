<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MasterCntrl extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        date_default_timezone_set('Asia/Kolkata');
        $this->load->helper(array('form', 'language', 'url', 'utility', 'cookie', 'string'));
        $this->load->library('encryption');
        //$this->load->model('Api_model');
        date_default_timezone_set("Asia/Kolkata");
        $this->load->model(array('MasterModel', 'PageModel', 'RegisterModel'));
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    public function fetch_country(){
        $table = 'm02_country';
        $where = array('status' => 1);
        $order_by = 'name';
        $data = $this->MasterModel->fetch_page_data_result($table, $where, $order_by);
        echo json_encode($data);
    }

    public function fetch_state(){
        $country_id = $this->input->post('country');
        $table = 'm02_state';
        $where = array('status' => 1, 'country_id'  => $country_id);
        $order_by = 'name';
        $data = $this->MasterModel->fetch_page_data_result($table, $where, $order_by);
        echo json_encode($data);
    }

    public function fetch_city(){
        $state_id = $this->input->post('state');
        $table = 'm02_city';
        $where = array('status' => 1, 'state_id'  => $state_id);
        $order_by = 'name';
        $data = $this->MasterModel->fetch_page_data_result($table, $where, $order_by);
        echo json_encode($data);
    }

    public function get_data(){
       $table = 'tr02_user_pages';
       $table1 = 'm05_business_username';
       $table2 = 'm03_category';
       $table3 = 'm02_city';
       $select = 'tr02_user_pages.id, tr02_user_pages.page_name, tr02_user_pages.city, m02_city.name as city_name, tr02_user_pages.page_id, m05_business_username.user_name, m03_category.name, tr02_user_pages.business_Logo, tr02_user_pages.avatar_image';
       $JOIN1 = 'm05_business_username on m05_business_username.page_id = tr02_user_pages.id';
       $JOIN2 = 'm03_category.id = tr02_user_pages.Business_category';
       $JOIN3 = 'm02_city.id = tr02_user_pages.city';
       $limit = 8;
       $where = ['tr02_user_pages.status' => 1, 'tr02_user_pages.id < ' => $_GET['last_id']];
       $response = $this->PageModel->get_data_join_limit($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where, $limit);
       echo json_encode($response);
    }
	
	public function get_page_feed_data(){
		$table = 'tr02_user_pages';
            $table1 = 'tr06_create_post';
            $table2 = 'm02_city';
            $table3 = 'm05_business_username';
            $JOIN = 'tr06_create_post.page_name = tr02_user_pages.id';
            $JOIN1 = 'm02_city.id = tr02_user_pages.city';
            $JOIN2 = 'm05_business_username.page_id = tr02_user_pages.id';
            $select = 'tr06_create_post.*, m02_city.name, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo, m05_business_username.user_name';
            $where = ['tr06_create_post.status' => 1, 'tr02_user_pages.id <'=> $_GET['last_id'], 'tr06_create_post.page_name' => $page_name_already->page_id];
            $order = 'id';
			$limit = 2;
            $get_post_data = $this->RegisterModel->fetch_page_table_limit($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select, $limit);
            foreach ($get_post_data as $key => $user_like) {
               $table = 'tr06_post_like_unlike';
               $table1 = 'tr01_user';
               $select = 'COUNT(tr06_post_like_unlike.id) AS post_count, tr06_post_like_unlike.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
               $JOIN = 'JOIN tr01_user ON tr01_user.id = tr06_post_like_unlike.user_id';
               $order = 'tr06_post_like_unlike.id';
               $order_by = 'DESC';
               $Limit = '1';
               $where = ['post_id' => $user_like->id];
               $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
               $result[$key] = $user_like;
               //$result[$key]->post_like = [];
               $result[$key]->post_like = $get_post_like;
               foreach ($get_post_data as $key => $user_comment) {
                  $table = 'tr06_post_comment';
                  $table1 = 'tr01_user';
                  $JOIN = 'tr06_post_comment.user_id = tr01_user.id';
                  $select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
                  $where = ['tr06_post_comment.post_id' => $user_comment->id, 'tr06_post_comment.status' => 1];
                  $order_by = 'ASC';
                  $order = 'id';
                  $get_post_comment = $this->RegisterModel->Fetch__data_using_two_table_order_by($table, $table1, $JOIN, $select, $where, $order_by, $order);
                  $result[$key] = $user_comment;
                  //$result[$key]->user_comment = [];
                  $result[$key]->user_comment = $get_post_comment;
                  foreach ($get_post_comment as $key => $child_comment) {
                     $where = ['parent_id' => $child_comment->id];
                     $get_child_comment = $this->RegisterModel->Fetch__data_using_two_table_order_by($table, $table1, $JOIN, $select, $where, $order_by, $order);
                     $result[$key] = $child_comment;
                     $result[$key]->post_child_comment = [];
                     foreach ($get_child_comment as $v) {
                        $result[$key]->post_child_comment = $get_child_comment;
                     }
                  }
               }
            }		
       echo json_encode($get_post_data);
    }


}