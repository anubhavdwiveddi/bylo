<?php
defined('BASEPATH') or exit('No direct script access allowed');

class FeedCntrl extends MY_Controller
{
   public function __construct()
   {
      parent::__construct();
      $this->load->helper(array('form', 'language', 'url', 'utility'));
      $this->load->helper('cookie');
      $this->load->helper('string');
       $this->load->library('session');
      $this->load->model(array('FeedModel', 'RegisterModel'));
   }

//   public function feed()
//   {
//      $data = array();
//      $seo = array();
//
//	  $data['title'] = 'Feed | '.WEBSITENAME.'';
//      $id = $this->session->userdata('id');
//      $data['user_pages'] = get_page($id);
//      $month_date = date('m');
//      $day_date = date('d');
//
//      $table = 'tr06_create_post';
//      $table1 = 'tr01_user';
//      $table2 = 'tr02_user_pages';
//      $table3 = 'm02_city';
//      $table4 = 'm05_business_username';
//      $JOIN = 'tr06_create_post.user_id = tr01_user.id';
//      $JOIN1 = 'tr06_create_post.page_name = tr02_user_pages.id';
//      $JOIN2 = 'm02_city.id = tr02_user_pages.city';
//      $JOIN3 = 'm05_business_username.page_id = tr02_user_pages.id';
//      $Join_type = 'Left';
//      $select = 'tr06_create_post.*, m02_city.name as city_name, m05_business_username.user_name, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo';
//      $where = ['tr06_create_post.status' => 1];
//      $get_post_data = $this->RegisterModel->get_feed_result($table, $table1, $table2, $table3, $table4, $JOIN, $JOIN1, $JOIN2, $JOIN3, $Join_type, $select, $where);
//      foreach ($get_post_data as $key => $user_like) {
//         $table = 'tr06_post_like_unlike';
//         $table1 = 'tr01_user';
//         $select = 'COUNT(tr06_post_like_unlike.id) AS post_count, tr06_post_like_unlike.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
//         $JOIN = 'JOIN tr01_user ON tr01_user.id = tr06_post_like_unlike.user_id';
//         $order = 'tr06_post_like_unlike.id';
//         $order_by = 'DESC';
//         $Limit = '1';
//         $where = ['post_id' => $user_like->id];
//         $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
//         $result[$key] = $user_like;
//         //$result[$key]->post_like = [];
//         $result[$key]->post_like = $get_post_like;
//         foreach ($get_post_data as $key => $user_comment) {
//            $table = 'tr06_post_comment';
//            $table1 = 'tr01_user';
//            $JOIN = 'tr06_post_comment.user_id = tr01_user.id';
//            $select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
//            $where = ['tr06_post_comment.post_id' => $user_comment->id, 'tr06_post_comment.status' => 1, 'tr06_post_comment.parent_id' => 0];
//            $get_post_comment = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
//            $result[$key] = $user_comment;
//            //$result[$key]->user_comment = [];
//            $result[$key]->user_comment = $get_post_comment;
//            foreach ($get_post_comment as $key => $child_comment) {
//               $where = ['tr06_post_comment.parent_id' => $child_comment->id, 'tr06_post_comment.status' => 1];
//               $get_child_comment = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
//               $result[$key] = $child_comment;
//               $result[$key]->post_child_comment = [];
//               foreach ($get_child_comment as $v) {
//                  $result[$key]->post_child_comment = $get_child_comment;
//               }
//            }
//         }
//      }
//      $data['feed_data'] = $get_post_data;
//      $data['layout'] = $this->frontLayout($data);
//      $this->load->view("feed.tpl", $data);
//   }

   public function fetch()
   {
      $perPage = 6;
      $table = 'tr06_create_post';
      $table1 = 'tr01_user';
      $JOIN = 'tr06_create_post.user_id = tr01_user.id';
      $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
      $where = ['tr06_create_post.status' => 1];
      $get_post_data = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
      foreach ($get_post_data as $key => $user_like) {
         $table = 'tr06_post_like_unlike';
         $where = ['post_id' => $user_like->id];
         $get_post_like = $this->RegisterModel->fetch_page_data($table, $where);
         $result[$key] = $user_like;
         //$result[$key]->post_like = [];
         $result[$key]->post_like = $get_post_like;
         foreach ($get_post_data as $key => $user_comment) {
            $table = 'tr06_post_comment';
            $where = ['post_id' => $user_comment->id];
            $get_post_comment = $this->RegisterModel->fetch_page_data($table, $where);
            $result[$key] = $user_comment;
            //$result[$key]->user_comment = [];
            $result[$key]->user_comment = $get_post_comment;
            foreach ($get_post_comment as $key => $child_comment) {
               $where = ['parent_id' => $child_comment->id];
               $get_child_comment = $this->RegisterModel->fetch_page_data($table, $where);
               $result[$key] = $child_comment;
               $result[$key]->post_child_comment = [];
               foreach ($get_child_comment as $v) {
                  $result[$key]->post_child_comment = $get_child_comment;
               }
            }
         }
      }
      $data = $get_post_data;
      echo json_encode($data);
   }

//    public function feed()
//    {
//        //$this->loader_data();
//        //check session function
//        $id = $this->session->userdata('id');
//        $data['user_pages'] = get_page($id);
//        $month_date = date('m');
//        $day_date = date('d');
//        $data = array();
//        $seo = array();
//
//        $seo['url'] = base_url("");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;
//
////        $table = 'tr01_user';
////        $where = array('id' => $id);
////        $data['user_login'] = $this->FeedModel->checkvalidation($table, $where);
//
//        $table = 'tr02_user_pages';
//        $table1 = 'm05_business_username';
//        $JOIN = 'tr02_user_pages.id = m05_business_username.page_id';
//        $select = 'tr02_user_pages.*, m05_business_username.user_name';
//        $order = 'tr02_user_pages.id';
//        $where = array('tr02_user_pages.user_id' => $id, 'tr02_user_pages.status'    => 1);
//        $data['user_pages'] = $this->FeedModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
//
//        $table = 'tr05_user_story';
//        $where = array('status' => 1);
//        $data['user_story'] = $this->FeedModel->checkvalidation($table, $where);
//
//        $limit = $this->input->post('limit');
//        $start = $this->input->post('start');
//        $table =  'tr06_create_post';
//        $table1 = 'tr01_user';
//        $table2 = 'tr06_post_like_unlike';
//        $table3 = 'tr06_post_comment';
//        $JOIN1 =  'tr01_user.id = tr06_create_post.user_id';
//        $JOIN2 =  'tr06_create_post.id = tr06_post_like_unlike.post_id';
//        $JOIN3 =  'tr06_create_post.id = tr06_post_comment.post_id';
//        $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.user_code, tr01_user.last_name,tr01_user.profile_image, tr06_post_like_unlike.status as like, tr06_post_comment.comment';
//        $order =  'id';
//        $join_position = 'LEFT';
//        $where = array('tr06_create_post.status' => 1);
//        $data['post_data'] = $this->FeedModel->fetch_post_join_data($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position, $limit, $start);
//             echo "<pre>";
//             print_r($data['post_data']);
//             echo "</pre>";
//        exit();
//
//        $table = 'tr05_user_story';
//        $where = array('status' => 1);
//        $data['user_story_all'] = $this->FeedModel->fetch_page_data($table, $where);
//
//        $table = 'tr07_sent_request';
//        $table2 = 'tr01_user_address';
//        $table3 = 'm02_city';
//        $table4 = 'm02_country';
//        $JOIN1   = 'tr01_user.id = tr07_sent_request.receiver_id';
//        $JOIN2  = 'tr01_user.id = tr01_user_address.user_id';
//        $JOIN3  = 'tr01_user_address.city = m02_city.id';
//        $JOIN4  = 'tr01_user_address.country = m02_country.id';
//        $JOIN_type = 'Left';
//        $select = 'tr07_sent_request.*, tr01_user.*, tr01_user_address.*, m02_city.name as city, m02_country.name as country';
//        $where  = array('tr07_sent_request.status'    => 1, 'tr07_sent_request.sender_id'   => $this->session->userdata('id'));
//        $data['friend_list'] = $this->FeedModel->fetch_join_data($table, $table1, $table2, $table3, $table4, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN_type, $where, $select);
//
//        $table = 'tr06_post_comment';
//        $where = array('status'	=> 1);
//        $data['user_story_comment'] = $this->FeedModel->fetch_page_data($table, $where);
//
//        $data['layout'] = $this->frontLayout($data);
//        $this->load->view("feed.tpl", $data);
//    }

   public function posts($id = '0', $story_id = 0)
   {
      $data = array();
      $seo = array();
      $seo['url'] = site_url("/feed");
      $seo['title'] = "Make  Amenities - " . WEBSITENAME;
      $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
      $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
      $data['data']['seo'] = $seo;
      $table = 'tr06_create_post';
      $table1 = 'tr01_user';
      $JOIN = 'tr06_create_post.user_id = tr01_user.id';
      $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
      $where = ['tr06_create_post.status' => 1, 'tr06_create_post.post_story_id' => $story_id];
      $get_post_data = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
      foreach ($get_post_data as $key => $user_like) {
         $table = 'tr06_post_like_unlike';
         $where = ['post_id' => $user_like->id];
         $get_post_like = $this->RegisterModel->fetch_page_data($table, $where);
         $result[$key] = $user_like;
         //$result[$key]->post_like = [];
         $result[$key]->post_like = $get_post_like;
         foreach ($get_post_data as $key => $user_comment) {
            $table = 'tr06_post_comment';
            $where = ['post_id' => $user_comment->id];
            $get_post_comment = $this->RegisterModel->fetch_page_data($table, $where);
            $result[$key] = $user_comment;
            //$result[$key]->user_comment = [];
            $result[$key]->user_comment = $get_post_comment;
            foreach ($get_post_comment as $key => $child_comment) {
               $where = ['parent_id' => $child_comment->id];
               $get_child_comment = $this->RegisterModel->fetch_page_data($table, $where);
               $result[$key] = $child_comment;
               $result[$key]->post_child_comment = [];
               foreach ($get_child_comment as $v) {
                  $result[$key]->post_child_comment = $get_child_comment;
               }
            }
         }
      }
      $data['post_details'] = $get_post_data;

      $data['layout'] = $this->frontLayout($data);

      $this->load->view("permalink.tpl", $data);
   }

   public function replay_post_comments($id)
   {
      $table = 'tr06_post_comment';
      $where = array('post_id' => $id);
      $data = $this->FeedModel->fetch_page_data($table, $where);
      $sendtemp = array();
      foreach ($data as $row) {
         $sendtemp[] = $row;
      }
      echo json_encode($data);
   }
}
