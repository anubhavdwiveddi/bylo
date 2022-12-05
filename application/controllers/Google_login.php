<?php
       defined('BASEPATH') OR exit('No direct script access allowed');
       
       class Google_login extends CI_Controller {
              
              public function __construct()
              {
                     parent::__construct();
                     //$this->load->model('google_login_model');
              }
              
              function login()
              {
                     include_once APPPATH . "libraries/Google/autoload.php";
                     
                     $google_client = new Google_Client();
                     
                     $google_client->setClientId('357399474182-fvd7c845moof96odv8tmauji8cc08pe7.apps.googleusercontent.com'); //Define your ClientID
                     
                     $google_client->setClientSecret('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'); //Define your Client Secret Key
                     
                     $google_client->setRedirectUri('http://localhost/blog'); //Define your Redirect Uri
                     
                     $google_client->addScope('email');
                     
                     $google_client->addScope('profile');
                     
                     if(isset($_GET["code"]))
                     {
                            
                            $token = $google_client->fetchAccessTokenWithAuthCode($_GET["code"]);
                            if(!isset($token["error"]))
                            {
                                   $google_client->setAccessToken($token['access_token']);
                                   
                                   $this->session->set_userdata('access_token', $token['access_token']);
                                   
                                   $google_service = new Google_Service_Oauth2($google_client);
                                   
                                   $data = $google_service->userinfo->get();
                                   
                                   $current_datetime = date('Y-m-d H:i:s');
                                   
                                   if($this->google_login_model->Is_already_register($data['id']))
                                   {
                                          //update data
                                          $user_data = array(
                                                    'first_name' => $data['given_name'],
                                                    'last_name'  => $data['family_name'],
                                                    'email_address' => $data['email'],
                                                    'profile_picture'=> $data['picture'],
                                                    'updated_at' => $current_datetime
                                          );
                                          
                                          $update_data = $this->google_login_model->Update_user_data($user_data, $data['id']);
                                          
                                   }
                                   else
                                   {
                                          //insert data
                                          $user_data = array(
                                                    'login_oauth_uid' => $data['id'],
                                                    'first_name'  => $data['given_name'],
                                                    'last_name'   => $data['family_name'],
                                                    'email_address'  => $data['email'],
                                                    'profile_picture' => $data['picture'],
                                                    'created_at'  => $current_datetime
                                          );
                                          
                                          $insert_data = $this->google_login_model->Insert_user_data($user_data);
                                          if($insert_data){
                                                 $google_client->setRedirectUri('http://localhost/blog'); //Define your Redirect Uri
                                          }
                                   }
                                   $this->session->set_userdata('user_data', $user_data);
                            }
                     }
                     $value = $this->input->post('value');
                     if($value){
                            $login_button = '';
                            if(!$this->session->userdata('access_token'))
                            {
                                   $login_button = '<a href="'.$google_client->createAuthUrl().'"><img src="'.base_url().'/asset/sign-in-with-google.png" /></a>';
                                   $data['login_button'] = $login_button;
                                   $this->load->view('google_login', $data);
                            }
                     }
                     else
                     {
                            $this->load->view('google_login', $data);
                     }
              }
       }