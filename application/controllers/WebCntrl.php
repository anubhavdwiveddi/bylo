<?php
defined('BASEPATH') or exit('No direct script access allowed');

class WebCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->library('email');
        $this->load->library('form_validation');
        $this->load->library('session');
        $this->load->model(array('RegisterModel', 'PageModel', 'PublicMediaModel', 'VideoModel', 'FeedModel'));
    }

    public function is_login()
    {
        if ($this->session->userdata('id') == "") {
            redirect('');
            die();
        }
    }

    public function index()
    {
        $data = array();
        $seo = array();

        $data['url'] = base_url("");
        $data['title'] = "Login - " . WEBSITENAME;
        $data['metatitle'] = "Login - " . WEBSITENAME;
        $data['metadescription'] = "Byloapp Login page - " . WEBSITENAME;
        $data['favicon'] = base_url('assets/images/') . WEBSITEFAVICON;
        //$data['data']['seo'] = $seo;

        // load the header, css, footer, js
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("landing.tpl", $data);
    }

    public function User_registration()
    {
        $first_name = $this->input->post('first_name');
        $table = $this->input->post('table_name');
        if (empty($first_name)) {
            $response = array('status' => 0, 'message' => 'Enter your first name');
        } else {
            $last_name = $this->input->post('last_name');
            if (empty($last_name)) {
                $response = array('status' => 0, 'message' => 'Enter your last name');
            } else {
                $email = $this->input->post('email');
                if (empty($email)) {
                    $response = array('status' => 0, 'message' => 'Enter your Email');
                } else {
                    $where = array('email' => $email);
                    $check_email_exist = $this->RegisterModel->checkvalidation($table, $where);
                    if ($check_email_exist) {
                        $response = array('status' => 0, 'message' => 'Email are already existing');
                    } else {
                        $mobile = $this->input->post('mobile');
                        if (empty($mobile)) {
                            $response = array('status' => 0, 'message' => 'Enter your Mobile Number');
                        } else {
//                            if (preg_match('/^([0-9]*)$/', $mobile)) {
//                                $response = array('status' => 0, 'message' => 'only number are allowed');
//                            } else {
                                $mobileDigitsLength = strlen($mobile);
                                if ($mobileDigitsLength != 10) {
                                    $response = array('status' => 0, 'message' => 'Enter your 10 Digit Mobile NUmber');
                                } else {
                                    $where = array('mobile' => $mobile);
                                    $check_mobile_exist = $this->RegisterModel->checkvalidation($table, $where);
                                    if ($check_mobile_exist) {
                                        $response = array('status' => 0, 'message' => 'Mobile Number are already existing');
                                    } else {
                                        $password = $this->input->post('password');
                                        if (empty($password)) {
                                            $response = array('status' => 0, 'message' => 'Enter your password');
                                        } else {
//                                            $passwordRegex = '/(?=^.{8,}$)(?=.{0,}[A-Z])(?=.{0,}[a-z])(?=.{0,}\W)(?=.{0,}\d)/g';
//                                            if ($passwordRegex . test($password)) {
//                                                $response = array('status' => 0, 'message' => 'one upper case, one lower case, digit, one special character and the minimum length should be 8.');
//                                            } else {
                                                $confirm_password = $this->input->post('confirm_password');
                                                if (empty($confirm_password)) {
                                                    $response = array('status' => 0, 'message' => 'Enter your confirm password');
                                                } else if ($password != $confirm_password) {
                                                    $response = array('status' => 0, 'message' => 'Password and confirm password are not same');
                                                } else {
                                                    $gender = $this->input->post('gender');
                                                    if (empty($gender)) {
                                                        $response = array('status' => 0, 'message' => 'Select your specific gender.');
                                                    } else {
                                                        $birthdate = $this->input->post('birthdate');
                                                        if (empty($birthdate)) {
                                                            $response = array('status' => 0, 'message' => 'Enter your DOB.');
                                                        } else {
                                                            $user_pin = OTP_random();
                                                            $user_random = OTP_random();
                                                            $data = array(
                                                                'first_name' => $first_name,
                                                                'last_name' => $last_name,
                                                                'email' => $email,
                                                                'mobile' => $mobile,
                                                                'password' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                                                                'gender' => $gender,
                                                                'birthdate' => $birthdate,
                                                                'datetime' => date('Y-m-d h:i:s'),
                                                                'user_code' => $first_name . $last_name . $user_random,
                                                                'user_pin' => $user_pin,
                                                                'status' => 2
                                                            );
                                                            $table = 'tr01_temp_user';
                                                            $insert_data = $this->RegisterModel->insert_all($table, $data);
                                                            if ($insert_data) {
                                                                $data = array(
                                                                    'user_id' => $insert_data,
                                                                    'password' => $password,
                                                                    'created_date' => date('Y-m-d h:i:s'),
                                                                );
                                                                $table = 'tr01_user_password';
                                                                $insert_password = $this->RegisterModel->insert_all($table, $data);
                                                                if ($insert_password) {
                                                                    $value_decode = content_encode($email);
                                                                    $table = 'm06_email_content';
                                                                    $where = array('status' => 1, 'template_id' => 1);
                                                                    $data = $this->RegisterModel->checkvalidation($table, $where);
                                                                    $mailfor = $first_name . ' ' . $last_name;
                                                                    $verification_link = 'https://www.byloapp.in/verify?token=' . $value_decode . '';
                                                                    $to = $email;
                                                                    $subject = $data->subject;
                                                                    $str = $data->email_msg;
                                                                    $find = array('##mailfor##', '##subject##', '##verification_link##');
                                                                    $replace = compact('mailfor', 'subject', 'verification_link');
                                                                    $message = str_replace($find, $replace, $str);
                                                                    sent_mail($to, $subject, $message, $mailfor);
                                                                    $response = array('status' => 200, 'message' => 'User are created successfully');
                                                                } else {
                                                                    $response = array('status' => 0, 'message' => 'There are some Technical issue');
                                                                }
                                                            } else {
                                                                $response = array('status' => 0, 'message' => 'There are some Technical issue');
                                                            }
                                                        }
                                                    }
                                                }
                                            //}
                                        }
                                    }
                                }
                            //}
                        }
                    }
                }
            }
        }
        echo json_encode($response);
    }

    function get_avatar($value)
    {
        $table = 'm00_avatar';
        $where = ['avatar_name' => ucfirst($value)];
        $avatar_image = $this->RegisterModel->checkvalidation($table, $where);
        return $avatar_image->avatar_image;
    }

    public
    function verify()
    {
        $email = $_GET['token'];
        if (!empty($email)) {
            $de_code1 = base64_decode($email);
            $de_code2 = base64_decode($de_code1);
            $de_code3 = base64_decode($de_code2);
            $de = content_decode($email);

            $table = 'tr01_temp_user';
            $where = array('email' => $de_code3);
            $get_user_data = $this->RegisterModel->checkvalidation($table, $where);
            if ($get_user_data) {
                $nameFirstChar = $get_user_data->first_name[0];
                $get_avatar_image = $this->get_avatar($nameFirstChar);
                $data = array(
                    'first_name' => $get_user_data->first_name,
                    'last_name' => $get_user_data->last_name,
                    'email' => $get_user_data->email,
                    'mobile' => $get_user_data->mobile,
                    'password' => $get_user_data->password,
                    'gender' => $get_user_data->gender,
                    'birthdate' => $get_user_data->birthdate,
                    'datetime' => date('Y-m-d h:i:s'),
                    'user_code' => $get_user_data->user_code,
                    'user_pin' => $get_user_data->user_pin,
                    'status' => 1,
                    'avatar_image' => $get_avatar_image,
                    'system_id' => GetClientMac(),
                    'account_active_status' => 1,
                );
                $table = 'tr01_user';
                $insert_data = $this->RegisterModel->insert_all($table, $data);
                if ($insert_data) {
                    $table = 'tr01_temp_user';
                    $delete_data = $this->RegisterModel->delete_all($table, $where);
                    $this->load->view("Verify_email.tpl", $data);
                } else {
                    $response = array('status' => 0, 'message' => 'Email are not Verified');
                }
            } else {
                $this->load->view("Verify_email.tpl");
            }
        }
    }

//    public function User_login()
//    {
//        $time = time();
//        $email = $this->input->post('email');
//        if(empty($email)){
//            $response = array('status' => 0, 'message' => "Enter your email address Email ");
//        }else {
//            $password = $this->input->post('password');
//            if(empty($password)){
//                $response = array('status' => 0, 'message' => "Enter your password");
//            }else {
//                $table = 'tr01_temp_user';
//                $where = array('email' => $email);
//                $email_are_verify = $this->RegisterModel->checkvalidation($table, $where);
//                if ($email_are_verify) {
//                    $response = array('status' => 0, 'message' => "Email are not Verify please Verify it.");
//                }else {
//                    $table = 'tr01_user';
//                    $where = array('email' => $email, 'status' => 1);
//                    $email_are_validate = $this->RegisterModel->checkvalidation($table, $where);
//                    if (empty($email_are_validate)) {
//                        $response = array('status' => 0, 'message' => 'Email address are Wrong enter valid Email address');
//                    }else {
//                        $hashPass = $email_are_validate->password;
//                        $verify = password_verify($password, $hashPass);
//                        if ($verify == true) {
//                            if ($email_are_validate->account_active_status == 1) {
//                                $session_data = [
//                                    'id' => $email_are_validate->id,
//                                    'first_name' => $email_are_validate->first_name,
//                                    'last_name' => $email_are_validate->last_name,
//                                    'email' => $email_are_validate->email,
//                                    'mobile' => $email_are_validate->mobile,
//                                    'password' => $email_are_validate->password,
//                                    'user_code' => $email_are_validate->user_code,
//                                    'status' => $email_are_validate->status,
//                                    'profile_image' => $email_are_validate->profile_image,
//                                    'banner_image' => $email_are_validate->banner_image,
//                                    'last_login' => $email_are_validate->last_login,
//                                ];
//                                if (!empty($session_data)) {
//                                    $data = array(
//                                        'last_login' => $time
//                                    );
//                                    $where = array('id' => $email_are_validate->id);
//                                    $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
//                                    if ($update_last_login) {
//                                        $this->session->set_userdata($session_data);
//                                        $this->session->set_flashdata('info', "Successfully Login");
//                                        $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
//                                    }else {
//                                        $response = array('status' => 0, 'message' => "This account are deleted.");
//                                    }
//                                }else {
//                                    $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
//                                }
//                            }else {
//                                $response = array('status' => 0, 'message' => "This account are deleted.");
//                            }
//                        }else {
//                            $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
//                        }
//                    }
//                }
//            }
//        }
//        echo json_encode($response);
//    }

    function User_login1()
    {
        $time = time();
        $email = $this->input->post('email');
        if (empty($email)) {
            $response = array('status' => 0, 'message' => "Enter your email address Email ");
        } else {
            $password = $this->input->post('password');
            if (empty($password)) {
                $response = array('status' => 0, 'message' => "Enter your password");
            } else {
                $table = 'tr01_temp_user';
                $where = array('email' => $email);
                $email_are_verify = $this->RegisterModel->checkvalidation($table, $where);
                if ($email_are_verify) {
                    $response = array('status' => 0, 'message' => "Email are not Verify please Verify it.");
                } else {
                    $table = 'tr01_user';
                    $where = ['email' => $email, 'status' => 1];
                    $email_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                    if (empty($email_are_validate)) {
                        $where = ['mobile' => $email, 'status' => 1];
                        $mobile_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                        if (empty($mobile_are_validate)) {
                            $response = array('status' => 0, 'message' => 'Email address are Wrong enter valid Email address');
                        } else {
                            $hashPass = $mobile_are_validate->password;
                            $verify = password_verify($password, $hashPass);
                            if ($verify == true) {
                                if ($mobile_are_validate->account_active_status == 1) {
                                    $session_data = [
                                        'id' => $mobile_are_validate->id,
                                        'first_name' => $mobile_are_validate->first_name,
                                        'last_name' => $mobile_are_validate->last_name,
                                        'email' => $mobile_are_validate->email,
                                        'mobile' => $mobile_are_validate->mobile,
                                        'password' => $mobile_are_validate->password,
                                        'user_code' => $mobile_are_validate->user_code,
                                        'status' => $mobile_are_validate->status,
                                        'profile_image' => $mobile_are_validate->profile_image,
                                        'banner_image' => $mobile_are_validate->banner_image,
                                        'last_login' => $mobile_are_validate->last_login,
                                    ];
                                    if (!empty($session_data)) {
                                        $data = array(
                                            'last_login' => $time
                                        );
                                        $where = array('id' => $mobile_are_validate->id);
                                        $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                        if ($update_last_login) {
                                            $this->session->set_userdata($session_data);
                                            $this->session->set_flashdata('info', "Successfully Login");
                                            $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                        } else {
                                            $response = array('status' => 0, 'message' => "This account are deleted.");
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => 'account are not vallid');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
                            }
                        }
                    } else {
                        $hashPass = $email_are_validate->password;
                        $verify = password_verify($password, $hashPass);
                        if ($verify == true) {
                            if ($email_are_validate->account_active_status == 1) {
                                $session_data = [
                                    'id' => $email_are_validate->id,
                                    'first_name' => $email_are_validate->first_name,
                                    'last_name' => $email_are_validate->last_name,
                                    'email' => $email_are_validate->email,
                                    'mobile' => $email_are_validate->mobile,
                                    'password' => $email_are_validate->password,
                                    'user_code' => $email_are_validate->user_code,
                                    'status' => $email_are_validate->status,
                                    'profile_image' => $email_are_validate->profile_image,
                                    'banner_image' => $email_are_validate->banner_image,
                                    'last_login' => $email_are_validate->last_login,
                                ];
                                if (!empty($session_data)) {
                                    $data = array(
                                        'last_login' => $time
                                    );
                                    $where = array('id' => $email_are_validate->id);
                                    $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                    if ($update_last_login) {
                                        $this->session->set_userdata($session_data);
                                        $this->session->set_flashdata('info', "Successfully Login");
                                        $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                    } else {
                                        $response = array('status' => 0, 'message' => "This account are deleted.");
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => "This account are deleted.");
                            }
                        } else {
                            $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
                        }
                    }
                }
            }
        }
        echo json_encode($response);
    }

    public
    function user_login()
    {
        $time = time();
        $email = $this->input->post('email');
        if (empty($email)) {
            $response = array('status' => 0, 'message' => "Enter your email address Email ");
        } else {
            $password = $this->input->post('password');
            if (empty($password)) {
                $response = array('status' => 0, 'message' => "Enter your password");
            } else {
                $table = 'tr01_temp_user';
                $where = array('email' => $email);
                $email_are_verify = $this->RegisterModel->checkvalidation($table, $where);
                if ($email_are_verify) {
                    $response = array('status' => 0, 'message' => "Email are not Verify please Verify it.");
                } else {
                    $table = 'tr01_user';
                    $where = ['email' => $email, 'status' => 1];
                    $email_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                    if (empty($email_are_validate)) {
                        $where = ['mobile' => $email, 'status' => 1];
                        $mobile_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                        if (empty($mobile_are_validate)) {
                            $response = array('status' => 0, 'message' => 'Email address are Wrong enter valid Email address');
                        } else {
                            if ($mobile_are_validate->password_status == 0) {
                                $data = [
                                    'password' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                                    'password_status' => 1
                                ];
                                $update_password = $this->RegisterModel->update_all($table, $where, $data);
                                if ($update_password) {
                                    $mobile_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                                    if ($mobile_are_validate->account_active_status == 1) {
                                        $session_data = [
                                            'id' => $mobile_are_validate->id,
                                            'first_name' => $mobile_are_validate->first_name,
                                            'last_name' => $mobile_are_validate->last_name,
                                            'email' => $mobile_are_validate->email,
                                            'mobile' => $mobile_are_validate->mobile,
                                            'password' => $mobile_are_validate->password,
                                            'user_code' => $mobile_are_validate->user_code,
                                            'status' => $mobile_are_validate->status,
                                            'profile_image' => $mobile_are_validate->profile_image,
                                            'banner_image' => $mobile_are_validate->banner_image,
                                            'last_login' => $mobile_are_validate->last_login,
                                        ];
                                        if (!empty($session_data)) {
                                            $data = array(
                                                'last_login' => $time
                                            );
                                            $where = array('id' => $mobile_are_validate->id);
                                            $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                            if ($update_last_login) {
                                                $this->session->set_userdata($session_data);
                                                $this->session->set_flashdata('info', "Successfully Login");
                                                $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                            } else {
                                                $response = array('status' => 0, 'message' => "This account are deleted.");
                                            }
                                        } else {
                                            $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => 'account are not valid');
                                    }
                                }
                            } else {
                                $hashPass = $mobile_are_validate->password;
                                $verify = password_verify($password, $hashPass);
                                if ($verify == true) {
                                    if ($mobile_are_validate->account_active_status == 1) {
                                        $session_data = [
                                            'id' => $mobile_are_validate->id,
                                            'first_name' => $mobile_are_validate->first_name,
                                            'last_name' => $mobile_are_validate->last_name,
                                            'email' => $mobile_are_validate->email,
                                            'mobile' => $mobile_are_validate->mobile,
                                            'password' => $mobile_are_validate->password,
                                            'user_code' => $mobile_are_validate->user_code,
                                            'status' => $mobile_are_validate->status,
                                            'profile_image' => $mobile_are_validate->profile_image,
                                            'banner_image' => $mobile_are_validate->banner_image,
                                            'last_login' => $mobile_are_validate->last_login,
                                        ];
                                        if (!empty($session_data)) {
                                            $data = array(
                                                'last_login' => $time
                                            );
                                            $where = array('id' => $mobile_are_validate->id);
                                            $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                            if ($update_last_login) {
                                                $this->session->set_userdata($session_data);
                                                $this->session->set_flashdata('info', "Successfully Login");
                                                $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                            } else {
                                                $response = array('status' => 0, 'message' => "This account are deleted.");
                                            }
                                        } else {
                                            $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => 'account are not vallid');
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
                                }
                            }
                        }
                    } else {
                        if ($email_are_validate->password_status == 0) {
                            $data = [
                                'password' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
                                'password_status' => 1
                            ];
                            $update_password = $this->RegisterModel->update_all($table, $where, $data);
                            if ($update_password) {
                                $email_are_validate = $this->RegisterModel->checkvalidation($table, $where);
                                if ($email_are_validate->account_active_status == 1) {
                                    $session_data = [
                                        'id' => $email_are_validate->id,
                                        'first_name' => $email_are_validate->first_name,
                                        'last_name' => $email_are_validate->last_name,
                                        'email' => $email_are_validate->email,
                                        'mobile' => $email_are_validate->mobile,
                                        'password' => $email_are_validate->password,
                                        'user_code' => $email_are_validate->user_code,
                                        'status' => $email_are_validate->status,
                                        'profile_image' => $email_are_validate->profile_image,
                                        'banner_image' => $email_are_validate->banner_image,
                                        'last_login' => $email_are_validate->last_login,
                                    ];
                                    if (!empty($session_data)) {
                                        $data = array(
                                            'last_login' => $time
                                        );
                                        $where = array('id' => $email_are_validate->id);
                                        $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                        if ($update_last_login) {
                                            $this->session->set_userdata($session_data);
                                            $this->session->set_flashdata('info', "Successfully Login");
                                            $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                        } else {
                                            $response = array('status' => 0, 'message' => "This account are deleted.");
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => 'account are not valid');
                                }
                            } else {
                                $hashPass = $email_are_validate->password;
                                $verify = password_verify($password, $hashPass);
                                if ($verify == true) {
                                    if ($email_are_validate->account_active_status == 1) {
                                        $session_data = [
                                            'id' => $email_are_validate->id,
                                            'first_name' => $email_are_validate->first_name,
                                            'last_name' => $email_are_validate->last_name,
                                            'email' => $email_are_validate->email,
                                            'mobile' => $email_are_validate->mobile,
                                            'password' => $email_are_validate->password,
                                            'user_code' => $email_are_validate->user_code,
                                            'status' => $email_are_validate->status,
                                            'profile_image' => $email_are_validate->profile_image,
                                            'banner_image' => $email_are_validate->banner_image,
                                            'last_login' => $email_are_validate->last_login,
                                        ];
                                        if (!empty($session_data)) {
                                            $data = array(
                                                'last_login' => $time
                                            );
                                            $where = array('id' => $email_are_validate->id);
                                            $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                            if ($update_last_login) {
                                                $this->session->set_userdata($session_data);
                                                $this->session->set_flashdata('info', "Successfully Login");
                                                $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                            } else {
                                                $response = array('status' => 0, 'message' => "This account are deleted.");
                                            }
                                        } else {
                                            $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => "This account are deleted.");
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
                                }
                            }
                        } else {
                            $hashPass = $email_are_validate->password;
                            $verify = password_verify($password, $hashPass);
                            if ($verify == true) {
                                if ($email_are_validate->account_active_status == 1) {
                                    $session_data = [
                                        'id' => $email_are_validate->id,
                                        'first_name' => $email_are_validate->first_name,
                                        'last_name' => $email_are_validate->last_name,
                                        'email' => $email_are_validate->email,
                                        'mobile' => $email_are_validate->mobile,
                                        'password' => $email_are_validate->password,
                                        'user_code' => $email_are_validate->user_code,
                                        'status' => $email_are_validate->status,
                                        'profile_image' => $email_are_validate->profile_image,
                                        'banner_image' => $email_are_validate->banner_image,
                                        'last_login' => $email_are_validate->last_login,
                                    ];
                                    if (!empty($session_data)) {
                                        $data = array(
                                            'last_login' => $time
                                        );
                                        $where = array('id' => $email_are_validate->id);
                                        $update_last_login = $this->RegisterModel->update_all($table, $where, $data);
                                        if ($update_last_login) {
                                            $this->session->set_userdata($session_data);
                                            $this->session->set_flashdata('info', "Successfully Login");
                                            $response = array('status' => 1, 'message' => 'Successfully Login', 'session' => $session_data);
                                        } else {
                                            $response = array('status' => 0, 'message' => "This account are deleted.");
                                        }
                                    } else {
                                        $response = array('status' => 0, 'message' => 'There are some issue on the server side.');
                                    }
                                } else {
                                    $response = array('status' => 0, 'message' => "This account are deleted.");
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'Password are Wrong enter valid password');
                            }
                        }
                    }
                }
            }
        }
        echo json_encode($response);
    }

    function verify_mobile_OTP()
    {
        $mobile = $this->input->post('mobile');
        $verify_code = $this->input->post('mobile_code');

        $table = 'm04_mobile_otp';
        $where = array('mobile_number' => $mobile, 'verification_code' => $verify_code);
        $checkOTP = $this->RegisterModel->checkvalidation($table, $where);
        if ($checkOTP) {
            $response = array('status' => 1, 'message' => 'OTP validation are successful.');
        } else {
            $response = array('status' => 0, 'message' => 'The OTP was not found.');
        }
        echo json_encode($response);
    }
    
    function resend_otp()
    {
        $mobile = $this->input->post('mobile');
        if (!empty($email)) {
            $table = 'tr01_temp_user';
            $where = array('email' => $email);
            $check_email = $this->RegisterModel->checkvalidation($table, $where);
            if ($check_email) {
                print_r('yes');
            } else {
                print_r('no');
            }
            exit();
        } else {
            $table = 'm04_mobile_otp';
            $where = array('mobile' => $mobile);
            $checkmobilecode = $this->RegisterModel->checkvalidation($table, $where);
            if ($checkmobilecode) {
                $response = array('status' => 1, 'message' => 'OTP are resend successful');
            } else {
                $response = array('status' => 1, 'message' => 'Code are not sent');
            }
        }
        echo json_encode($response);
    }

    public
    function Check_mobille_otp()
    {
        $mobile = $this->input->post('mobile');
        $template_name = 'Sent_OTP';
        $table = 'tr01_user';
        $where = array('mobile' => $mobile, 'id' => $this->session->userdata('id'));
        $check_mobile = $this->RegisterModel->checkvalidation($table, $where);
        if ($check_mobile) {
            $table = 'm04_mobile_otp';
            $where = array('mobile_number' => $mobile);
            $check_mobile_code = $this->RegisterModel->checkvalidation($table, $where);
            $random = OTP_random();
            if ($check_mobile_code) {
                $where = array('id' => $check_mobile_code->id);
                $delete_data = $this->RegisterModel->delete_all($table, $where);
                if ($delete_data) {
                    $data = array(
                        'mobile_number' => $mobile,
                        'verification_code' => $random,
                        'status' => 1
                    );
                    $insert_data = $this->RegisterModel->insert_all($table, $data);
                    if ($insert_data) {
                        $sent_sms = sms_login_otp($random, $mobile, $template_name);
                        $response = array('status' => 1, 'message' => 'OTP sent Successfully');
                    } else {
                        $response = array('status' => 0, 'message' => 'OTP not sent');
                    }
                } else {
                    $data = array(
                        'mobile_number' => $mobile,
                        'verification_code' => $random,
                        'status' => 1
                    );
                    $insert_data = $this->RegisterModel->insert_all($table, $data);
                    if ($insert_data) {
                        $sent_sms = sms_login_otp($random, $mobile, $template_name);
                        $response = array('status' => 1, 'message' => 'OTP sent Successfully');
                    } else {
                        $response = array('status' => 0, 'message' => 'OTP not sent');
                    }
                }
            } else {
                $data = array(
                    'mobile_number' => $mobile,
                    'verification_code' => $random,
                    'status' => 1
                );
                $insert_data = $this->RegisterModel->insert_all($table, $data);
                if ($insert_data) {
                    $sent_sms = sms_login_otp($random, $mobile, $template_name);
                    $response = array('status' => 1, 'message' => 'OTP sent Successfully');
                } else {
                    $response = array('status' => 0, 'message' => 'OTP not sent');
                }
            }
        } else {
            $response = array('status' => 0, 'message' => 'Please Enter Correct Number.!');
        }
        echo json_encode($response);
    }

    public
    function mobile_OTP()
    {
        $mobile = $this->input->post('mobile');
        $template_name = 'Sent_OTP';

        $table = 'tr01_user';
        $where = array('mobile' => $mobile);
        $mobile_already_exist = $this->RegisterModel->checkvalidation($table, $where);
        if ($mobile_already_exist) {
            $response = array('status' => 0, 'message' => 'Mobile Number are already exist');
        } else {
            $random = OTP_random();
            $table = 'm04_mobile_otp';
            $where = array('mobile_number' => $mobile);
            $mobile_check = $this->RegisterModel->checkvalidation($table, $where);
            if ($mobile_check) {
                $data = array(
                    'verification_code' => $random
                );
                $result = $this->RegisterModel->update_all($table, $where, $data);
                if ($result) {
                    $sent_sms = sms_login_otp($random, $mobile, $template_name);
                    $response = array('status' => 1, 'message' => 'Mobile OTP are Sent successfully');
                } else {
                    $response = array('status' => 0, 'message' => 'Some Technical Issue on The server Side');
                }
            } else {
                $data = array(
                    'mobile_number' => $mobile,
                    'status' => 1,
                    'verification_code' => $random
                );
                $result = $this->RegisterModel->insert_all($table, $data);
                if ($result) {
                    $sent_sms = sms_login_otp($random, $mobile, $template_name);
                    $response = array('status' => 1, 'message' => 'OTP are Sent successfully');
                } else {
                    $response = array('status' => 0, 'message' => 'Some Technical Issue on The server Side');
                }
            }
        }
        echo json_encode($response);
    }

    public
    function groups()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("groups.tpl", $data);
    }


    public
    function create_group()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("create-group.tpl", $data);
    }

    function timeline_group()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("timeline_group.tpl", $data);
    }

    function chat()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("chats.tpl", $data);
    }

    function Group_chat()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("chats-group.tpl", $data);
    }

    function under_maintenance()
    {
        $data = array();
        $seo = array();

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("under_maintenance.tpl", $data);
    }

    function permalink()
    {
        $data = array();
        $seo = array();

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("permalink.tpl", $data);
    }

    function Jobs_details()
    {
        $data = array();
        $seo = array();

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("jobs-details.tpl", $data);
    }


    public
    function birthdays()
    {
        $data = array();
        $seo = array();

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("birthdays.tpl", $data);
    }

    public
    function events()
    {
        $data = array();
        $seo = array();

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("events.tpl", $data);
    }

    public
    function listing()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("events.tpl", $data);
    }

    function forget_password()
    {
        $data = array();
        $seo = array();


        $data['title'] = "forget_password - " . WEBSITENAME;
        $data['metadescription'] = "Byloapp forget_password - " . WEBSITENAME;
        $data['favicon'] = base_url('assets/images/') . WEBSITEFAVICON;
        $data['data']['seo'] = $seo;

        // load the header, css, footer, js
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("forgot-password.tpl", $data);
    }


    function forget_password_link()
    {
        $email = $this->input->post('email');
        $de_code3 = content_decode($email);
        $table = 'tr01_temp_user';
        $where = array('email' => $email);
        $check_temp_email = $this->RegisterModel->checkvalidation($table, $where);
        if ($check_temp_email) {
            $username = $check_temp_email->first_name . " " . $check_temp_email->last_name;
            if ($username) {
                $table = 'm06_email_content';
                $where = array('status' => 1, 'template_id' => 3);
                $data = $this->RegisterModel->checkvalidation($table, $where);
                $mailfor = '';
                $Password_request = 'https://www.byloapp.in/forget?key=' . $de_code3 . '';
                $to = $email;
                $subject = $data->subject;
                $str = $data->email_msg;
                $find = array('##username##', '##Password_request##');
                $replace = compact('username', 'Password_request');
                $message = str_replace($find, $replace, $str);
                $sent_mail = sent_mail($to, $subject, $message, $mailfor);
                if($sent_mail){
                    $response = array('status' => 1, 'message' => 'link has been sent successfully');
                }else {
                    $response = array('status' => 0, 'message' => 'link has been not sent');
                }
            } else {
                $response = array('status' => 0, 'message' => 'link has been not sent');
            }
        } else {
            $table = 'tr01_user';
            $where = array('email' => $email);
            $check_main_email = $this->RegisterModel->checkvalidation($table, $where);
            if ($check_main_email) {
                $username = $check_main_email->first_name . " " . $check_main_email->last_name;
                if ($username) {
                    $table = 'm06_email_content';
                    $where = array('status' => 1, 'template_id' => 3);
                    $data = $this->RegisterModel->checkvalidation($table, $where);
                    $mailfor = '';
                    $Password_request = 'https://www.byloapp.in/forget?key=' . $de_code3 . '';
                    $to = $email;
                    $subject = $data->subject;
                    $str = $data->email_msg;
                    $find = array('##username##', '##Password_request##');
                    $replace = compact('username', 'Password_request');
                    $message = str_replace($find, $replace, $str);
                    sent_mail($to, $subject, $message, $mailfor);
                    $response = array('status' => 1, 'message' => 'link has been sent successfully');
                } else {
                    $response = array('status' => 0, 'message' => 'link has been not sent');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Email address not found.');
            }
        }
        echo json_encode($response);
    }


    public
    function Change_password()
    {
        $old_password = $this->input->post('old_password');
        $password = $this->input->post('password');
        $confirm_password = $this->input->post('confirm_password');
        $id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        if (empty($old_password)) {
            $response = array('status' => 0, 'message' => 'Enter your old password');
        } else if (empty($password)) {
            $response = array('status' => 0, 'message' => 'Enter your New password');
        } else if (empty($confirm_password)) {
            $response = array('status' => 0, 'message' => 'Enter your confirm password');
        } else if ($password != $confirm_password) {
            $response = array('status' => 0, 'message' => 'Password and confirm password are not match');
        } else {
            $table = 'tr01_user_password';
            $where = array('user_id' => $id);
            $check_old_password = $this->RegisterModel->checkvalidation($table, $where);
            if ($check_old_password) {
                if ($check_old_password->password != $old_password) {
                    $response = array('status' => 0, 'message' => 'Your old password are wrong.');
                } else if ($check_old_password->password == $password) {
                    $response = array('status' => 0, 'message' => 'your old password and updated password are same please enter the different password');
                } else {
                    $pass = password_hash($this->input->post('password'), PASSWORD_BCRYPT);
                    $data = array(
                        'password' => $pass
                    );
                    $table = 'tr01_user';
                    $where = array('id' => $id);
                    $data['password'] = $this->RegisterModel->update_all($table, $where, $data);
                    if ($data) {
                        $data = array(
                            'password' => $password,
                            'update_date' => $datetime,
                        );
                        $table = 'tr01_user_password';
                        $where = array('user_id' => $id);
                        $result['password'] = $this->RegisterModel->update_all($table, $where, $data);
                        if ($result) {
                            $response = array('status' => 1, 'message' => 'password update successfully.');
                        } else {
                            $response = array('status' => 0, 'message' => 'password not updated.');
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'password not updated.');
                    }
                }
            } else {
                $response = array('status' => 0, 'message' => 'There are some Technical issue.');
            }
        }
        echo json_encode($response);
    }

    function after_mobile_password()
    {
        $password = $this->input->post('password');
        $confirm_password = $this->input->post('confirm_password');
        $id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        $pattern = "/^([123]0|[012][1-9]|31)\/(0[1-9]|1[012])\/(19[0-9]{2}|2[0-9]{3})$/";

//    else if(!preg_match($pattern, $password)){
//            $response = array('status'  => 0, 'message' => 'Enter at least one capital letter');
//        }
        if (empty($password)) {
            $response = array('status' => 0, 'message' => 'Enter your New password');
        } else if (empty($confirm_password)) {
            $response = array('status' => 0, 'message' => 'Enter Confirm password');
        } else {
            $pass = password_hash($this->input->post('password'), PASSWORD_BCRYPT);
            $data = array(
                'password' => $pass,
            );
            $table = 'tr01_user';
            $where = array('id' => $id);
            $data['update_password'] = $this->RegisterModel->update_all($table, $where, $data);
            if ($data) {
                $table = 'tr01_user_password';
                $where = array('user_id' => $id);
                $check_password = $this->RegisterModel->checkvalidation($table, $where);
                if ($check_password) {
                    $data = array(
                        'password' => $password,
                        'update_date' => $datetime
                    );
                    $table = 'tr01_user_password';
                    $where = array('user_id' => $id);
                    $data['update_password'] = $this->RegisterModel->update_all($table, $where, $data);
                    if ($data) {
                        $response = array('status' => 1, 'message' => 'password update successfully');
                    } else {
                        $response = array('status' => 0, 'message' => 'password Not update');
                    }
                } else {
                    $data = array(
                        'user_id' => $id,
                        'password' => $password,
                        'created_date' => $datetime
                    );
                    $table = 'tr01_user_password';
                    $data['update_password'] = $this->RegisterModel->insert_all($table, $data);
                    if ($data) {
                        $response = array('status' => 1, 'message' => 'password update successfully');
                    } else {
                        $response = array('status' => 0, 'message' => 'password Not update');
                    }
                }
            } else {
                $response = array('status' => 0, 'message' => 'password not update!');
            }
        }
        echo json_encode($response);
    }


    public
    function forget()
    {

        $data = array();
        $seo = array();

        $data['url'] = base_url("forget");
        $data['title'] = "forget_password - " . WEBSITENAME;
        $data['metatitle'] = "forget_password - " . WEBSITENAME;
        $data['metadescription'] = "Byloapp forget_password - " . WEBSITENAME;
        $data['favicon'] = base_url('assets/images/') . WEBSITEFAVICON;
        //$data['data']['seo'] = $seo;

        // load the header, css, footer, js
        $data['layout'] = $this->frontLayout($data);
        $this->load->view('change_password.tpl', $data);
    }

    public
    function add_blog()
    {
        $data = array();
        $seo = array();

        $data['url'] = base_url("forget_password");
        $data['title'] = "forget_password - " . WEBSITENAME;
        $data['metatitle'] = "forget_password - " . WEBSITENAME;
        $data['metadescription'] = "Byloapp forget_password - " . WEBSITENAME;
        $data['favicon'] = base_url('assets/images/') . WEBSITEFAVICON;
        //$data['data']['seo'] = $seo;

        // load the header, css, footer, js
        $data['layout'] = $this->frontLayout($data);
        $this->load->view('create_blog.tpl', $data);
    }

    public
    function update_image()
    {
        if (!empty($this->session->userdata('id'))) {
            $page_id = $this->input->post('page_id');
            $user_visibility = $this->input->post('user_visibility');
            $id = $this->session->userdata('id');
            $random = generate_random();
            $imageUpload = '';
            if (!empty($_FILES['imageUpload']['name'])) {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $imageUpload = $_FILES['imageUpload']['name'];

                $arr = explode('.', $imageUpload);
                $imageUpload = end($arr);
                if ($imageUpload == 'jpeg' || $imageUpload == 'jpg' || $imageUpload == 'png') {
                    $check = uploadimgfile("imageUpload", $folder = "", $prefix = "profile_");
                    $imageUpload = $check['data']['name'];
                    if ($imageUpload) {
                        if ($page_id == 'undefined') {
                            $data = array(
                                'profile_image' => $imageUpload,
                            );
                            $table = 'tr01_user';
                            $where = array('id' => $id);
                        } else {
                            $data = array(
                                'business_Logo' => $imageUpload,
                            );
                            $table = 'tr02_user_pages';
                            $where = array('id' => $page_id);
                        }
                        $image_Upload = $this->RegisterModel->update_all($table, $where, $data);
                        if ($image_Upload) {
                            if ($page_id == 'undefined') {
                                $data = array(
                                    'image_address' => $imageUpload,
                                    'user_id' => $id,
                                    'status' => 1,
                                    'datetime' => date('Y-m-d h:i:s'),
                                    'page_id' => 0,
                                    'photos_id' => $random,
                                    'user_visibility' => $user_visibility
                                );
                            } else {
                                $data = array(
                                    'image_address' => $imageUpload,
                                    'user_id' => $id,
                                    'status' => 1,
                                    'datetime' => date('Y-m-d h:i:s'),
                                    'page_id' => $page_id,
                                    'photos_id' => $random,
                                    'user_visibility' => $user_visibility
                                );
                            }
                            $table = 'tr02_photos_data';
                            $data['update_photos'] = $this->RegisterModel->insert_all($table, $data);
                            if ($data) {
                                $response = array('status' => 1, 'message' => 'your profile pic are inserted.');
                            } else {
                                $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                            }
                        } else {
                            $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                }
            } else {
                $response = array('status' => 0, 'message' => 'There are some Technical issue.');
            }
        } else {
            $response = array('status' => 3, 'message' => 'Login your account.');
        }
        echo json_encode($response);
    }

    public
    function update_banner_image()
    {
        $user_visibility = $this->input->post('user_visibility');
        $user_id = $this->input->post('user_id');
        $page_id = $this->input->post('page_id');
        $random = generate_random();
        $banner = '';
        if (!empty($_FILES['imageUpload']['name'])) {
            $config['max_width'] = 500;
            $config['max_height'] = 500;
            $config['upload_path'] = './upload/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
            $config['max_size'] = '10000';
            $img = $_FILES['imageUpload']['name'];
            $arr = explode('.', $img);
            $banner = end($arr);
            if ($banner == 'jpeg' || $banner == 'jpg' || $banner == 'png') {
                $check = uploadimgfile("imageUpload", $folder = "", $prefix = "profile_");
                $banner = $check['data']['name'];
                if ($banner) {
                    if ($page_id == 'undefined') {
                        $data = array(
                            'banner_image' => $banner,
                        );
                        $table = 'tr01_user';
                        $where = array('id' => $user_id);
                        $update_photos = $this->RegisterModel->update_all($table, $where, $data);
                    } else {
                        $data = array(
                            'cover_image' => $banner,
                        );
                        $table = 'tr02_user_pages';
                        $where = array('id' => $page_id);
                        $update_photos = $this->RegisterModel->update_all($table, $where, $data);
                    }

                    if ($update_photos) {
                        if (empty($page_id)) {
                            $data = array(
                                'image_address' => $banner,
                                'user_id' => $this->session->userdata('id'),
                                'status' => 1,
                                'datetime' => date('Y-m-d h:i:s'),
                                'page_id' => 0,
                                'photos_id' => $random,
                            );
                        } else {
                            $data = array(
                                'image_address' => $banner,
                                'user_id' => $this->session->userdata('id'),
                                'status' => 1,
                                'datetime' => date('Y-m-d h:i:s'),
                                'page_id' => $page_id,
                                'photos_id' => $random,
                            );
                        }
                        $table = 'tr02_photos_data';
                        $data['update_photos'] = $this->RegisterModel->insert_all($table, $data);
                        if ($data) {
                            $response = array('status' => 1, 'message' => 'Page Banner are Update successfully updated.');
                        } else {
                            $response = array('status' => 0, 'message' => 'Page Banner are not Update.');
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'Page Banner are not Update.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'Image are not updated.');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select Valid image file');
            }
        } else {
            $response = array('status' => 0, 'message' => 'Select image');
        }
        echo json_encode($response);
    }

    public
    function upload_images()
    {
        $page_id = $this->input->post('page_id');
        $page_name = $this->input->post('page_value');
        $user_visibility = $this->input->post('publish_status');
        $id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        $random = generate_random();
        $image_upload = '';
        if (!empty($_FILES['image_upload']['name'])) {
            $config['max_width'] = 500;
            $config['max_height'] = 500;
            $config['upload_path'] = './upload/';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
            $config['max_size'] = '10000';
            $img = $_FILES['image_upload']['name'];
            $arr = explode('.', $img);
            $image_upload = end($arr);
            if ($image_upload == 'jpeg' || $image_upload == 'jpg' || $image_upload == 'png') {
                $check = uploadimgfile("image_upload", $folder = "", $prefix = "profile_");
                $image_upload = $check['data']['name'];
                if ($image_upload) {
                    if ($page_name == 'user') {
                        $data = array(
                            'image_address' => $image_upload,
                            'user_id' => $id,
                            'page_id' => 0,
                            'status' => 1,
                            'datetime' => $datetime,
                            'user_visibility' => $user_visibility,
                            'photos_id' => $random,
                            'image_alt_name' => $arr[0],
                        );
                    } else {
                        $data = array(
                            'image_address' => $image_upload,
                            'user_id' => $id,
                            'page_id' => $page_id,
                            'status' => 1,
                            'datetime' => $datetime,
                            'user_visibility' => $user_visibility,
                            'photos_id' => $random,
                            'image_alt_name' => $arr[0],
                        );
                    }
                    $table = 'tr02_photos_data';
                    $data['update_photos'] = $this->RegisterModel->insert_all($table, $data);
                    if ($data) {
                        $response = array('status' => 1, 'message' => 'your profile pic are inserted.');
                    } else {
                        $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'Image are not upload');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select correct image format jpg|PNG|jpeg');
            }
        } else {
            $response = array('status' => 0, 'message' => 'Select image.');
        }
        echo json_encode($response);
    }

    public
    function upload_video()
    {
        $page_id = $this->input->post('page_id');
        $page_name = $this->input->post('page_value');
        $user_visibility = $this->input->post('publish_status');
        $id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        $random = generate_random();
        $video_upload = '';
        if (!empty($_FILES['avatar']['name'])) {
            $config['max_width'] = 1000;
            $config['max_height'] = 1000;
            $config['upload_path'] = './video_upload/';
            $config['allowed_types'] = 'MP4|MOV|WMV|AVI|AVCHD|MKV|WEBM|FLV|F4V|SWF';
            $config['max_size'] = '10000';
            $img = $_FILES['avatar']['name'];
            $arr = explode('.', $img);
            $video_upload = end($arr);

            if ($video_upload == 'mp4' || $video_upload == 'wmv' || $video_upload == 'avi') {
                $check = uploadvideofile("avatar", $folder = "", $prefix = "profile_");
                $video_upload = $check['data']['name'];
                if ($video_upload) {
                    if ($page_name == 'user') {
                        $data = array(
                            'video_address' => $video_upload,
                            'user_id' => $id,
                            'page_id' => 0,
                            'Video_id' => $random,
                            'status' => 1,
                            'datetime' => $datetime,
                            'user_visibility' => $user_visibility,
                        );
                    } else {
                        $data = array(
                            'video_address' => $video_upload,
                            'user_id' => $id,
                            'page_id' => $page_id,
                            'Video_id' => $random,
                            'status' => 1,
                            'datetime' => $datetime,
                            'user_visibility' => $user_visibility,
                        );
                    }
                    $table = 'tr02_video_data';
                    $data['update_photos'] = $this->RegisterModel->insert_all($table, $data);
                    if ($data) {
                        $response = array('status' => 1, 'message' => 'your profile pic are inserted.');
                    } else {
                        $response = array('status' => 0, 'message' => 'your profile pic are not inserted.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'Video are not Upload');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select Correct Video format mp4|wmv|avi');
            }
        } else {
            $response = array('status' => 0, 'message' => 'Select your Video .');
        }
        echo json_encode($response);
    }

// all session are unset

    function logout()
    {
        $id = $this->input->post('v');

        if (!empty($id)) {
            $data = array(
                'last_login' => 0
            );
            $table = 'tr01_user';
            $where = ['id' => $id];
            $session_unset = $this->RegisterModel->update_all($table, $where, $data);
            if ($session_unset) {
                session_destroy();
                $response = ['status' => 1, 'message' => 'please wait'];
            } else {
                $response = ['status' => 0, 'message' => 'session not unset'];
            }
        } else {
            $response = ['status' => 0, 'message' => 'session not unset'];
        }
        echo json_encode($response);
    }

    public
    function update_status()
    {
        $time = time() + 10;
        $id = $this->session->userdata('id');
        $data = array(
            'last_login' => $time
        );
        $table = 'tr01_user';
        $where = array('id' => $id);
        $data['reset_last_login'] = $this->RegisterModel->update_all($table, $where, $data);
    }

    public
    function shopping_cart()
    {
        $data = array();
        $seo = array();
        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("shopping_cart.tpl", $data);
    }


    public function feed()
    {
        $data = array();
        $seo = array();

        $data['title'] = 'Feed | '.WEBSITENAME.'';
        $id = $this->session->userdata('id');
        //$data['user_pages'] = get_page($id);
        $month_date = date('m');
        $day_date = date('d');

        $table = 'tr06_create_post';
        $table1 = 'tr01_user';
        $table2 = 'tr02_user_pages';
        $table3 = 'm02_city';
        $table4 = 'm05_business_username';
        $JOIN = 'tr06_create_post.user_id = tr01_user.id';
        $JOIN1 = 'tr06_create_post.page_name = tr02_user_pages.id';
        $JOIN2 = 'm02_city.id = tr02_user_pages.city';
        $JOIN3 = 'm05_business_username.page_id = tr02_user_pages.id';
        $Join_type = 'Left';
        $select = 'tr06_create_post.*, m02_city.name as city_name, m05_business_username.user_name, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image, tr01_user.avatar_image as avatar, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo';
        $where = ['tr06_create_post.status' => 1];
        $get_post_data = $this->RegisterModel->get_feed_result($table, $table1, $table2, $table3, $table4, $JOIN, $JOIN1, $JOIN2, $JOIN3, $Join_type, $select, $where);
        foreach ($get_post_data as $key => $user_like) {
            $table = 'tr06_post_like_unlike';
            $table1 = 'tr01_user';
            $select = 'tr06_post_like_unlike.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image, tr01_user.avatar_image';
            $JOIN = 'JOIN tr01_user ON tr01_user.id = tr06_post_like_unlike.user_id';
            $order = 'tr06_post_like_unlike.id';
            $order_by = 'DESC';
            $Limit = '';
            $where = ['post_id' => $user_like->id, 'user_id'    => $this->session->userdata('id')];
            $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
            $result[$key] = $user_like;
            //$result[$key]->post_like = [];
            $result[$key]->post_like = $get_post_like;
            foreach ($get_post_data as $key => $user_comment) {
                $table = 'tr06_post_comment';
                $table1 = 'tr01_user';
                $JOIN = 'tr06_post_comment.user_id = tr01_user.id';
                $select = 'tr06_post_comment.*, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image, tr01_user.avatar_image';
                $where = ['tr06_post_comment.post_id' => $user_comment->id, 'tr06_post_comment.status' => 1, 'tr06_post_comment.parent_id' => 0];
                $get_post_comment = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
                $result[$key] = $user_comment;
                //$result[$key]->user_comment = [];
                $result[$key]->user_comment = $get_post_comment;
                foreach ($get_post_comment as $key => $child_comment) {
                    $where = ['tr06_post_comment.parent_id' => $child_comment->id, 'tr06_post_comment.status' => 1];
                    $get_child_comment = $this->RegisterModel->Fetch__data_using_two_table($table, $table1, $JOIN, $select, $where);
                    $result[$key] = $child_comment;
                    $result[$key]->post_child_comment = [];
                    foreach ($get_child_comment as $v) {
                        $result[$key]->post_child_comment = $get_child_comment;
                    }
                }
            }
        }
        $data['feed_data'] = $get_post_data;
        $data['blog_data'] = $this->get_blog();
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("feed.tpl", $data);
    }

    public function page($city_name = 0, $page_user_name = 0)
    {
        $data = array();
        $seo = array();

        $id = $this->session->userdata('id');

        if (empty($page_user_name)) {
            //meta data for the page
            $data['title'] = 'Discover | ' . WEBSITENAME . '';

            $table = 'tr02_user_pages';
            $table1 = 'm05_business_username';
            $table2 = 'm03_category';
            $table3 = 'm02_city';
            $select = 'tr02_user_pages.id, tr02_user_pages.page_name, tr02_user_pages.city, m02_city.name as city_name, tr02_user_pages.page_id, m05_business_username.user_name, m03_category.name, tr02_user_pages.business_Logo, tr02_user_pages.avatar_image';
            $JOIN1 = 'm05_business_username on m05_business_username.page_id = tr02_user_pages.id';
            $JOIN2 = 'm03_category.id = tr02_user_pages.Business_category';
            $JOIN3 = 'm02_city.id = tr02_user_pages.city';
            $limit = '';
            $order = 'tr02_user_pages.id';
            $order_by = 'DESC';
            $where = ['tr02_user_pages.status' => 1];
            $data['user_page'] = $this->PageModel->get_data_join_limit_or($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where, $limit, $order, $order_by);
            $data['layout'] = $this->frontLayout($data);
            $this->load->view("pages.tpl", $data);
        } else {
            $table = 'm03_category';
            $where = array('status' => 1);
            $data['category'] = $this->PageModel->fetch_page_data($table, $where);

            $table = 'm02_country';
            $data['country'] = $this->PageModel->fetch_page_data($table, $where);

            $table = 'm03_tag';
            $data['tags'] = $this->PageModel->fetch_page_data($table, $where);

            $table = 'tr02_user_pages';
            $where = array('status' => 1, 'user_id' => $id);
            $select = 'page_name, id';
            $data['user_page'] = $this->PageModel->Fetch_data($table, $where, $select);

            $table = 'm05_business_username';
            $where = array('user_name' => $page_user_name);
            $page_name_already = $this->PageModel->check_data($table, $where);
            if ($page_name_already) {
                //Meta page name and description
                $table = 'tr02_user_pages';
                $table1 = 'tr02_user_page_data';
                $select = 'tr02_user_pages.*, tr02_user_page_data.page_description';
                $Join = 'tr02_user_pages.id = tr02_user_page_data.page_id';
                $Join_type = 'LEFT';
                $where = ['tr02_user_pages.id' => $page_name_already->page_id];
                $get_page_meta = $this->RegisterModel->check_validation($table, $table1, $where, $select, $Join, $Join_type);
                if (!empty($get_page_meta)) {
                    $data['title'] = '' . $get_page_meta->page_name . ' | ' . WEBSITENAME . '';
                    $data['description'] = '' . $get_page_meta->page_description . ' | ' . WEBSITENAME . '';
                }
                $table = 'tr02_photos_data';
                $where = array('status' => 1, 'page_id' => $page_name_already->page_id);
                $data['photos'] = $this->PageModel->fetch_page_data($table, $where);

                $table = 'tr06_create_post';
                $where = array('status' => 1, 'page_name' => $page_name_already->page_id);
                $data['post_data'] = $this->PageModel->fetch_page_data($table, $where);

                $table = 'tr02_video_data';
                $where = array('status' => 1, 'page_id' => $page_name_already->page_id, 'page_id!=' => 0);
                $data['video'] = $this->PageModel->fetch_page_data($table, $where);

                $table = 'tr02_user_page_follow';
                $where = array('page_id' => $page_name_already->page_id, 'user_id' => $this->session->userdata('id'));
                $data['follow'] = $this->PageModel->checkvalidation($table, $where);

                $table = 'tr02_photos_data';
                $where = array('status' => 1, 'page_id' => $page_name_already->page_id);
                $data['photos_grid'] = $this->PageModel->fetch_page_data_limit($table, $where);


                $table = 'tr02_page_review';
                $table1 = 'tr01_user';
                $JOIN1 = 'tr02_page_review.user_id = tr01_user.id';
                $select = 'tr02_page_review.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image';
                $where = array('tr02_page_review.status' => 1, 'tr02_page_review.page_id' => $page_name_already->page_id);
                $order = 'tr02_page_review.id';
                $data['page_review'] = $this->PageModel->fetch_data_two_with_order($table, $table1, $JOIN1, $select, $where, $order);

                $table = 'tr02_page_review';
                $where = $page_name_already->page_id;
                $data['page_review_count'] = $this->PageModel->count_query($table, $where);

                $table = 'tr02_page_review';
                $where = array('status' => 1);
                $select = 'COUNT(user_id) as no_of_user, SUM(rating) as rating';
                $data['review_total'] = $this->PageModel->count_user($table, $where, $select);

                $table = 'tr02_page_review';
                $select = 'rating as star, COUNT(DISTINCT user_id) as no_of_user';
                $where = array('status' => 1);
                $group = 'rating';
                $order = 'rating';
                $data['review_result'] = $this->PageModel->review_user($table, $select, $where, $group, $order);


                $table = 'tr02_user_pages';
                $where = array('status' => 1, 'id' => $page_name_already->page_id);
                $check_country = $this->PageModel->check_data($table, $where);

                $table = 'tr08_user_blog';
                $where = array('status!=' => 0, 'page_id' => $page_name_already->page_id);
                $data['user_blog'] = $this->PageModel->fetch_page_data($table, $where);

                $table = 'tr04_create_jobs';
                $table1 = 'tr04_jobs_second';
                $table2 = 'm02_country';
                $table3 = 'm02_state';
                $table4 = 'm02_city';
                $JOIN1 = 'tr04_jobs_second.job_id = tr04_create_jobs.id';
                $JOIN2 = 'tr04_jobs_second.country = m02_country.id';;
                $JOIN3 = 'tr04_jobs_second.state = m02_state.id';
                $JOIN4 = 'tr04_jobs_second.city = m02_city.id';
                $where = array(
                    'tr04_create_jobs.page_id' => $check_country->id,
                    'tr04_create_jobs.page_id' => $check_country->id,
                    'tr04_create_jobs.user_id' => $id);
                $select = 'tr04_create_jobs.*,tr04_create_jobs.status as job_status, tr04_jobs_second.*, m02_country.name as country,m02_state.name as state,m02_city.name as city';
                $data['open_job_posting'] = $this->PageModel->get_two_table_join($table, $table1, $table2, $table3, $table4,
                    $select, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $where);

                $table = 'tr01_user';
                $table1 = 'tr04_user_job_apply';
                $table2 = 'tr01_user_address';
                $table3 = 'tr04_create_jobs';
                $JOIN1 = 'tr01_user.id = tr04_user_job_apply.user_id';
                $JOIN2 = 'tr01_user.id = tr01_user_address.user_id';;
                $JOIN3 = 'tr04_user_job_apply.job_id = tr04_create_jobs.id';
                $select = 'tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr04_create_jobs.job_title, tr04_user_job_apply.id, tr04_user_job_apply.status, tr04_user_job_apply.datetime';
                $where = array('tr04_user_job_apply.status' => 3);
                $data['apply_job'] = $this->PageModel->get_data_join($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where);


                $table = 'tr02_user_pages';
                $table1 = 'm05_business_username';
                $table2 = 'm03_category';
                $table3 = 'm02_country';
                $table4 = 'm02_state';
                $table5 = 'm02_city';
                $table6 = 'tr02_user_page_data';
                $select = 'tr02_user_pages.*, tr02_user_pages.page_id as page, m05_business_username.user_name, m03_category.name as category, m02_country.name as country, m02_country.id as country_id, m02_state.name as state, m02_state.id as state_id, m02_city.name as city, m02_city.id as city_id, tr02_user_page_data.*, ';
                $JOIN1 = 'tr02_user_pages.id = m05_business_username.page_id';
                $JOIN2 = 'tr02_user_pages.Business_category = m03_category.id';
                $JOIN3 = 'tr02_user_pages.country_location = m02_country.id';
                $JOIN4 = 'tr02_user_pages.state = m02_state.id';
                $JOIN5 = 'tr02_user_pages.city = m02_city.id';
                $JOIN6 = 'tr02_user_page_data on tr02_user_pages.id = tr02_user_page_data.page_id';
                $where = array('tr02_user_pages.id' => $page_name_already->page_id);
                $data['page_detail'] = $this->PageModel->get_data_join_1($table, $table1, $table2, $table3, $table4, $table5, $table6,
                    $select, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $JOIN5, $JOIN6, $where);

                $table = 'tr02_user_pages';
                $table1 = 'tr06_create_post';
                $table2 = 'm02_city';
                $table3 = 'm05_business_username';
                $JOIN = 'tr06_create_post.page_name = tr02_user_pages.id';
                $JOIN1 = 'm02_city.id = tr02_user_pages.city';
                $JOIN2 = 'm05_business_username.page_id = tr02_user_pages.id';
                $select = 'tr06_create_post.*, m02_city.name, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo, m05_business_username.user_name';
                $where = ['tr06_create_post.status' => 1, 'tr06_create_post.page_name' => $page_name_already->page_id];
                $order = 'id';
                $get_post_data = $this->RegisterModel->fetch_page_table($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $order, $select);
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
                $data['page_post_data'] = $get_post_data;
            }
        }
        $data['layout'] = $this->frontLayout($data);
        $this->load->view("timeline-page.tpl", $data);
    }

    public function video($video_id = 0)
    {
        $data = array();
        $seo = array();
        $data['title'] = 'Video | ' . WEBSITENAME . '';
        $data['layout'] = $this->frontLayout($data);

        if (empty($video_id)) {
            $table = 'tr02_video_data';
            $table1 = 'tr01_user';
            $table2 = 'tr02_public_video_like';
            $table3 = 'tr02_user_pages';
            $JOIN1 = 'tr02_video_data.user_id = tr01_user.id';
            $JOIN2 = 'tr02_video_data.id = tr02_public_video_like.video_id';
            $JOIN3 = 'tr02_video_data.page_id = tr02_user_pages.id';
            $select = 'tr02_video_data.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code, tr02_public_video_like.status as like_status, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo';
            $where = array('tr02_video_data.user_visibility' => 2, 'tr02_video_data.status' => 1);
            $order = 'id';
            $order_type = 'DESC';
            $JOIN_type = 'Left';
            $get_video = $this->VideoModel->fetch_data_two_order_result($table, $table1, $table2, $table3, $JOIN1, $JOIN2, $JOIN3, $select, $where, $JOIN_type, $order, $order_type);
            foreach ($get_video as $key => $video_list) {
                $table = 'tr02_public_video_like';
                $table1 = 'tr01_user';
                $select = 'COUNT(tr02_public_video_like.id) AS post_count, tr02_public_video_like.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
                $JOIN = 'tr01_user ON tr01_user.id = tr02_public_video_like.user_id';
                $order = 'tr02_public_video_like.id';
                $order_by = 'DESC';
                $Limit = '1';
                $where = ['tr02_public_video_like.video_id' => $video_list->id];
                $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
                $result[$key] = $video_list;
                $result[$key]->post_like = [];
                //$result[$key]->post_like = $get_post_like;
                foreach ($get_post_like as $user_like) {
                    $result[$key]->post_like = $get_post_like;
                }
            }
            $data['publish_video'] = $get_video;
            $this->load->view("videos.tpl", $data);
        } else {
            $table = 'tr02_video_data';
            $where = array('video_id' => $video_id);
            $get_video_id = $this->VideoModel->check_already_exist($table, $where);
            if (!empty($get_video_id)) {
                $table = 'tr02_video_data';
                $table1 = 'tr01_user';
                $table2 = 'tr02_public_video_like';
                $table3 = 'tr02_user_pages';
                $JOIN1 = 'tr02_video_data.user_id = tr01_user.id';
                $JOIN2 = 'tr02_video_data.id = tr02_public_video_like.video_id';
                $JOIN3 = 'tr02_video_data.page_id = tr02_user_pages.id';
                $select = 'tr02_video_data.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image, tr01_user.user_code, tr02_public_video_like.status as like_status, tr02_user_pages.page_name as user_page_name, tr02_user_pages.avatar_image, tr02_user_pages.business_Logo';
                $JOIN_type = 'Left';
                $where = ['tr02_video_data.video_id' => $video_id];
                $order = 'id';
                $order_type = 'DESC';
                $get_video = $this->VideoModel->fetch_data_two_order_result($table, $table1, $table2, $table3, $JOIN1, $JOIN2, $JOIN3, $select, $where, $JOIN_type, $order, $order_type);
                foreach ($get_video as $key => $video_list) {
                    $table = 'tr02_public_video_like';
                    $table1 = 'tr01_user';
                    $select = 'COUNT(tr02_public_video_like.id) AS post_count, tr02_public_video_like.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
                    $JOIN = 'tr01_user ON tr01_user.id = tr02_public_video_like.user_id';
                    $order = 'tr02_public_video_like.id';
                    $order_by = 'DESC';
                    $Limit = '1';
                    $where = ['tr02_public_video_like.video_id' => $video_list->id];
                    $order = 'id';
                    $order_by = 'DESC';
                    $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
                    $result[$key] = $video_list;
                    $result[$key]->post_like = [];
                    //$result[$key]->post_like = $get_post_like;
                    foreach ($get_post_like as $user_like) {
                        $result[$key]->post_like = $get_post_like;
                    }
                }
                $data['public_video'] = $get_video;
                $this->load->view("single_video.tpl", $data);

            }
        }

    }


    public function Media()
    {
        $data = array();
        $seo = array();
        $data['title'] = 'Media | ' . WEBSITENAME . '';
        $data['layout'] = $this->frontLayout($data);

        $table = 'tr02_photos_data';
        $table1 = 'tr02_public_photo_like';
        $table2 = 'tr01_user';
        $table3 = 'tr02_user_pages';
        $table4 = 'm02_city';
        $table5 = 'm05_business_username';
        $JOIN = 'tr02_public_photo_like.photo_id = tr02_photos_data.id';
        $JOIN1 = 'tr01_user.id = tr02_photos_data.user_id';
        $JOIN2 = 'tr02_user_pages.id = tr02_photos_data.page_id';
        $JOIN3 = 'tr02_user_pages.city = m02_city.id';
        $JOIN4 = 'tr02_user_pages.id = m05_business_username.page_id';
        $select = 'tr02_photos_data.*, tr02_public_photo_like.status as like_status, tr02_public_photo_like.user_id as liked_user, tr01_user.first_name, tr01_user.last_name, tr01_user.user_code,
                                       tr02_user_pages.page_name, tr01_user.profile_image, tr02_user_pages.business_Logo, m05_business_username.user_name, m02_city.name as city_name';
        $where = array('tr02_photos_data.user_visibility' => 2, 'tr02_photos_data.status' => 1);
        $order = 'id';
        $JOIN_Type = 'Left';
        $media_data = $this->PublicMediaModel->two_table_join($table, $table1, $table2, $table3, $table4, $table5, $JOIN, $JOIN1, $JOIN2, $JOIN3, $JOIN4, $select, $where, $order, $JOIN_Type);
        foreach ($media_data as $key => $media) {
            $table = 'tr02_public_photo_like';
            $table1 = 'tr01_user';
            $select = 'COUNT(tr02_public_photo_like.id) AS post_count, tr02_public_photo_like.* ,tr01_user.first_name, tr01_user.last_name, tr01_user.user_code, tr01_user.profile_image';
            $JOIN = 'JOIN tr01_user ON tr01_user.id = tr02_public_photo_like.user_id';
            $order = 'tr02_public_photo_like.id';
            $order_by = 'DESC';
            $Limit = '1';
            $where = ['tr02_public_photo_like.photo_id' => $media->id];
            $get_post_like = $this->RegisterModel->join_two_table_limit($table, $table1, $select, $JOIN, $order, $order_by, $Limit, $where);
            $result[$key] = $media;
            $result[$key]->post_like = [];
            foreach ($get_post_like as $v) {
                $result[$key]->post_like = $get_post_like;
            }
        }
        $data['public_media'] = $media_data;

        $this->load->view("albums.tpl", $data);
    }

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

    public function insert_post()
    {
        if (empty($this->session->userdata('id'))) {
            $response = ['status' => 3, 'message' => 'login your account.'];
        } else {
            $post_content = $this->input->post('post_content');
            $publish_story = $this->input->post('publish_story');
            $page_name = $this->input->post('page_name');
            $tag_friends = $this->input->post('tag_friends');
            $image = '';
            $video_upload = '';
            $datetime = date('Y-m-d h:i:s');
            $year = date('Y');
            $date = date('d');
            $month = date('m');
            $hours = date('h');
            $min = date('m');
            $sec = date('s');
            $post_story_id = random_number($year, $date, $month, $hours, $min, $sec);
            $page_id = generate_random();

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
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $image = $_FILES['postimg']['name'];
                $arr = explode('.', $image);
                $image = end($arr);
                if ($image == 'jpeg' || $image == 'jpg' || $image == 'png') {
                    $check = uploadimgfile("postimg", $folder = "", $prefix = "profile_");
                    $image = $check['data']['name'];
                    if ($image) {
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
                    } else {
                        $response = array('status' => 0, 'message' => 'Image are not uploaded');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'select correct image ');
                }
            }
        }
        echo json_encode($response);
    }

    function get_blog(){
        $table = 'tr08_user_blog';
        $table1 = 'm05_business_username';
        $Join = 'tr08_user_blog.page_id = m05_business_username.page_id';
        $where = ['tr08_user_blog.status'  => 1];
        $limit = 5;
        $select = 'tr08_user_blog.*, m05_business_username.user_name';
        $type = 'result';
        $get_blog_data = $this->FeedModel->Get_data($table, $table1, $Join, $where, $limit, $select, $type);

        return $get_blog_data;
    }

    function get_user_data(){
        $id = $this->input->post('val1');
        $table1 = $this->input->post('val2');
        $table = 'tr01_user_experience';
        $where = ['user_id' => $id];
        $get_data = $this->FeedModel->checkvalidation($table, $where);
        echo json_encode($get_data);
    }
}
