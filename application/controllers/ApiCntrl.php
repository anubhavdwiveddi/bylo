<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ApiCntrl extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        date_default_timezone_set('Asia/Kolkata');
        $this->load->helper(array('form', 'language', 'url', 'utility', 'cookie', 'string'));
        $this->load->library('encryption');
        //$this->load->model('Api_model');
        date_default_timezone_set("Asia/Kolkata");
    }

    public function state()
    {
        $response = array('status'   => 1);
        api_response($response);
    }
    
}
