<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller
{
    //set the class variable.

    public $template  = array();
    public $data      = array();

    /*Loading the default libraries, helper, language */

    public function __construct()
    {
        parent::__construct();

        $this->load->helper(array('form','language','url'));
    }


    /*	Seller Page Layout*/

    public function frontLayout($data)
    {
        $this->template['meta']   = $this->load->view('include/meta.tpl',   $data , true);
        $this->template['header']   = $this->load->view('include/header.tpl',   $data , true);
        $this->template['sidebar']   = $this->load->view('include/sidebar.tpl',   $data , true);
        $this->template['dashboard_sidebar']   = $this->load->view('include/dashboard_sidebar.tpl',   $data , true);
        $this->template['user_header']   = $this->load->view('include/user_header.tpl',   $data , true);
        $this->template['footer']   = $this->load->view('include/footer.tpl',   $data , true);
        $this->template['js']   = $this->load->view('include/js.tpl',   $data , true);
        $this->template['message']   = $this->load->view('include/message.tpl',   $data , true);
        $this->template['banner_image']   = $this->load->view('include/banner_image.php',   $data , true);
        $this->template['Create_story']   = $this->load->view('include/Create_story.tpl',   $data , true);
        $this->template['post']   = $this->load->view('include/story.tpl',   $data , true);
        $this->template['loader']   = $this->load->view('include/loader.tpl',   $data , true);
        return $this->template ;
    }
    /*	front Layout */
}
?>
