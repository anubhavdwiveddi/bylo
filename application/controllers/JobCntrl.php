<?php
defined('BASEPATH') or exit('No direct script access allowed');

class JobCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        is_login();
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->model(array('JobsModel'));
    }

    public function jobs($city=0, $job_title=0, $job_id=0)
    {
        //print_r(str_replace("-"," ",$city));
        //print_r(str_replace("-"," ",$job_title));
        $data = array();
        $data['layout'] = $this->frontLayout($data);
        if(empty($city) && empty($job_title) && empty($job_id)){
            $table  = 'tr04_create_jobs';
            $table1 = 'tr04_jobs_second';
            $table2 = 'm02_city';
            $select = 'tr04_jobs_second.*, tr04_create_jobs.*, m02_city.name as city';
            $JOIN = 'tr04_jobs_second.job_id = tr04_create_jobs.id';
            $JOIN1 = 'tr04_jobs_second.city = m02_city.id';
            $where  = array('status', 1);
            $data['job_list']   = $this->JobsModel->fetch_page_data_join($table, $table1, $table2, $select, $JOIN, $JOIN1, $where);

            $table = 'tr01_user';
            $table1 = 'tr01_user_address';
            $table3 = 'm02_state';
            $JOIN = 'tr01_user.id = tr01_user_address.user_id';
            $JOIN1 = 'tr01_user_address.city = m02_city.id';
            $JOIN2 = 'tr01_user_address.state = m02_state.id';
            $select = 'tr01_user.first_name, tr01_user.last_name, tr01_user.email, tr01_user.mobile, m02_city.name as City, m02_state.name as state, tr01_user_address.pin_code, ';
            $where = array('tr01_user.id' => $this->session->userdata('id'));
            $data['user_details'] = $this->JobsModel->fetch_data_order_multiple($table, $table1, $table2, $table3, $JOIN, $JOIN1, $JOIN2, $where, $select);

            $table = 'tr01_user_experience';
            $where = array('user_id'    => $this->session->userdata('id'));
            $order = 'id';
            $data['user_experience'] = $this->JobsModel->fetch_data_order_desc($table, $where, $order);

            $table = 'tr01_user_education';
            $data['user_education'] = $this->JobsModel->fetch_data_order_desc($table, $where, $order);

            $this->load->view("jobs.tpl", $data);
        }else if(!empty($job_id)){
            $table  = 'tr04_create_jobs';
            $table1 = 'tr04_jobs_second';
            $select = 'tr04_create_jobs.*, tr04_jobs_second.*';
            $JOIN   = 'tr04_jobs_second.job_id = tr04_create_jobs.id';
            $where  = array('tr04_jobs_second.create_job_id'    => $job_id);
            $data['job_details'] = $this->JobsModel->fetch__two_table_job_data($table, $table1, $select, $JOIN, $where);

            $this->load->view('job_details.tpl', $data);
        }
    }

    public function create_job()
    {
        $data = array();
        //access user login id
        $id = $this->session->userdata('id');

        // Get login user page name
        $table = 'tr02_user_pages';
        $where = array('status' => 1, 'user_id' => $id);
        $select = 'page_name, id';
        $data['user_page'] = $this->JobsModel->Fetch_data($table, $where, $select);

        $data['layout'] = $this->frontLayout($data);
        $this->load->view('create_job.tpl', $data);
    }

    public function insert_job()
    {
        $page_id = $this->input->post('page_id');
        $job_title = $this->input->post('job_title');
        $job_role = $this->input->post('job_role');
        $job_category = $this->input->post('job_category');
        $report_location = $this->input->post('report_location');
        $contract = $this->input->post('contract');
        $schedule_job = $this->input->post('schedule_job');
        $salary = $this->input->post('salary');
        $supplimental = $this->input->post('supplimental');
        $benefits = $this->input->post('benefits');
        $number = $this->input->post('number');
        $received_mail = $this->input->post('received_mail');
        $sent_mail = $this->input->post('sent_mail');
        $check_star = $this->input->post('chkPinNo');
        $star_date = $this->input->post('star_date');
        $check_end = $this->input->post('chkPinNo1');
        $end_date = $this->input->post('end_date');
        $resume = $this->input->post('resume');
        $covid = $this->input->post('covid');
        $company_name = $this->input->post('company_name');
        $education = $this->input->post('education');
        $address = $this->input->post('address');
        $country = $this->input->post('country');
        $state = $this->input->post('state');
        $city = $this->input->post('city');
        $pin_code = $this->input->post('pin_code');
        $quantity = $this->input->post('quantity');
        $description = $this->input->post('description');
        $datetime = date('Y-m-d h:i:s');
        $date = date('Y-m-d');
        $image = '';
        if (empty($page_id)) {
            $response = array('status' => 0, 'message' => 'Page id are not blank');
        } else if (empty($job_title)) {
            $response = array('status' => 0, 'message' => 'Enter your Job title');
        } else if (empty($job_role)) {
            $response = array('status' => 0, 'message' => 'Select job Role.');
        } else if (empty($job_category)) {
            $response = array('status' => 0, 'message' => 'Select job Category.');
        } else if (empty($report_location)) {
            $response = array('status' => 0, 'message' => 'Select job report location.');
        } else if (empty($education)) {
            $response = array('status' => 0, 'message' => 'Enter education Qualification.');
        } else if (empty($address)) {
            $response = array('status' => 0, 'message' => 'Enter Job address.');
        } else if (empty($country)) {
            $response = array('status' => 0, 'message' => 'Select your job country .');
        } else if (empty($state)) {
            $response = array('status' => 0, 'message' => 'Select your job state .');
        } else if (empty($city)) {
            $response = array('status' => 0, 'message' => 'Select your job city.');
        } else if ($quantity == 0) {
            $response = array('status' => 0, 'message' => 'Enter the Hire member.');
        } else if (empty($salary)) {
            $response = array('status' => 0, 'message' => 'Enter Salary & Benefits.');
        } else if (empty($supplimental)) {
            $response = array('status' => 0, 'message' => 'Enter supplimental pay offered.');
        } else if (empty($benefits)) {
            $response = array('status' => 0, 'message' => 'Enter benefits.');
        } else if (empty($number)) {
            $response = array('status' => 0, 'message' => 'Enter Number.');
        } else if (empty($received_mail)) {
            $response = array('status' => 0, 'message' => 'Enter received mail address.');
        } else if (empty($sent_mail)) {
            $response = array('status' => 0, 'message' => 'Enter sent mail address.');
        } else if (empty($description)) {
            $response = array('status' => 0, 'message' => 'Enter description.');
        } else {
            if (!empty($_FILES['image']['name'])) {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $img = $_FILES['image']['name'];
                $arr = explode('.', $img);
                $image = end($arr);
                if ($image == 'jpeg' || $image == 'jpg' || $image == 'png') {
                    $check = uploadimgfile("image", $folder = "", $prefix = "profile_");
                    $image = $check['data']['name'];
                    if ($image) {
                        $contract_type = implode(",", $contract);
                        $schedule = implode(",", $schedule_job);
                        $offer = implode(",", $supplimental);
                        $benefits_offer = implode(",", $benefits);
                        $data = array(
                            'user_id' => $this->session->userdata('id'),
                            'page_id' => $page_id,
                            'job_title' => $job_title,
                            'contract_type' => $contract_type,
                            'schedule_job' => $schedule,
                            'salary_benefit' => $salary,
                            'supplimental' => $offer,
                            'benefits' => $benefits_offer,
                            'mobile_number' => $number,
                            'resume_receive_mail' => $received_mail,
                            'job_update_mail' => $sent_mail,
                            'start_job_status' => $check_star,
                            'start_job_date' => $star_date,
                            'job_end_status' => $check_end,
                            'job_end_date' => $end_date,
                            'resume_status' => $resume,
                            'covid2019' => $covid,
                            'description' => $description,
                            'datetime' => $datetime,
                            'status' => 1
                        );
                        $table = 'tr04_create_jobs';
                        $job_id = $this->JobsModel->insert_all($table, $data);
                        if ($job_id) {
                            $data = array(
                                'job_id' => $job_id,
                                'company_name' => $company_name,
                                'role' => $job_role,
                                'job_category' => $job_category,
                                'report_location' => $report_location,
                                'education' => $education,
                                'address' => $address,
                                'country' => $country,
                                'state' => $state,
                                'city' => $city,
                                'pin_code' => $pin_code,
                                'number_of_hires' => $quantity,
                                'image' => $image,
                                'date' => $date,
                                'date_time' => $datetime,
                                'status' => 1
                            );
                            $table = 'tr04_jobs_second';
                            $data['job'] = $this->JobsModel->insert_all($table, $data);
                            if ($data) {
                                $response = array('status' => 200, 'message' => 'Job are create successfully');
                            } else {
                                $response = array('status' => 200, 'message' => 'Job are create successfully');
                            }
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'Logo are not Upload');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'Select correct file format');
                }
            } else {
                $response = array('status' => 0, 'message' => 'select your jobs Logo');
            }
        }
        echo json_encode($response);
    }

    public function apply_user_jobs(){
        $job_id = $this->input->post('job_id');
        $checkbox = $this->input->post('checkbox');
        $about = $this->input->post('about');
        $date = date('Y-m-d');
        $datetime = date('Y-m-d h:i:s');
        if(!empty($job_id)){
            $table= 'tr04_user_job_apply';
            $where = array('user_id'    => $this->session->userdata('id'), 'job_id' => $job_id);
            $already_apply = $this->JobsModel->checkvalidation($table, $where);
            if(empty($checkbox)){
                $response = array('status'  => 0, 'message' => 'Click to checkbox');
            }else if ($already_apply){
                $response = array('status'  => 0, 'message' => 'You have already apply this job');
            }else {
                $data = array(
                    'job_id'    => $job_id,
                    'user_id'    => $this->session->userdata('id'),
                    'checkbox_status'   => $checkbox,
                    'status'   => 1,
                    'date'   => $date,
                    'datetime'   => $datetime,
                );
                $data = $this->JobsModel->insert_all($table, $data);
                if($data){
                    $response = array('status'  => 1, 'message' => 'You have successfully applied for this job');
                }else {
                    $response = array('status'  => 0, 'message' => 'There are some issue');
                }
            }
        }else {
            $response = array('status'  => 0, 'message' => 'There are some technical issue');
        }
        echo json_encode($response);
    }

    public function fetch_job_data(){
        $job_id = $this->input->post('job_id');
        $table = 'tr04_create_jobs';
        $table1 = 'tr04_jobs_second';
        $JOIN = 'tr04_create_jobs.id = tr04_jobs_second.job_id';
        $select = 'tr04_create_jobs.*, tr04_create_jobs.id as job_id, tr04_jobs_second.*';
        $where = array('tr04_create_jobs.id' => $job_id);
        $data = $this->JobsModel->fetch__two_table_job_data($table, $table1, $select, $JOIN, $where);
        echo json_encode($data);
    }


}
