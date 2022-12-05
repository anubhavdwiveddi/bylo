<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ScrollCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form','language','url', 'utility'));
        is_login();
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->model(array('FeedModel'));
    }

}