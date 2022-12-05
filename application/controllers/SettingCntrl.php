<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SettingCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form','language','url','utility'));
        //is_login();
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('session');
        $this->load->model(array('SettingModel'));
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    public function setting()
    {
        $id = $this->session->userdata('id');
        $data = array();
        $seo = array();
		$data['title'] = 'Setting | '.WEBSITENAME.'';

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        // Fetch Relationship data for the master table
        $table = 'm07_relationship';
        $where = array('status' => 1);
        $data['relationship'] = $this->SettingModel->fetch_page_data($table, $where);

        // Fetch Country list data for the master table
        $table = 'm02_country';
        $where = array('status' => 1);
        $data['country'] = $this->SettingModel->fetch_page_data($table, $where);

        $table = 'm02_state';
        $where = array('status' => 1);
        $data['state'] = $this->SettingModel->fetch_page_data($table, $where);

        $table = 'm02_city';
        $where = array('status' => 1);
        $data['city'] = $this->SettingModel->fetch_page_data($table, $where);

        $table = 'tr01_user';
        $table1 = 'tr01_user_address';
        $JOIN = 'tr01_user_address.user_id = tr01_user.id';
        $where = array('tr01_user.id' => $id, 'tr01_user.status'   => 1);
        $data['user_data'] = $this->SettingModel->fetch_page_data_join($table, $table1, $JOIN, $where);


        $data['layout'] = $this->frontLayout($data);
        $this->load->view("setting.tpl", $data);
    }

    public function get_State(){
        if ($this->session->userdata('id') == null) {
            redirect('');
        }
        $country = $this->input->post('country');
        $table = 'm02_state';
        $where = array('country_id' => $country, 'status'   => 1);
        $order = 'name';
        $data = $this->SettingModel->fetch_data_order($table, $where, $order);
        echo json_encode($data);
    }

    public function get_city(){
        if ($this->session->userdata('id') == null) {
            redirect('');
        }
        $state = $this->input->post('state');

        $table = 'm02_city';
        $where = array('state_id' => $state, 'status'   => 1);
        $order = 'name';
        $data = $this->SettingModel->fetch_data_order($table, $where, $order);
        echo json_encode($data);
    }

    public function update_user(){
        $id = $this->session->userdata('id');
        $first_name = $this->input->post('first_name');
        $last_name = $this->input->post('last_name');
        $email = $this->input->post('email');
        $mobile = $this->input->post('mobile');
        $gender = $this->input->post('gender');
        $birthdate = $this->input->post('DOB');
        $about = $this->input->post('about');
        $Country = $this->input->post('Country');
        $State = $this->input->post('State');
        $City = $this->input->post('City');
        $pin_code = $this->input->post('pin_code');
        $working = $this->input->post('working');
        $relationship = $this->input->post('relationship');
        $partner_name = $this->input->post('partner_name');
        $datetime = date('Y-m-d h:i:s');

        $basic_details = [
            'first_name'    => $first_name,
            'last_name'     => $last_name,
            'email'         => $email,
            'mobile'        => $mobile,
            'gender'        => $gender,
            'birthdate'        => $birthdate,
        ];
        $table = 'tr01_user';
        $where = ['id' => $id];
        $user_address = $this->SettingModel->update_all($table, $where, $basic_details);
        if($user_address){
            $data = array(
                'user_id' => $id,
                'about'=> $about,
                'country'=>$Country,
                'state'=>$State,
                'city'=>$City,
                'pin_code'=>$pin_code,
                'working'=>$working,
                'relationship'=>$relationship,
                'partner_name'=>$partner_name,
                'status'=>1,
                'datetime'=> $datetime
            );
            $table = 'tr01_user_address';
            $where = array('user_id'    => $id);
            $check_user_id = $this->SettingModel->check_data($table, $where);
            if($check_user_id){
                $table = 'tr01_user_address';
                $where = array('user_id'    => $id);
                $data['user_address'] = $this->SettingModel->update_all($table, $where, $data );
                if($data){
                    $response = array('status'  =>1, 'message' => 'Profile update successfully');
                }else {
                    $response = array('status'  =>0, 'message' => 'Some Technical Issue');
                }
            }else {
                $data['user_address'] = $this->SettingModel->insert_all($table, $data);
                if($data){
                    $response = array('status'  =>1, 'message' => 'Profile update successfully');
                }else {
                    $response = array('status'  =>0, 'message' => 'Some Technical Issue');
                }
            }
        }else {
            $response = array('status'  =>0, 'message' => 'Details are not updated');
        }
        echo json_encode($response);
    }

    public function check_mobile(){
        $mobile = $this->input->post('mobile');
        $id = $this->session->userdata('id');
        $length="4";
        $char="0123456789";
        $random=substr(str_shuffle($char), 0, $length);

        $table = 'tr01_user';
        $where = array('id' => $id, 'mobile'   => $mobile);
        $check_number = $this->SettingModel->check_data($table, $where);
        if($check_number){
            $response = array('status'  => 0, 'message' => 'Mobile are available.');
        }else {
            $table = 'tr01_user';
            $where = array('mobile'   => $mobile);
            $check_number_row = $this->SettingModel->check_data($table, $where);
            if($check_number_row){
                $response = array('status'  => 0, 'message' => 'That Number are already existing.');
            }else {
                $data = array(
                    'mobile_number' => $mobile,
                    'verification_code' => $random,
                    'status'    => 1
                );
                $table = 'm04_mobile_otp';
                $data['make_otp'] = $this->SettingModel->insert_all($table, $data);
                if($data){
                    $response = array('status'  => 1, 'message' => 'OTP are sent successful '.$random.' ');
                }else {
                    $response = array('status'  => 0, 'message' => 'OTP are not sent some technical issue');
                }
            }
        }
        echo json_encode($response);
    }

    public function verify_mobile_OTP(){
        $mobile = $this->input->post('mobile');
        $verify_code = $this->input->post('mobile_code');

        $table = 'm04_mobile_otp';
        $where = array('mobile_number'  => $mobile, 'verification_code'   => $verify_code);
        $checkOTP = $this->SettingModel->check_data($table, $where);
        if($checkOTP){
            $response = array('status'  => 1, 'message' => 'OTP validation are successful.');
        }else {
            $response = array('status'  => 0, 'message' => 'The OTP was not found.');
        }
        echo json_encode($response);
    }

    public function check_email(){
        $email = $this->input->post('email1');
        $id = $this->session->userdata('id');
        $de_code1 = base64_encode($email);
        $de_code2 = base64_encode($de_code1);
        $de_code3 = base64_encode($de_code2);

        $table = 'tr01_user';
        $where = array('id' => $id, 'email'   => $email);
        $check_number = $this->SettingModel->check_data($table, $where);
        if($check_number){
            $response = array('status'  => 0, 'message' => 'Email are available.');
        }else {
            $table = 'tr01_user';
            $where = array('email'   => $email);
            $check_number_row = $this->SettingModel->check_data($table, $where);
            if($check_number_row){
                $response = array('status'  => 0, 'message' => 'That Email are already existing.');
            }else {
                $data = array(
                    'email'   => $email,
                    'account_active_status' => 0,
                );
                $table = 'tr01_user';
                $where = array('id' => $id);
                $data = $this->SettingModel->update_all($table, $where, $data);
                if($data){
                    $table = 'm06_email_content';
                    $where = array('status' => 1, 'template_id' => 1);
                    $data = $this->SettingModel->checkvalidation($table, $where);
                    $mailfor        	= 	'';
                    $verification_link  = 'https://www.byloapp.in/verify/?token='.$de_code3.'';
                    $to          	    = 	$email;
                    $sub         	    = 	$data->subject;
                    $subject         	= 	'';
                    $str                = $data->email_msg;
                    $find = array('##mailfor##','##subject##','##verification_link##');
                    $replace = compact('mailfor', 'subject', 'verification_link');
                    $message = str_replace($find, $replace, $str);
                    sent_mail($to, $sub, $message, $mailfor);
                    $response = array('status'  => 1, 'message' => 'OTP are sent successful ');
                }else {
                    $response = array('status'  => 0, 'message' => 'OTP are not sent some technical issue');
                }
            }
        }
        echo json_encode($response);
    }

    public function submit_forget_password(){
        $password = password_hash($this->input->post('password'), PASSWORD_BCRYPT);
        $email = $this->input->post('email');
        $de_code1 = base64_decode($email);
        $de_code2 = base64_decode($de_code1);
        $de_code3 = base64_decode($de_code2);
        if (!empty($password)) {
            $data = array(
                'password' => $password
            );
            $table = 'tr01_user';
            $where = array('email' => $de_code3);
            $data['password'] = $this->SettingModel->update_all($table, $where, $data);
            if ($data) {
                $response = array('status' => 1, 'message' => 'Your Password Reset Successfully.');
            } else {
                $response = array('status' => 0, 'message' => 'Some technical issue.');
            }
            echo json_encode($response);
        }
    }

    public function Search_connection(){
        $search_data    = $this->input->post('search_box');

        //$get_data = $this->SettingModel->pc($search_data);


        $table = 'tr01_user';
        $user = $this->SettingModel->serachbox($table, $search_data);

//        $table = 'tr02_user_pages';
//        $where = array('status' =>1, 'page_name'   => $search_data);
//        $page = $this->SettingModel->serachbox($table, $where);

        //$response = array_merge($user,$page);
        $response = $user;
        echo json_encode($response);
    }

	
	  public function terms_of_use()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("terms_of_use.tpl", $data);
    }
	
}
