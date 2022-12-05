<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ApiCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        echo (date_default_timezone_set("Asia/Kolkata"));
//        $this->load->helper(array('form','language','url'));
//        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->model(array('RegisterModel'));
    }
}
