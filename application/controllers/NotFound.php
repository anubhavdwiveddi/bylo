<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class NotFound extends MY_Controller
{

    public function index()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("404.tpl", $data);
    }
}