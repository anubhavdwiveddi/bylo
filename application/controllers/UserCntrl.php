<?php
	defined('BASEPATH') or exit('No direct script access allowed');
	
	class UserCntrl extends MY_Controller
	{
		public function __construct()
		{
			parent::__construct();
			$this->load->helper(array('form', 'language', 'url', 'utility'));
			//        $this->load->helper('cookie');
			$this->load->helper('string');
			$this->load->library('email');
			$this->load->library('session');
			$this->load->model(array('RegisterModel'));
			//$this->check_session();
			
		}
		
		public function user($id)
		{
			$data = array();
			$seo = array();
			if (!empty($id)) {
				$table = 'tr01_user';
				$where = array('user_code' => $id);
				$user_data = $this->RegisterModel->checkvalidation($table, $where);				
				if (!empty($user_data)) {
				// get data for Meta section and find data 
				$table = 'tr01_user';
				$table1 = 'tr01_user_address';
				$where = array('user_code' => $id);
				$Join_type = 'LEFT';
				$Join = 'tr01_user_address on tr01_user_address.user_id = tr01_user.id';
				$select = 'tr01_user.*, tr01_user_address.user_id, tr01_user_address.about';
				$user_meta_data = $this->RegisterModel->check_validation($table, $table1, $where, $select, $Join, $Join_type);
				if(!empty($user_meta_data)){
					$data['title'] = ''.$user_meta_data->first_name.' '.$user_meta_data->last_name.' | '.WEBSITENAME.'';
					if(!empty($user_meta_data->about)){
						$data['description'] = $user_meta_data->about;
					}else {
						$data['description'] = 'View the profiles of people named '.$user_meta_data->first_name .' '. $user_meta_data->last_name.'. Join Bylo to connect with '.$user_meta_data->first_name .' '. $user_meta_data->last_name.' and others you may know.';
					}
				}
					$table1 = 'tr01_user_address';
					$table2 = 'm07_relationship';
					$table3 = 'm02_state';
					$table4 = 'm02_city';
					$JOIN1 = 'tr01_user_address on tr01_user_address.user_id = tr01_user.id';
					$JOIN2 = 'm07_relationship on tr01_user_address.relationship = m07_relationship.id';
					$JOIN3 = 'm02_state on tr01_user_address.state = m02_state.id';
					$JOIN4 = 'm02_city on tr01_user_address.city = m02_city.id';
					$JOIN_type = 'LEFT';
					$select = 'tr01_user.*, tr01_user_address.user_id, tr01_user_address.about, tr01_user_address.country,
							tr01_user_address.state, tr01_user_address.city, tr01_user_address.pin_code, tr01_user_address.working,
							tr01_user_address.relationship, tr01_user_address.partner_name, m07_relationship.name as relationship,
							m02_state.name as state,m02_city.name as city';
				
					$where = array('tr01_user.status' => 1, 'tr01_user.id' => $user_data->id);
					$data['user_data'] = $this->RegisterModel->fetch_join_data($table, $table1, $table2, $table3, $table4, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN_type, $where, $select);
			
					$table1 = 'tr06_create_post';
					$JOIN = 'tr06_create_post.user_id = tr01_user.id';
					$select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
					$where = ['tr06_create_post.status' => 1,  'tr06_create_post.page_name' => '',  'tr01_user.id' => $user_data->id, ];
					$get_post_data = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
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
								$order = 'id';
								$order_by = 'DESC';
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
						
						$data['post_data'] = $get_post_data;
						$table = 'tr02_photos_data';
						$where = array('status' => 1, 'user_id' => $user_data->id, 'page_id=' => '0');
						$data['photos_data'] = $this->RegisterModel->fetch_page_data($table, $where);
				
						$table = 'tr02_photos_data';
						$where = array('status' => 1, 'page_id' => '0', 'user_id' => $user_data->id);
						$data['photos_grid'] = $this->RegisterModel->fetch_page_data_limit($table, $where);
				
						$table = 'tr01_user_education';
						$where = array('status' => 1, 'user_id' => $user_data->id);
						$data['user_education'] = $this->RegisterModel->fetch_page_data_limit($table, $where);
				
						$table = 'tr01_user_experience';
						$where = array('status' => 1, 'user_id' => $user_data->id);
						$data['user_experience'] = $this->RegisterModel->fetch_page_data_limit($table, $where);
				
						$table = 'tr01_user_Social';
						$where = array('status' => 1, 'user_id' => $user_data->id);
						$data['user_social'] = $this->RegisterModel->fetch_page_data_limit($table, $where);
				
						$table = 'tr02_video_data';
						$where = array('status' => 1, 'page_id' => '0', 'user_id' => $user_data->id);
						$data['video_list'] = $this->RegisterModel->fetch_page_data($table, $where);
				
						$table = 'tr07_sent_request';
						$where = array('status!=' => 0);
						$data['sent_request'] = $this->RegisterModel->checkvalidation($table, $where);
				
						$table1 = 'tr01_user';
						$table2 = 'tr01_user_address';
						$table3 = 'm02_city';
						$table4 = 'm02_country';
						$JOIN1 = 'tr01_user.id = tr07_sent_request.receiver_id';
						$JOIN2 = 'tr01_user.id = tr01_user_address.user_id';
						$JOIN3 = 'tr01_user_address.city = m02_city.id';
						$JOIN4 = 'tr01_user_address.country = m02_country.id';
						$JOIN_type = 'Left';
						$select = 'tr07_sent_request.*, tr01_user.*, tr01_user_address.*, m02_city.name as city, m02_country.name as country';
						$where = array('tr07_sent_request.status' => 1);
						$data['friend_list'] = $this->RegisterModel->fetch_join_data($table, $table1, $table2, $table3, $table4, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN_type, $where, $select);
				
						// Check Friend and fetch all friend data
				
						$data['layout'] = $this->frontLayout($data);
						$this->load->view("timeline.tpl", $data);
					}
				}
		}
				
				public function fetch()
				{
				$user_id = $this->input->post('user_id');
				$page_id = $this->input->post('page_id');
				$start = $this->input->post('start');
				$limit = $this->input->post('limit');
				
				if (!empty($user_id)) {
				$table = 'tr06_create_post';
				$table1 = 'tr01_user';
				$table2 = 'tr06_post_like_unlike';
				$JOIN = 'tr01_user.id = tr06_create_post.user_id';
				$JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				$select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code,';
				$where = array('tr06_create_post.user_id' => $user_id, 'tr06_create_post.page_name' => 0);
				$JOIN_type = 'Left';
				$result = $this->RegisterModel->fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select);
				foreach ($result as $key => $row) {
				$table = 'tr06_post_comment';
				$JOIN = 'tr06_post_comment.user_id = tr01_user.id';
				$select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
				$where = array('tr06_post_comment.status' => 1, 'tr06_post_comment.post_id' => $row->id, 'tr06_post_comment.parent_id' => 0);
				$comment_result = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
				$result[$key] = $row;
				$result[$key]->comment = [];
				foreach ($comment_result as $v) {
				$result[$key]->comment = $comment_result;
				}
				}
				} else if (!empty($page_id)) {
				$table = 'tr06_create_post';
				$table1 = 'tr01_user';
				$table2 = 'tr06_post_like_unlike';
				$JOIN = 'tr01_user.id = tr06_create_post.user_id';
				$JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				$select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code';
				$where = array('tr06_create_post.page_name' => $page_id, 'tr06_create_post.publish_story' => 1);
				$JOIN_type = 'Left';
				$result = $this->RegisterModel->fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select);
				foreach ($result as $key => $row) {
				$table = 'tr06_post_comment';
				$JOIN = 'tr06_post_comment.user_id = tr01_user.id';
				$select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
				$where = array('tr06_post_comment.status' => 1, 'tr06_post_comment.post_id' => $row->id, 'tr06_post_comment.parent_id' => 0);
				$comment_result = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
				$result[$key] = $row;
				$result[$key]->comment = [];
				foreach ($comment_result as $v) {
				$result[$key]->comment = $comment_result;
				}
				}
				} else if ($user_id == '' && $page_id == '') {
				$table = 'tr06_create_post';
				$table1 = 'tr01_user';
				$table2 = 'tr06_post_like_unlike';
				$table3 = 'tr02_user_pages';
				$JOIN = 'tr01_user.id = tr06_create_post.user_id';
				$JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				$JOIN2 = '`tr02_user_pages`.`id` = `tr06_create_post`.`page_name`';
				$select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code, tr02_user_pages.page_name, tr02_user_pages.business_logo';
				$where = array('tr06_create_post.publish_story' => 1);
				$JOIN_type = 'Left';
				$result = $this->RegisterModel->fetch_data1($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $JOIN_type, $where, $start, $limit, $select);
				foreach ($result as $key => $row) {
				$table = 'tr06_post_comment';
				$JOIN = 'tr06_post_comment.user_id = tr01_user.id';
				$select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
				$where = array('tr06_post_comment.status' => 1, 'tr06_post_comment.post_id' => $row->id, 'tr06_post_comment.parent_id' => 0);
				$comment_result = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
				$result[$key] = $row;
				$result[$key]->comment = [];
				foreach ($comment_result as $v) {
				$result[$key]->comment = $comment_result;
				}
				}
				} else {
				$result = ['There are no any post'];
				}
				echo json_encode($result);
				}
				
				
				//    public function fetch()
				//    {
				//        $user_id = $this->input->post('user_id');
				//        $page_id = $this->input->post('page_id');
				//        $start = $this->input->post('start');
				//        $limit = $this->input->post('limit');
				//
				//        if (!empty($user_id)) {
				//            $table = 'tr06_create_post';
				//            $table1 = 'tr01_user';
				//            $table2 = 'tr06_post_like_unlike';
				//            $JOIN = 'tr01_user.id = tr06_create_post.user_id';
				//            $JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				//            $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code,';
				//            $where = array('tr06_create_post.user_id' => $user_id, 'tr06_create_post.page_name' => 0, 'tr06_create_post.publish_story' => 1);
				//            $JOIN_type = 'Left';
				//            $result = $this->RegisterModel->fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select);
				//            foreach ($result as $key => $row) {
				//                $table = 'tr06_post_comment';
				//                $JOIN = 'tr06_post_comment.user_id = tr01_user.id';
				//                $select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
				//                $where = array('tr06_post_comment.status' => 1, 'tr06_post_comment.post_id' => $row->id, 'tr06_post_comment.parent_id' => 0);
				//                $comment_result = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
				//                $result[$key] = $row;
				//                $result[$key]->comment = [];
				//                foreach ($comment_result as $value => $row1) {
				//                    $result[$key]->comment = $comment_result;
				//                    $where = array('tr06_post_comment.status' => 1, 'tr06_post_comment.parent_id' => $row1->id);
				//                    $comment_replay_result = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
				//                    $data[$value] = $row1;
				//                    $data[$value]->child_comment = [];
				//                    //$comment_replay_result = array_filter($comment_replay_result);
				//                    foreach ($comment_replay_result as $v) {
				//                        $result[$value]->child_comment = $comment_replay_result;
				//                    }
				//                }
				//            }
				//        } else if (!empty($page_id)) {
				//            $table = 'tr06_create_post';
				//            $table1 = 'tr01_user';
				//            $table2 = 'tr06_post_like_unlike';
				//            $JOIN = 'tr01_user.id = tr06_create_post.user_id';
				//            $JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				//            $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code';
				//            $where = array('tr06_create_post.page_name' => $page_id, 'tr06_create_post.publish_story' => 1);
				//            $JOIN_type = 'Left';
				//            $result = $this->RegisterModel->fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select);
				//        } else if ($user_id == '' && $page_id == '') {
				//            $table = 'tr06_create_post';
				//            $table1 = 'tr01_user';
				//            $table2 = 'tr06_post_like_unlike';
				//            $JOIN = 'tr01_user.id = tr06_create_post.user_id';
				//            $JOIN1 = '`tr06_post_like_unlike`.`post_id` = `tr06_create_post`.`id`';
				//            $select = 'tr06_create_post.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code';
				//            $where = array('tr06_create_post.publish_story' => 1);
				//            $JOIN_type = 'Left';
				//            $result = $this->RegisterModel->fetch_data($table, $table1, $table2, $JOIN, $JOIN1, $JOIN_type, $where, $start, $limit, $select);
				//        } else {
				//            $result = ['There are no any post'];
				//        }
				//        echo json_encode($result);
				//    }
				
				
				public function photo($page_user_name = 0, $page_id = 0)
				{
				$data = array();
				$seo = array();
				$data['layout'] = $this->frontLayout($data);
				if (!empty($page_id)) {
				$table = 'tr02_photos_data';
				$where = array('tr02_photos_data.photos_id' => $page_id);
				$get_id = $this->RegisterModel->check_data($table, $where);
				if ($get_id->page_id == 0) {
				$table = 'tr02_public_photo_like';
				$table1 = 'tr01_user';
				$JOIN = 'tr02_public_photo_like.user_id = tr01_user.id';
				$select = 'tr01_user.first_name, tr01_user.last_name,tr01_user.profile_image,tr01_user.user_code,tr02_public_photo_like.*';
				$where = ['tr02_public_photo_like.photo_id' => $get_id->id, 'tr02_public_photo_like.status' => 1];
				$order = 'id';
				$data['like_user'] = $this->RegisterModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
				
				$select = 'COUNT(user_id) as no_of_user';
				$data['like_total'] = $this->RegisterModel->count_user($table, $where, $select);
				
				$table = 'tr02_photos_data';
				$table1 = 'tr01_user';
				$table2 = 'tr02_public_photo_like';
				$table3 = 'tr02_user_pages';
				$table4 = 'm02_city';
				$table5 = 'm05_business_username';
				$JOIN = 'tr01_user.id = tr02_photos_data.user_id';
				$JOIN1 = 'tr02_public_photo_like.photo_id = tr02_photos_data.id';
				$JOIN2 = 'tr02_user_pages.id = tr02_photos_data.page_id';
				$JOIN3 = 'tr02_user_pages.city = m02_city.id';
				$JOIN4 = 'tr02_user_pages.id = m05_business_username.page_id';
				$select = 'tr02_photos_data.*, tr02_public_photo_like.status as like_status, tr02_public_photo_like.user_id as liked_user, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code,
				tr02_user_pages.page_name, tr01_user.profile_image, tr02_user_pages.business_Logo, m05_business_username.user_name, m02_city.name as city_name';
				$where = array('tr02_photos_data.photos_id' => $page_id);
				$Join_type = 'Left';
				$data['photos_data'] = $this->RegisterModel->Fetch_data_using_two_table($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $Join_type, $select, $where);
				} else {
				$table = 'tr02_public_photo_like';
				$table1 = 'tr01_user';
				$JOIN = 'tr02_public_photo_like.user_id = tr01_user.id';
				$select = 'tr01_user.first_name, tr01_user.last_name,tr01_user.profile_image,tr01_user.user_code,tr02_public_photo_like.*';
				$where = ['tr02_public_photo_like.photo_id' => $get_id->id, 'tr02_public_photo_like.status' => 1];
				$order = 'id';
				$data['like_user'] = $this->RegisterModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
				
				$select = 'COUNT(user_id) as no_of_user';
				$data['like_total'] = $this->RegisterModel->count_user($table, $where, $select);
				
				$table = 'tr02_photos_data';
				$table1 = 'tr01_user';
				$table2 = 'tr02_public_photo_like';
				$table3 = 'tr02_user_pages';
				$table4 = 'm02_city';
				$table5 = 'm05_business_username';
				$JOIN = 'tr01_user.id = tr02_photos_data.user_id';
				$JOIN1 = 'tr02_public_photo_like.photo_id = tr02_photos_data.id';
				$JOIN2 = 'tr02_user_pages.id = tr02_photos_data.page_id';
				$JOIN3 = 'tr02_user_pages.city = m02_city.id';
				$JOIN4 = 'tr02_user_pages.id = m05_business_username.page_id';
				$select = 'tr02_photos_data.*, tr02_public_photo_like.status as like_status, tr02_public_photo_like.user_id as liked_user, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code,
				tr02_user_pages.page_name, tr01_user.profile_image, tr02_user_pages.business_Logo, m05_business_username.user_name, m02_city.name as city_name';
				$where = array('tr02_photos_data.photos_id' => $page_id);
				$Join_type = 'Left';
				$data['photos_data'] = $this->RegisterModel->Fetch_data_using_two_table($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $Join_type, $select, $where);
				}
				} else {
				$table = 'tr02_public_photo_like';
				$table1 = 'tr01_user';
				$JOIN = 'tr02_public_photo_like.user_id = tr01_user.id';
				$select = 'tr01_user.first_name, tr01_user.last_name,tr01_user.profile_image,tr01_user.user_code,tr02_public_photo_like.*';
				$where = ['tr02_public_photo_like.photo_id' => $page_id, 'tr02_public_photo_like.status' => 1];
				$order = 'id';
				$data['like_user'] = $this->RegisterModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
				
				$select = 'COUNT(user_id) as no_of_user';
				$data['like_total'] = $this->RegisterModel->count_user($table, $where, $select);
				
				$table = 'tr02_photos_data';
				$table1 = 'tr02_user_pages';
				$table2 = 'tr02_public_photo_like';
				$table3 = 'tr02_user_pages';
				$table4 = 'm02_city';
				$table5 = 'm05_business_username';
				$JOIN = 'tr02_user_pages.id = tr02_photos_data.page_id';
				$JOIN1 = 'tr02_public_photo_like.photo_id = tr02_photos_data.id';
				$JOIN3 = 'tr02_user_pages.city = m02_city.id';
				$JOIN4 = 'tr02_user_pages.id = m05_business_username.page_id';
				$select = 'tr02_photos_data.*, tr02_public_photo_like.status as like_status, tr02_public_photo_like.user_id as liked_user, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code,
				tr02_user_pages.page_name, tr01_user.profile_image, tr02_user_pages.business_Logo, m05_business_username.user_name, m02_city.name as city_name';
				$where = array('tr02_photos_data.photos_id' => $page_id);
				$Join_type = 'Left';
				$data['photos_data'] = $this->RegisterModel->Fetch_data_using_two_table($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $Join_type, $select, $where);
				}
				$data['layout'] = $this->frontLayout($data);
				$this->load->view('single_image_url.tpl', $data);
				}
				
				public function fetch_user_details()
				{
				$user_id = $this->input->post('user_id');
				
				$table = 'tr06_create_post';
				$where = array('id' => $user_id);
				$page_data = $this->RegisterModel->check_data($table, $where);
				if (!empty($page_data)) {
				$table = 'tr01_user';
				$where = array('id' => $page_data->user_id);
				$data = $this->RegisterModel->check_data($table, $where);
				echo json_encode($data);
				}
				}
				
				public function fetch_hover_user_details()
				{
				$user_id = $this->input->post('user_id');
				$table = 'tr01_user';
				$where = array('id' => $user_id);
				$data = $this->RegisterModel->check_data($table, $where);
				echo json_encode($data);
				}
				
				public function insert_Work()
				{
				$company_name = $this->input->post('company_name');
				$position = $this->input->post('position');
				$city = $this->input->post('city');
				$description = $this->input->post('description');
				$from_date = $this->input->post('from_date');
				$to_date = $this->input->post('to_date');
				$datetime = date('Y-m-d h:i:s');
				$data = array(
				'user_id' => $this->session->userdata('id'),
				'company_name' => $company_name,
				'position' => $position,
				'city' => $city,
				'description' => $description,
				'from_date' => $from_date,
				'to_date' => $to_date,
				'date_time' => $datetime,
				'status' => 1,
				);
				$table = 'tr01_user_experience';
				$result['insert_word'] = $this->RegisterModel->insert_all($table, $data);
				if ($result) {
				$response = array('status' => 1, 'message' => 'Work Experience add successfully');
				} else {
				$response = array('status' => 0, 'message' => 'Some Technical issue');
				}
				echo json_encode($response);
				}
				
				public function College()
				{
				$company_name = $this->input->post('college_name');
				$start_date = $this->input->post('start_date');
				$end_date = $this->input->post('end_date');
				$subject = $this->input->post('subject');
				$education_name = $this->input->post('education_name');
				$datetime = date('Y-m-d h:i:s');
				
				if (empty($company_name)) {
				$response = array('status' => 0, 'message' => 'Enter College name');
				} else if (empty($start_date)) {
				$response = array('status' => 0, 'message' => 'Enter Start date');
				} else if (empty($subject)) {
				$response = array('status' => 0, 'message' => 'Enter Subject name');
				} else if (empty($education_name)) {
				$response = array('status' => 0, 'message' => 'Enter Education name');
				} else {
				$data = array(
				'user_id' => $this->session->userdata('id'),
				'college_name' => $company_name,
				'from_date' => $start_date,
				'to_date' => $end_date,
				'subject' => $subject,
				'field' => $education_name,
				'status' => 1,
				'datetime' => $datetime,
				
				);
				
				$table = 'tr01_user_education';
				$result['insert_word'] = $this->RegisterModel->insert_all($table, $data);
				if ($result) {
				$response = array('status' => 1, 'message' => 'Work Experience add successfully');
				} else {
				$response = array('status' => 0, 'message' => 'Some Technical issue');
				}
				}
				echo json_encode($response);
				}
				
				public function search_friends()
				{
				$data = array();
				$seo = array();
				
				//$seo['url'] = site_url("/make");
				//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
				//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
				//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
				//        $data['data']['seo'] = $seo;
				
				$data['layout'] = $this->frontLayout($data);
				$this->load->view("search_friends.tpl", $data);
				}
				
				public function friends()
				{
				$data = array();
				$seo = array();
				$data['layout'] = $this->frontLayout($data);
				$this->load->view("friends.tpl", $data);
				}
				
				public function Delete_data()
				{
				$id = $this->input->post('blog_id');
				$table = $this->input->post('table');
				
				$data = array(
				'status' => 0
				);
				$where = array('id' => $id);
				$data['delete_data'] = $this->RegisterModel->update_all($table, $where, $data);
				if ($data) {
				$response = array('status' => 1, 'message' => 'Delete Successfully');
				} else {
				$response = array('status' => 1, 'message' => 'issue on server');
				}
				echo json_encode($response);
				}
				
				public function user_social_link()
				{
				$social_name = $this->input->post('social_name');
				$social_link = $this->input->post('social_link');
				$datetime = date('Y-m-d h:i:s');
				$table = 'tr01_user_Social';
				$where = array('id' => $this->session->userdata('id'), 'social_name' => $social_name, 'social_link' => $social_link);
				$check_user_social = $this->RegisterModel->checkvalidation($table, $where);
				if (empty($social_name)) {
				$response = array('status' => 0, 'message' => 'Enter your social media name');
				} else if (empty($social_link)) {
				$response = array('status' => 0, 'message' => 'Enter your social media Link');
				} else if (!empty($check_user_social)) {
				$response = array('status' => 0, 'message' => 'This already create this');
				} else {
				$data = array(
				'user_id' => $this->session->userdata('id'),
				'social_name' => $social_name,
				'social_link' => $social_link,
				'status' => 1,
				'datetime' => $datetime
				);
				$data['social_link'] = $this->RegisterModel->insert_all($table, $data);
				if ($data) {
				$response = array('status' => 1, 'message' => 'saved.');
				} else {
				$response = array('status' => 0, 'message' => 'There are some technical issue.');
				}
				}
				echo json_encode($response);
				}
				
				public function saved_user_post($list_id = 0)
				{
				$data = array();
				$seo = array();
				$data['layout'] = $this->frontLayout($data);
				
				// Get User collection name
				$table = 'tr09_user_saved_folder';
				$where = array('status' => 1);
				$order = 'id';
				$data['collection'] = $this->RegisterModel->fetch_page($table, $where, $order);
				
				if (empty($list_id)) {
				$table = 'tr09_user_saved_data';
				$table1 = 'tr06_create_post';
				$table2 = 'tr01_user';
				$table3 = 'tr09_user_saved_folder';
				$JOIN = 'tr09_user_saved_data.post_id = tr06_create_post.id';
				$JOIN1 = 'tr01_user.id = tr06_create_post.user_id';
				$JOIN2 = 'tr09_user_saved_folder.id = tr09_user_saved_data.folder_id';
				$select = 'tr09_user_saved_data.id,tr09_user_saved_data.folder_id, tr06_create_post.image, tr06_create_post.video, tr06_create_post.content, tr01_user.first_name, tr01_user.last_name,
				tr01_user.user_code, tr01_user.profile_image, tr09_user_saved_folder.folder_name, tr09_user_saved_folder.item_id';
				$where = array('tr09_user_saved_data.status' => 1, 'tr09_user_saved_data.user_id' => $this->session->userdata('id'));
				$order = 'tr09_user_saved_data.id';
				$join_type = 'Left';
				$data['saved_data'] = $this->RegisterModel->fetch_page_table_join($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select, $join_type);
				
				$this->load->view("saved.tpl", $data);
				} else {
				$where = array('item_id' => $list_id);
				$data['collection_folder'] = $this->RegisterModel->check_data($table, $where);
				
				$table = 'tr09_user_saved_data';
				$table1 = 'tr06_create_post';
				$table2 = 'tr01_user';
				$table3 = 'tr09_user_saved_folder';
				$JOIN = 'tr09_user_saved_data.post_id = tr06_create_post.id';
				$JOIN1 = 'tr01_user.id = tr06_create_post.user_id';
				$JOIN2 = 'tr09_user_saved_folder.id = tr09_user_saved_data.folder_id';
				$select = 'tr09_user_saved_data.id,tr09_user_saved_data.folder_id, tr06_create_post.image, tr06_create_post.video, tr06_create_post.content, tr01_user.first_name, tr01_user.last_name,
				tr01_user.user_code, tr01_user.profile_image, tr09_user_saved_folder.folder_name, tr09_user_saved_folder.item_id';
				$order = 'tr09_user_saved_data.id';
				$where = array('tr09_user_saved_folder.item_id' => $list_id);
				$data['saved_data'] = $this->RegisterModel->fetch_page_table($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select);
				
				$this->load->view("single_collection.tpl", $data);
				}
				
				
				}
				
				public function Saved_data()
				{
				$collection_name = $this->input->post('collection_name');
				$datetime = date('Y-m-d h:i:s');
				$random = generate_random();
				
				// Check Collection name if available or not
				$table = 'tr09_user_saved_folder';
				$where = array('status' => 1, 'user_id' => $this->session->userdata('id'), 'folder_name' => $collection_name);
				$check_Collection_available = $this->RegisterModel->check_data($table, $where);
				
				if ($check_Collection_available) {
				$response = ['status' => 203, 'message' => 'Rename your collection and try again.', 'title' => 'Collection name already exists'];
				} else {
				$nameFirstChar = $collection_name[0];
				$target_path = createICONImage($nameFirstChar);
				$data = [
				'folder_name' => $collection_name,
				'type' => 'user',
				'user_id' => $this->session->userdata('id'),
				'status' => 1,
				'datetime' => $datetime,
				'folder_image' => $target_path,
				'item_id' => $random
				
				];
				$data['user_collection'] = $this->RegisterModel->insert_all($table, $data);
				if ($data) {
				$response = ['status' => 200, 'message' => 'Collection are saved'];
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				}
				api_response($response);
				}
				
				function saved_user_data()
				{
				$post_id = $this->input->post('post_id');
				$field_name = $this->input->post('name');
				$collection_id = $this->input->post('collection_id');
				$saved_data_id = $this->input->post('saved_data_id');
				$datetime = date('Y-m-d h:i:s');
				
				//Check Collection
				$table = 'tr09_user_saved_data';
				$where = array('user_id' => $this->session->userdata('id'), 'post_id' => $post_id);
				$check_Collection_available = $this->RegisterModel->check_data($table, $where);
				
				$table = 'tr09_user_saved_video';
				$where = array('user_id' => $this->session->userdata('id'), 'video_id' => $post_id);
				$check_Collection_video_available = $this->RegisterModel->check_data($table, $where);
				
				if (!empty($saved_data_id)) {
				$data = [
				'folder_id' => $collection_id,
				];
				$table = 'tr09_user_saved_data';
				$where = array('user_id' => $this->session->userdata('id'), 'id' => $saved_data_id);
				$data['user_saved'] = $this->RegisterModel->update_all($table, $where, $data);
				if ($data) {
				$response = ['status' => 200, 'message' => 'Saved your data'];
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				} else {
				if ($check_Collection_available) {
				$response = ['status' => 203, 'message' => 'Rename your collection and try again.', 'title' => 'Collection name already exists'];
				} else {
				if ($field_name == 'video') {
				if ($check_Collection_video_available) {
				$response = ['status' => 203, 'message' => 'already add in your collection.', 'title' => 'Collection name already exists'];
				} else {
				$data = [
				'folder_id' => '0',
				'user_id' => $this->session->userdata('id'),
				'video_id' => $post_id,
				'status' => 1,
				'datetime' => $datetime,
				'date' => date('Y-m-d'),
				];
				$table = 'tr09_user_saved_video';
				$data['user_saved'] = $this->RegisterModel->insert_all($table, $data);
				if ($data) {
				$response = ['status' => 200, 'message' => 'Collection are saved'];
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				}
				} else if ($field_name == 'photo') {
				if ($check_Collection_video_available) {
				$response = ['status' => 203, 'message' => 'already add in your collection.', 'title' => 'Collection name already exists'];
				} else {
				$data = [
				'folder_id' => '0',
				'user_id' => $this->session->userdata('id'),
				'video_id' => $post_id,
				'status' => 1,
				'datetime' => $datetime,
				'date' => date('Y-m-d'),
				];
				$table = 'tr09_user_saved_data';
				$data['user_saved'] = $this->RegisterModel->insert_all($table, $data);
				if ($data) {
				$response = ['status' => 200, 'message' => 'Collection are saved'];
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				}
				} else if ($field_name == '') {
				$data = [
				'user_id' => $this->session->userdata('id'),
				'folder_id' => '0',
				'post_id' => $post_id,
				'status' => 1,
				'datetime' => $datetime,
				];
				$table = 'tr09_user_saved_data';
				$data['user_saved'] = $this->RegisterModel->insert_all($table, $data);
				if ($data) {
				$response = ['status' => 200, 'message' => 'Collection are saved'];
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				} else {
				$response = ['status' => 0, 'message' => 'Some Technical Issue'];
				}
				}
				}
				echo json_encode($response);
				}
				
				
				function google_login()
				{
				include_once APPPATH . "libraries/Google/autoload.php";
				$google_client = new Google_Client();
				$google_client->setClientId('1022267778561-3nr44ms5u0ob9jf5mc26gcao12tgk6ku.apps.googleusercontent.com'); //Define your ClientID
				$google_client->setClientSecret('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'); //Define your Client Secret Key
				$google_client->setRedirectUri('https://byloapp.in/feed'); //Define your Redirect Uri
				$google_client->addScope('https://www.googleapis.com/auth/plus.login
				https://www.googleapis.com/auth/userinfo.email');
				$cter = $google_client->createAuthurl();
				print_r($cter);
				exit();
				}
				
				public function oauth2callback()
				{
				$google_data=$this->google->validate();
				$session_data=array(
				'name'=>$google_data['name'],
				'email'=>$google_data['email'],
				'source'=>'google',
				'profile_pic'=>$google_data['profile_pic'],
				'link'=>$google_data['link'],
				'sess_logged_in'=>1
				);
				$this->session->set_userdata($session_data);
				redirect(base_url().'auth/index');
				}
				
				
				}
				
								