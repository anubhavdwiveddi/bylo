<?php
defined('BASEPATH') or exit('No direct script access allowed');

class DashboardCntrl extends MY_Controller
{

   public function user_dashboard()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("user_dashboard.tpl", $data);
    }
	
	   public function all_blog_listing()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("all_blog_listing.tpl", $data);
    }
	
		public function add_blog()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("add_blog.tpl", $data);
    }
	
		public function edit_blog()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("edit_blog.tpl", $data);
    }
	
	
		   public function all_product_listing()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("all_product_listing.tpl", $data);
    } 
	
	   public function add_product()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("add_product.tpl", $data);
    } 
	
	   public function product_list()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("product_list.tpl", $data);
    } 
	
	  public function order_history()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("order_history.tpl", $data);
    } 
	
	
	public function all_job_listing()
    {
        $data = array();
        $seo = array();

        //$seo['url'] = site_url("/make");
//        $seo['title'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metatitle'] = "Make  Amenities - " . WEBSITENAME;
//        $seo['metadescription'] = "Make  Amenities - " . WEBSITENAME;
//        $data['data']['seo'] = $seo;

        $data['layout'] = $this->frontLayout($data);
        $this->load->view("all_job_listing.tpl", $data);
    }
	
}