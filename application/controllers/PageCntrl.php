<?php
defined('BASEPATH') or exit('No direct script access allowed');

class PageCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->model(array('PageModel', 'RegisterModel'));
        $data['country'] = get_country();
    }

    public function page_review()
    {
        $user_id = $this->session->userdata('id');
        if (!empty($user_id)) {
            $page_id = $this->input->post('page_id');
            $rating = $this->input->post('rating');
            $comment = $this->input->post('comment');
            $datetime = date('Y-m-d h:i:s');
            if (!empty($page_id)) {
                if (empty($rating)) {
                    $response = array('status' => 0, 'message' => 'Enter rating');
                } else if (empty($comment)) {
                    $response = array('status' => 0, 'message' => 'Enter Comment');
                } else {
                    $data = array(
                        'user_id' => $user_id,
                        'page_id' => $page_id,
                        'rating' => $rating,
                        'comment' => $comment,
                        'datetime' => $datetime,
                        'status' => 1
                    );
                    $table = 'tr02_page_review';
                    $result['insert_rating'] = $this->PageModel->insert_all($table, $data);
                    if ($result) {
                        $response = array('status' => 200, 'message' => 'rating saved');
                    } else {
                        $response = array('status' => 0, 'message' => 'Enter rating');
                    }
                }
            } else {
                $response = array('status' => 0, 'message' => 'Page id are blank');
            }
        } else {
            $response = array('status' => 3, 'message' => 'Login your account');
        }
        echo json_encode($response);
    }


    public function fetch_page()
    {
        $page_name = 'ANubhav';
        $table = 'tr02_user_pages';
        $where = array('page_name' => $page_name);
        $data = $this->PageModel->checkvalidation($table, $where);
        if ($data) {
            $response = array('status' => 1, 'page_id' => $data->id);
        } else {
            $response = array('status' => 0);
        }
        echo json_encode($response);
    }

    public function make_pages()
    {
        //check session function

        $data = array();
        $seo = array();

        $seo['url'] = site_url("/make_pages");
        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
        $data = $seo;
        $table = 'm03_category';
        $where = array('status' => 1);
        $select = 'id, name';
        $data['category'] = $this->PageModel->fetch_data($table, $where, $select);

        $table = 'm02_country';
        $data['country'] = $this->PageModel->fetch_page_data($table, $where);

        $table = 'm02_state';
        $data['state'] = $this->PageModel->fetch_page_data($table, $where);

        $table = 'm02_city';
        $data['city'] = $this->PageModel->fetch_page_data($table, $where);

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("create-page.tpl", $data);
    }

    function get_avtar($nameFirstChar)
    {
        $table = 'm00_avatar';
        $where = array('avatar_name' => ucfirst($nameFirstChar));
        $avatar = $this->PageModel->checkvalidation($table, $where);
        return $avatar;
    }

    function get_avtar_banner($nameFirstChar)
    {
        $table = 'm00_avatar_banner';
        $where = array('avatar_name' => ucfirst($nameFirstChar));
        $avatar = $this->PageModel->checkvalidation($table, $where);
        return $avatar;
    }

    public function insert_data()
    {
        $user_name = $this->input->post('user_name');
        if (empty($user_name)) {
            $response = array('status' => 0, 'message' => 'User Name are not Blank.');
        } else {
            $page_name = $this->input->post('page_name');
            if (empty($page_name)) {
                $response = array('status' => 0, 'message' => 'Page Name are not Blank.');
            } else {
                $table = 'tr02_user_pages';
                $where = array('page_name' => $page_name);
                $page_name_already = $this->PageModel->check_data($table, $where);
                if ($page_name_already) {
                    $response = array('status' => 0, 'message' => 'Page Name already exist.');
                } else {
                    $Country = $this->input->post('Country');
                    if (empty($Country)) {
                        $response = array('status' => 0, 'message' => 'Select Your Country.');
                    } else {
                        $state_list = $this->input->post('state_list');
                        if (empty($state_list)) {
                            $response = array('status' => 0, 'message' => 'Select Your State.');
                        } else {
                            $city = $this->input->post('city');
                            if (empty($city)) {
                                $response = array('status' => 0, 'message' => 'Select Your City.');
                            } else {
                                $category = $this->input->post('category');
                                if (empty($category)) {
                                    $response = array('status' => 0, 'message' => 'Category are not Blank.');
                                } else {
                                    $page_description = $this->input->post('page_description');
                                    if (empty($page_description)) {
                                        $response = array('status' => 0, 'message' => 'Page Description are not Blank.');
                                    } else {
                                        $nameFirstChar = $page_name[0];
                                        $get_avtar = $this->get_avtar($nameFirstChar);
                                        $get_avtar_banner = $this->get_avtar_banner($nameFirstChar);
                                        if (empty($get_avtar)) {
                                            $response = array('status' => 0, 'message' => 'Avatar image not found');
                                        } else {
                                            $length = "15";
                                            $char = "0123456789";
                                            $random = substr(str_shuffle($char), 0, $length);
                                            $data = array(
                                                'user_id' => $this->session->userdata('id'),
                                                'page_name' => $page_name,
                                                'country_location' => $Country,
                                                'state' => $state_list,
                                                'city' => $city,
                                                'Business_category' => $category,
                                                'page_id' => $random,
                                                'business_Logo' => '',
                                                'avatar_image' => $get_avtar->avatar_image,
                                                'cover_image' => $get_avtar_banner->image,
                                                'status' => 1,
                                                'datetime' => date('Y-m-d h:i:s')
                                            );
                                            $insert_page = $this->PageModel->insert_all($table, $data);
                                            if (empty($insert_page)) {
                                                $response = array('status' => 0, 'message' => 'Page not created');
                                            } else {
                                                $data = array(
                                                    'page_id' => $insert_page,
                                                    'business_email' => '',
                                                    'website_link' => '',
                                                    'page_description' => $page_description,
                                                    'status' => 1,
                                                    'user_visibility_status' => 1,
                                                    'datetime' => date('Y-m-d h:i:s')
                                                );
                                                $table = 'tr02_user_page_data';
                                                $page_data = $this->PageModel->insert_all($table, $data);
                                                if (empty($page_data)) {
                                                    $response = array('status' => 0, 'message' => 'Page data not created');
                                                } else {
                                                    $data = array(
                                                        'user_name' => $user_name,
                                                        'user_id' => $this->session->userdata('id'),
                                                        'page_id' => $insert_page,
                                                        'status' => 1,
                                                        'datetime' => date('Y-m-d h:i:s')
                                                    );
                                                    $table = 'm05_business_username';
                                                    $insert_user_name = $this->PageModel->insert_all($table, $data);
                                                    if ($insert_user_name) {
                                                        $response = array('status' => 200, 'message' => 'Your page ' . $page_name . ' are Successfully Created.');
                                                    } else {
                                                        $response = array('status' => 0, 'message' => 'some Technical issue.');
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        echo json_encode($response);
    }


    public function Check_username()
    {
        $username = $this->input->post('user_name');
        $table = 'm05_business_username';
        $where = array('user_name' => $username);
        $check_user_name = $this->PageModel->checkvalidation($table, $where);
        if ($check_user_name) {
            $response = array('status' => 0, 'message' => 'user name are already available');
        } else {
            $response = array('status' => 1, 'message' => 'user name are available');
        }
        echo json_encode($response);
    }

    public function my_pages()
    {
        $id = $this->session->userdata('id');
        $data = array();
        $seo = array();

        $data['url'] = base_url("/make");
        $data['title'] = "User Discover - " . WEBSITENAME;
        $data['metatitle'] = "user Discover - " . WEBSITENAME;
        $data['metadescription'] = "user Discover - " . WEBSITENAME;

        $table = 'tr02_user_pages';
        $table1 = 'm05_business_username';
        $table2 = 'm03_category';
        $table3 = 'm02_city';
        $select = 'tr02_user_pages.page_name,tr02_user_pages.avatar_image, m02_city.name as city, tr02_user_pages.page_id, m05_business_username.user_name, m03_category.name, tr02_user_pages.business_Logo';
        $JOIN1 = 'm05_business_username on m05_business_username.page_id = tr02_user_pages.id';
        $JOIN2 = 'm03_category.id = tr02_user_pages.Business_category';
        $JOIN3 = 'm02_city.id = tr02_user_pages.city';
        $where = array('tr02_user_pages.status' => 1, 'tr02_user_pages.user_id' => $id);
        $data['user_page'] = $this->PageModel->get_data_join($table, $table1, $table2, $table3, $select, $JOIN1, $JOIN2, $JOIN3, $where);

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("my_pages.tpl", $data);
    }

    public function update_page()
    {
        $page_id = $this->input->post('page_id');
        $business_category = $this->input->post('business_category');
        $business_email = $this->input->post('business_email');
        $business_address = $this->input->post('business_address');
        $website_link = $this->input->post('website');
        $get_country = $this->input->post('get_country');
        $state_list = $this->input->post('state_list');
        $city_list = $this->input->post('city_list');
        $about = $this->input->post('about');
        $datetime = date('Y-m-d h:i:s');
        $pin_code = $this->input->post('pin_code');
        $user_visibility_status = 1;
        $status = 1;
        $business_tag = $this->input->post('tag');


        $table = 'tr02_user_pages';
        $where = array('page_id' => $page_id);
        $page_data = $this->PageModel->check_data($table, $where);
        if (empty($business_category)) {
            $response = array('status' => 201, 'message' => 'Select Page category.');
        } else if (empty($business_email)) {
            $response = array('status' => 201, 'message' => 'Enter your page email.');
        } else if (empty($business_address)) {
            $response = array('status' => 201, 'message' => 'Enter your page address.');
        } else if (empty($get_country)) {
            $response = array('status' => 201, 'message' => 'Select your business country.');
        } else if (empty($state_list)) {
            $response = array('status' => 201, 'message' => 'Select your business state.');
        } else if (empty($city_list)) {
            $response = array('status' => 201, 'message' => 'Select your business City.');
        } else if (empty($pin_code)) {
            $response = array('status' => 201, 'message' => 'Enter Pin code.');
        } else if (empty($about)) {
            $response = array('status' => 201, 'message' => 'Enter your page Description.');
        } else {
            $data = array(
                'country_location' => $get_country,
                'state' => $state_list,
                'city' => $city_list,
                'pin_code' => $pin_code,
                'address' => $business_address,
                'Business_category' => $business_category,
            );
            $page_data_update = $this->PageModel->update_all($table, $where, $data);
            if (!empty($page_data_update)) {
                $table = 'tr02_user_page_data';
                $where = array('page_id' => $page_data->id);
                $page_second_data = $this->PageModel->check_data($table, $where);
                if (!empty($page_second_data)) {
                    $data = array(
                        'business_email' => $business_email,
                        'website_link' => $website_link,
                        'page_description' => $about,
                    );

                    $page_second_update = $this->PageModel->update_all($table, $where, $data);
                    if ($page_second_update) {
                        $response = array('status' => 200, 'message' => 'Data are update successfully');
                    } else {
                        $response = array('status' => 201, 'message' => 'Data are not updated.');
                    }
                } else {
                    $data = array(
                        'page_id' => $page_data->id,
                        'business_email' => $business_email,
                        'website_link' => $website_link,
                        'page_description' => $about,
                        'datetime' => $datetime,
                        'status' => $status,
                        'user_visibility_status' => $user_visibility_status,
                    );
                    $page_second_insert = $this->PageModel->insert_all($table, $data);
                    if ($page_second_insert) {
                        $response = array('status' => 200, 'message' => 'Data are update successfully');
                    } else {
                        $response = array('status' => 201, 'message' => 'Data are not updated.');
                    }
                }
            }
        }
        echo json_encode($response);
    }

    public function update_about_page()
    {
        $page_id = $this->input->post('page_id');
        $business_category = $this->input->post('business_category');
        $business_email = $this->input->post('business_email');
        $business_address = $this->input->post('business_address');
        $website_link = $this->input->post('website');
        $get_country = $this->input->post('get_country');
        $state_list = $this->input->post('state_list');
        $city_list = $this->input->post('city_list');
        $pin_code = $this->input->post('pin_code');
        $about = $this->input->post('about');
        $datetime = date('Y-m-d h:i:s');
        $user_visibility_status = 1;
        $status = 1;

        $table = 'tr02_user_pages';
        $where = array('page_id' => $page_id);
        $page_data = $this->PageModel->check_data($table, $where);
        if (empty($business_category)) {
            $response = array('status' => 201, 'message' => 'Select Page category.');
        } else if (empty($business_email)) {
            $response = array('status' => 201, 'message' => 'Enter your page email.');
        } else if (empty($business_address)) {
            $response = array('status' => 201, 'message' => 'Enter your page address.');
        } else if (empty($get_country)) {
            $response = array('status' => 201, 'message' => 'Select your business country.');
        } else if (empty($state_list)) {
            $response = array('status' => 201, 'message' => 'Select your business state.');
        } else if (empty($city_list)) {
            $response = array('status' => 201, 'message' => 'Select your business City.');
        } else if (empty($pin_code)) {
            $response = array('status' => 201, 'message' => 'Enter Pin code.');
        } else if (empty($about)) {
            $response = array('status' => 201, 'message' => 'Enter your page Description.');
        } else {
            $data = array(
                'country_location' => $get_country,
                'state' => $state_list,
                'city' => $city_list,
                'pin_code' => $pin_code,
                'address' => $business_address,
                'Business_category' => $business_category,
            );
            $page_data_update = $this->PageModel->update_all($table, $where, $data);
            if (!empty($page_data_update)) {
                $table = 'tr02_user_page_data';
                $where = array('page_id' => $page_data->id);
                $page_second_data = $this->PageModel->check_data($table, $where);
                if (!empty($page_second_data)) {
                    $data = array(
                        'business_email' => $business_email,
                        'website_link' => $website_link,
                        'page_description' => $about,
                    );
                    $page_second_update = $this->PageModel->update_all($table, $where, $data);
                    if ($page_second_update) {
                        $response = array('status' => 200, 'message' => 'Data are update successfully');
                    } else {
                        $response = array('status' => 201, 'message' => 'Data are not updated.');
                    }
                } else {
                    $data = array(
                        'page_id' => $page_data->id,
                        'business_email' => $business_email,
                        'website_link' => $website_link,
                        'page_description' => $about,
                        'datetime' => $datetime,
                        'status' => $status,
                        'user_visibility_status' => $user_visibility_status,
                    );
                    $page_second_insert = $this->PageModel->insert_all($table, $data);
                    if ($page_second_insert) {
                        $response = array('status' => 200, 'message' => 'Data are update successfully');
                    } else {
                        $response = array('status' => 201, 'message' => 'Data are not updated.');
                    }
                }
            }
        }
        echo json_encode($response);
    }

    public function get_State()
    {
        $country = $this->input->post('country');
        $table = 'm02_state';
        $where = array('country_id' => $country, 'status' => 1);
        $order = 'name';
        $data = $this->PageModel->fetch_data_order($table, $where, $order);
        echo json_encode($data);
    }

    public function get_city()
    {
        if ($this->session->userdata('id') == null) {
            redirect('');
        }
        $state = $this->input->post('state');

        $table = 'm02_city';
        $where = array('state_id' => $state, 'status' => 1);
        $order = 'name';
        $data = $this->PageModel->fetch_data_order($table, $where, $order);
        echo json_encode($data);
    }

    public function inset_follow()
    {
        $user_id = $this->session->userdata('id');
        if (empty($user_id)) {
            $response = ['status' => 3, 'message' => 'Some issue on the server side'];
        } else {
            $page_id = $this->input->post('page_id');
            $user_id = $this->session->userdata('id');
            $status = 1;
            $datetime = date('Y-m-d h:i:s');

            if (!empty($user_id)) {
                if (!empty($page_id)) {
                    $table = 'tr02_user_page_follow';
                    $where = array('page_id' => $page_id, 'user_id' => $user_id);
                    $check_follow = $this->PageModel->checkvalidation($table, $where);
                    if ($check_follow) {
                        if ($check_follow->status == 0) {
                            $data = array(
                                'status' => 1,
                            );
                            $update_follow = $this->PageModel->update_all($table, $where, $data);
                            if ($update_follow) {
                                $where = array('id' => $update_follow);
                                $get_follow = $this->PageModel->checkvalidation($table, $where);
                                if ($get_follow) {
                                    $response = array('status' => 1, 'message' => 'Follow', 'follow_status' => $get_follow->status);
                                } else {
                                    $response = array('status' => 0, 'message' => 'server issue');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'server issue');
                            }
                        } else if ($check_follow->status == 1) {
                            $data = array(
                                'status' => 0,
                            );
                            $update_follow = $this->PageModel->update_all($table, $where, $data);
                            if ($update_follow) {
                                $where = array('id' => $update_follow);
                                $get_follow = $this->PageModel->checkvalidation($table, $where);
                                if ($get_follow) {
                                    $response = array('status' => 1, 'message' => 'Follow', 'follow_status' => $get_follow->status);
                                } else {
                                    $response = array('status' => 0, 'message' => 'server issue');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'server issue');
                            }
                        } else {
                            $data = array(
                                'page_id' => $page_id,
                                'user_id' => $user_id,
                                'status' => $status,
                                'datetime' => $datetime,
                            );
                            $insert_follow = $this->PageModel->insert_all($table, $data);
                            if ($insert_follow) {
                                $where = array('id' => $insert_follow);
                                $get_follow = $this->PageModel->checkvalidation($table, $where);
                                if ($get_follow) {
                                    $response = array('status' => 1, 'message' => 'Follow', 'follow_status' => $get_follow->status);
                                } else {
                                    $response = array('status' => 0, 'message' => 'server issue');
                                }
                            } else {
                                $response = array('status' => 0, 'message' => 'server issue');
                            }
                        }
                    } else {
                        $data = array(
                            'page_id' => $page_id,
                            'user_id' => $user_id,
                            'status' => $status,
                            'datetime' => $datetime,
                        );
                        $insert_follow = $this->PageModel->insert_all($table, $data);
                        if ($insert_follow) {
                            $where = array('id' => $insert_follow);
                            $get_follow = $this->PageModel->checkvalidation($table, $where);
                            if ($get_follow) {
                                $response = array('status' => 1, 'message' => 'Follow', 'follow_status' => $get_follow->status);
                            } else {
                                $response = array('status' => 0, 'message' => 'server issue');
                            }
                        } else {
                            $response = array('status' => 0, 'message' => 'server issue');
                        }
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'server issue');
                }
            } else {
                $response = array('status' => 0, 'message' => 'server issue');
            }
        }
        echo json_encode($response);
    }

    public function Fetch_edit_data()
    {
        $blog_id = $this->input->post('blog_id');
        $table = 'tr08_user_blog';
        $where = array('id' => $blog_id);
        $data = $this->PageModel->check_data($table, $where);
        echo json_encode($data);
    }
}
												