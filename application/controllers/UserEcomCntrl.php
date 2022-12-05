<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserEcomCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('session');
        $this->load->model(array('UserEcomModel'));
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }
    
    public function marketplace($item=0, $category =0, $category_name=0)
    {
        $data = array();
        $seo = array();
		$data['title'] = 'Marketplace | '.WEBSITENAME.'';
        $data['layout'] = $this->frontLayout($data);

        // product category
        $table = 'm11_product_category';
        $where = ['status' => 1];
        $order = 'id';
        $order_type = 'ASC';
        $data['product_category'] = $this->UserEcomModel->check_data($table, $where, $order, $order_type);

        // user page name
        $table = 'tr02_user_pages';
        $where = ['status' => 1, 'user_id' => $this->session->userdata('id')];
        $order_type = 'DESC';
        $data['user_page'] = $this->UserEcomModel->check_data($table, $where, $order, $order_type);
        if($item == 'item'){
            $table = 'm12_user_product_list';
            $where = ['status'  => 1, 'product_id'  => $category_name];
            $data['product_details'] = $this->UserEcomModel->check_already_exist($table, $where);
            $this->load->view("product_single.tpl", $data);
        }else if($item == 'category'){
            if(!empty($category_name)) {
                $table = 'm11_product_category';
                $where = array('category_url'   => $category_name);
                $category_name = $this->UserEcomModel->check_already_exist($table, $where);
                if(!empty($category_name)){
                    $table = 'm12_user_product_list';
                    $table1 = 'tr02_user_pages';
                    $table2 = 'm11_product_category';
                    $JOIN = 'm12_user_product_list.page_id = tr02_user_pages.id';
                    $JOIN1 = 'm12_user_product_list.category = m11_product_category.id';
                    $select = 'm12_user_product_list.*, tr02_user_pages.page_name, m11_product_category.category_name';
                    $where = ['m12_user_product_list.status'  => 1, 'category'  => $category_name->id];
                    $order = 'id';
                    $data['product_list'] = $this->UserEcomModel->join_two_table($table, $table1, $table2, $where, $JOIN, $JOIN1, $select, $order);
                }
            }
        } else {
            //Product listing
            $table = 'm12_user_product_list';
            $table1 = 'tr02_user_pages';
            $table2 = 'm11_product_category';
            $JOIN = 'm12_user_product_list.page_id = tr02_user_pages.id';
            $JOIN1 = 'm12_user_product_list.category = m11_product_category.id';
            $select = 'm12_user_product_list.*, tr02_user_pages.page_name, m11_product_category.category_name';
            $where = ['m12_user_product_list.status' => 1];
            $data['product_list'] = $this->UserEcomModel->join_two_table($table, $table1, $table2, $where, $JOIN, $JOIN1, $select, $order);

        }
        $this->load->view("products.tpl", $data);
    }

    public function insert_product(){
		if(!empty($this->session->userdata('id'))){
				$page_name = $this->input->post('page_name');
        $product_name = $this->input->post('product_name');
        $location = $this->input->post('location');
        $description = $this->input->post('description');
        $condition = $this->input->post('condition');
        $category = $this->input->post('category');
        $product_price = $this->input->post('product_price');
        $purchase_type = $this->input->post('purchase_type');
        $availability = $this->input->post('availability');
        $random = generate_random();
        $product_image = '';

        if(empty($page_name)){
            $response = ['status'   => 0, 'message' => 'Select page name.'];
        } else if(empty($product_name)){
            $response = ['status'   => 0, 'message' => 'Enter your page name'];
        } else if(empty($location)){
            $response = ['status'   => 0, 'message' => 'Enter your location'];
        } else if(empty($description)){
            $response = ['status'   => 0, 'message' => 'Enter product description'];
        } else if(empty($condition)){
            $response = ['status'   => 0, 'message' => 'Select Product condition'];
        } else if(empty($category)){
            $response = ['status'   => 0, 'message' => 'Select Product category'];
        } else if(empty($product_price)){
            $response = ['status'   => 0, 'message' => 'Enter product price'];
        } else if(empty($purchase_type)){
            $response = ['status'   => 0, 'message' => 'Select product purchase type'];
        } else if(empty($availability)){
            $response = ['status'   => 0, 'message' => 'Select Product availability'];
        } else {
            if (!empty($_FILES['product_image']['name'])) {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $product_image = $_FILES['product_image']['name'];
                $product_image_title = explode('.', $product_image);
                $product_image = end($product_image_title);

                if ($product_image == 'jpeg' || $product_image == 'jpg' || $product_image == 'png') {
                    $check = uploadimgfile("product_image", $folder = "", $prefix = "profile_");
                    $product_image = $check['data']['name'];
                    if ($product_image) {
                        $data = [
                            'page_id'  => $page_name,
                            'user_id'  => $this->session->userdata('id'),
                            'product_name'  => $product_name,
                            'location'  => $location,
                            'description'  => $description,
                            'product_type'  => $condition,
                            'category'  => $category,
                            'product_price'  => $product_price,
                            'purchase_type'  => $purchase_type,
                            'availability'  => $availability,
                            'status'  => 1,
                            'date'  => date('Y-m-d'),
                            'datetime'  => date('Y-m-d h:i:s'),
                            'product_id'  => $random,
                            'product_image'  => $product_image,
                            'product_image_title'  => $product_image_title[1],
                        ];
                        $table = 'm12_user_product_list';
                        $result = $this->UserEcomModel->insert_all($table, $data);
                        if($result){
                            $response = ['status'   => 1, 'message' => 'Product are listing successfully'];
                        }else {
                            $response = ['status'   => 0, 'message' => 'There are some issue'];
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'There are some Technical issue.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'select valid image file format');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select Image');
            }
        }
		}else {
			  $response = array('status' => 3, 'message' => 'Login your account');
		}
        api_response($response);
    }

    function geoLocate()
    {
        $setting = [
            "apiKey"    => '30c3fb84ec4b4959a0c00405c007cf5f',
            "ip"    => 'fe80::ece5:9d8d:26a1:d6da%7',
            "lang"    => 'en',
            "fields"    => '*',
        ];
        $url = "https://api.ipgeolocation.io/ipgeo?";
        foreach ($setting as $k=>$v){
            $url .= urlencode($k) . "=" .urlencode($v) . "&";
        }
        $url = substr($url, 0, -1);

        //CURL init

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //CUrl Fetch

        $result = curl_exec($ch);
        if(curl_errno($ch)){
            echo curl_errno($ch);
        }else {
            $result = json_decode($result, 1);
            echo "<pre>";
            print_r($result);
            echo "</pre>";
        }
        curl_close($ch);
    }

    public function product_filter()
    {
        $category_id = $this->input->post('category_id');
        $form_name = $this->input->post('form_name');

        if ($form_name == 'category') {
            $table = 'm12_user_product_list';
            $table1 = 'tr02_user_pages';
            $table2 = 'm11_product_category';
            $JOIN = 'm12_user_product_list.page_id = tr02_user_pages.id';
            $JOIN1 = 'm12_user_product_list.category = m11_product_category.id';
            $select = 'm12_user_product_list.*, tr02_user_pages.page_name, m11_product_category.category_name';
            $where = ['m12_user_product_list.category' => $category_id, 'm12_user_product_list.status' => 1];
            $order = 'id';
            $response = $this->UserEcomModel->join_two_table($table, $table1, $table2, $where, $JOIN, $JOIN1, $select, $order);
        } else {
            $response = ['status'   =>  0, 'message'    => 'There are no any product'];
        }
        echo json_encode($response);
    }

    public function get_page_details(){
        $page_id = $this->input->post('page_id');
        if(!empty($page_id)){
            $table = 'm12_user_product_list';
            $where = ['id'  => $page_id];
            $result = $this->UserEcomModel->select_where($table, $where);
            foreach ($result as $key=>$row) {
                $table = 'tr10_product_chat';
                $where = array('status' => 1, 'product_id=' =>$row->id);
                $a = $this->db->get_where($table, $where)->result();
                $result[$key]=$row;
                $result[$key]->comment=[];
                foreach($a as $v){
                    $result[$key]->comment=$a;
                }
            }
            $response = ['product' =>$result, 'user_name'  => $this->session->userdata('first_name')];
        }else {
            $response = ['message'  => 'some server issue'];
        }
        echo json_encode($response);
    }

//    public function get_page_details(){
//        $page_id = $this->input->post('page_id');
//        if(!empty($page_id)){
//            $table = 'm12_user_product_list';
//            $where = ['id'  => $page_id];
//            $result = $this->UserEcomModel->select_where($table, $where);
//            foreach ($result as $key=>$row) {
//                $table = 'tr10_product_chat';
//                $where = array('status' => 1, 'product_id=' =>$row->id);
//                $a = $this->db->get_where($table, $where)->result();
//                $result[$key]=$row;
//                $result[$key]->comment=[];
//                foreach($a as $v){
//                    $result[$key]->comment=$a;
//                }
//            }
//            $response = [$result, 'user_name'  => $this->session->userdata('first_name')];
//        }else {
//            $response = ['message'  => 'some server issue'];
//        }
//        echo json_encode($response);
//    }

//    public function get_page_details(){
//        $page_id = $this->input->post('page_id');
//        if(!empty($page_id)){
//            $table = 'm12_user_product_list';
//            $table1 = 'tr10_product_chat';
//            $table2 = 'tr01_user';
//            $JOIN  = 'm12_user_product_list.id = tr10_product_chat.product_id';
//            $JOIN1  = 'm12_user_product_list.user_id = tr01_user.id';
//            $select = 'm12_user_product_list.product_name, m12_user_product_list.id, m12_user_product_list.id, tr10_product_chat.msg, tr10_product_chat.sender_id,
//             tr10_product_chat.receiver_id, tr01_user.first_name as seller first name, tr01_user.last_name as seller last name, tr01_user.profile_image as seller profile';
//            $Join_type = 'left';
//            $where = ['m12_user_product_list.id'  => $page_id];
//            $product = $this->UserEcomModel->join_two_table_type($table, $table1, $table2, $where, $JOIN, $JOIN1, $Join_type, $select);
//            $response = [$product, 'user_name'  => $this->session->userdata('first_name')];
//        }else {
//            $response = ['message'  => 'some server issue'];
//        }
//        echo json_encode($response);
//    }

    public function Insert_chat(){
        $msg        = $this->input->post('msg');
        $product_id = $this->input->post('product_id');
        if(empty($msg)){}
        if (!empty($product_id)){
            $table = 'm12_user_product_list';
            $where = ['id'  => $product_id];
            $user_get_data = $this->UserEcomModel->check_already_exist($table, $where);
            if(!empty($user_get_data)){
                if($user_get_data->user_id == $this->session->userdata('id')){
                    $data = [
                        'sender_id' => 0,
                        'receiver_id' => $user_get_data->user_id,
                        'msg'   => $msg,
                        'product_id'    => $product_id,
                        'status'        => 1,
                        'date'      => date('Y-m-d'),
                        'datetime'      => date('Y-m-d h:i:s'),
                    ];
                }else {
                    $data = [
                        'sender_id' => $this->session->userdata('id'),
                        'receiver_id' => 0,
                        'msg'   => $msg,
                        'product_id'    => $product_id,
                        'status'        => 1,
                        'date'      => date('Y-m-d'),
                        'datetime'      => date('Y-m-d h:i:s'),
                    ];
                }
                $table = 'tr10_product_chat';
                $data['insert_msg'] =  $this->UserEcomModel->insert_all($table, $data);
                if($data){
                    $response = ['status'   => 1, 'message' => 'msg are sent'];
                } else {
                    $response = ['status'   => 0, 'message' => 'Msg are not sent'];
                }
            }
        }
        else {
            $response = ['status'   => 0, 'message' => 'Some Technical issue'];
        }
        echo json_encode($response);
    }

    public function get_chat(){
        print_r($_POST);
        exit();
    }
}