<?php
defined('BASEPATH') or exit('No direct script access allowed');

class BlogCntrl extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'language', 'url', 'utility'));
        $this->load->helper('cookie');
        $this->load->helper('string');
        $this->load->library('session');
        $this->load->model(array('BlogModel'));
    }

    public function is_login()
    {
        if (empty($this->session->userdata('id'))) {
            redirect('');
            die();
        }
    }
    public function blog1($page_id){
        print_r($page_id);
        exit();
    }

    public function blog($page_id = Null, $user_id = Null)
    {

        /* if condition check id means blog title are available or not
        blog title are not available the call if condition otherwise
        call else condition */

        if (empty($page_id && $user_id)) {
            $data = array();
            $seo = array();
            $data['title'] = 'Blog | ' . WEBSITENAME . '';
            $table = 'tr08_user_blog';
            $table1 = 'm05_business_username';
            $table2 = 'tr01_user';
            $table3 = 'm03_category';
            $JOIN1 = 'm05_business_username.page_id = tr08_user_blog.page_id';
            $JOIN2 = 'tr01_user.id = tr08_user_blog.user_id';
            $JOIN3 = 'm03_category.id = tr08_user_blog.blog_category';
            $select = '`tr08_user_blog`.*, `m03_category`.`name` as `category_name`, `tr01_user`.`user_code`, `m05_business_username`.user_name';
            $order = 'tr08_user_blog.id';
            $where = array('tr08_user_blog.status' => 1);
            $join_position = 'LEFT';
            $limit = '10';
            $data['blog_list'] = $this->BlogModel->fetch_post_join_data_with_order_limit($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position, $limit);

            $select = 'count(id) total_count';
            $where = [''];
            $data['total'] = $this->BlogModel->Count_blog($table, $where, $select);
            $data['layout'] = $this->frontLayout($data);
            $this->load->view("blogs.tpl", $data);
        } else {
            $data = array();
            $seo = array();

            $table = 'tr08_user_blog';
            $where = array('blog_url' => $user_id);
            $blog_id = $this->BlogModel->checkvalidation($table, $where);
            $data['title'] = '' . $blog_id->blog_title . ' | ' . WEBSITENAME . '';
            $table1 = 'm05_business_username';
            $table2 = 'tr01_user';
            $table3 = 'm03_category';
            $JOIN1 = 'm05_business_username.page_id = tr08_user_blog.page_id';
            $JOIN2 = 'tr01_user.id = tr08_user_blog.user_id';
            $JOIN3 = 'm03_category.id = tr08_user_blog.blog_category';
            $select = 'tr08_user_blog.*, m03_category.name as category_name, tr01_user.user_code, m05_business_username.user_name';
            $order = 'tr08_user_blog.id';
            $where = array('tr08_user_blog.status' => 1, 'tr08_user_blog.id' => $blog_id->id);
            $join_position = 'LEFT';
            $data['blog_list'] = $this->BlogModel->fetch_post_join_data_with_order1($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position);

            $where = array('status' => 1, 'blog_category' => $blog_id->blog_category);
            $limit = '4';
            $data['category_blog'] = $this->BlogModel->selectAllByWhere1li($table, $where, $limit);

            $where = array('status' => 1);
            $data['recent_blog'] = $this->BlogModel->selectAllByWhere1li($table, $where, $limit);

            $table = 'm03_tag';
            $where = array('status' => 1);
            $data['blog_tag'] = $this->BlogModel->fetch_page_data($table, $where);

            $table = 'tr08_user_blog_comment';
            $select = 'COUNT(blog_id) as no_of_user';
            $where = array('status' => 1, 'blog_id' => $blog_id->id);
            $data['count_blog'] = $this->BlogModel->Count_blog($table, $where, $select);


            if ($blog_id->page_id == 0) {
                $table = 'tr08_user_blog';
                $table1 = 'tr01_user';
                $table2 = 'm03_category';
                $JOIN1 = 'tr01_user.id = tr08_user_blog.user_id';
                $JOIN2 = 'm03_category.id = tr08_user_blog.blog_category';
                $select = '`tr08_user_blog`.*, `m03_category`.`name` as `category_name`, `tr01_user`.`user_code`,`tr01_user`.`profile_image`';
                $order = 'tr08_user_blog.id';
                $where = array('tr08_user_blog.status' => 1, 'tr08_user_blog.blog_url' => $user_id);
                $data['blog_details'] = $this->BlogModel->fetch_post_join_with_order($table, $table1, $table2, $where, $JOIN1, $JOIN2, $select, $order);
            } else {
                $table = 'tr08_user_blog';
                $table1 = 'm05_business_username';
                $table2 = 'm03_category';
                $JOIN1 = 'm05_business_username.page_id = tr08_user_blog.page_id';
                $JOIN2 = 'm03_category.id = tr08_user_blog.blog_category';
                $select = '`tr08_user_blog`.*, `m03_category`.`name` as `category_name`, `m05_business_username`.user_name';
                $order = 'tr08_user_blog.id';
                $where = array('tr08_user_blog.status' => 1, 'tr08_user_blog.blog_url' => $user_id);
                $data['blog_details'] = $this->BlogModel->fetch_post_join_with_order($table, $table1, $table2, $where, $JOIN1, $JOIN2, $select, $order);
            }
            $data['layout'] = $this->frontLayout($data);
            $this->load->view("blog-read.tpl", $data);
        }
    }

    public function get_category_tag()
    {
        $category_id = $this->input->post('category_id');

        $table = 'm03_tag';
        $where = array('category_id' => $category_id);
        $response = $this->BlogModel->fetch_page_data($table, $where);
        echo json_encode($response);
    }

    public function insert_blog()
    {
        $blog_title = $this->input->post('blog_title');
        $url_title = preg_replace("/[\s-]+/", "-", $blog_title);
        $blog_category = $this->input->post('blog_category');
        $page_id = $this->input->post('page_id');
        $blog_tag = $this->input->post('blog_tag');
        $blog_short_description = $this->input->post('blog_short_description');
        $blog_description = $this->input->post('blog_description');
        $blog_image = '';
        $user_id = $this->session->userdata('id');
        $datetime = date('Y-m-d h:i:s');
        if (empty($blog_title)) {
            $response = array('status' => 0, 'message' => 'Enter Blog Title');
        } else if (empty($blog_category)) {
            $response = array('status' => 0, 'message' => 'Select Blog Category');
        } else if (empty($blog_tag)) {
            $response = array('status' => 0, 'message' => 'Select Blog Tag');
        } else if (empty($blog_short_description)) {
            $response = array('status' => 0, 'message' => 'Enter Short Description');
        } else if (empty($blog_description)) {
            $response = array('status' => 0, 'message' => 'Enter Description');
        } else {
            $tag = implode(",", $blog_tag);
            if (!empty($_FILES['blog_img']['name'])) {
                $config['max_width'] = 500;
                $config['max_height'] = 500;
                $config['upload_path'] = './upload/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg|PNG|JPG';
                $config['max_size'] = '10000';
                $blog_image = $_FILES['blog_img']['name'];
                $arr = explode('.', $blog_image);
                $blog_image = end($arr);

                if ($blog_image == 'jpeg' || $blog_image == 'jpg' || $blog_image == 'png') {
                    $check = uploadimgfile("blog_img", $folder = "", $prefix = "profile_");
                    $blog_image = $check['data']['name'];
                    if ($blog_image) {
                        $data = array(
                            'page_id' => $page_id,
                            'blog_title' => $blog_title,
                            'blog_url' => $url_title,
                            'blog_category' => $blog_category,
                            'blog_tag' => $tag,
                            'blog_short_description' => $blog_short_description,
                            'blog_description' => $blog_description,
                            'blog_image' => $blog_image,
                            'user_id' => $user_id,
                            'status' => 2,
                            'datetime' => $datetime
                        );
                        $table = 'tr08_user_blog';
                        $result['insert_blog'] = $this->BlogModel->insert_all($table, $data);
                        if ($result) {
                            $response = array('status' => 1, 'message' => 'Blog has been submitted by under review');
                        } else {
                            $response = array('status' => 0, 'message' => 'blog are not Create');
                        }
                    } else {
                        $response = array('status' => 0, 'message' => 'There are some Technical issue.');
                    }
                } else {
                    $response = array('status' => 0, 'message' => 'select valid image file format');
                }
            } else {
                $response = array('status' => 0, 'message' => 'Select Image');
            }
        }
        echo json_encode($response);
    }

    public function get_blog_details()
    {
        $blog_id = $this->input->post('blog_id');

        $table = 'tr08_user_blog';
        $table1 = 'tr01_user';
        $JOIN = 'tr01_user.id = tr08_user_blog.user_id';
        $select = 'tr08_user_blog.*, tr01_user.first_name, tr01_user.last_name, tr01_user.profile_image';
        $where = array('tr08_user_blog.id' => $blog_id);
        $order = 'tr08_user_blog.id';
        $response = $this->BlogModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
        echo json_encode($response);
    }

    public function insert_comment()
    {
        $user_id = $this->session->userdata('id');
        if (empty($user_id)) {
            $response = ['status' => 3, 'message' => 'Some issue on the server side'];
        } else {
            $comment_msg = $this->input->post('comment');
            $user_id = $this->session->userdata('id');
            $blog_id = $this->input->post('blog_id');
            $parent_id = $this->input->post('parent_id');
            $datetime = date('Y-m-d h:i:s');
            if (empty($comment_msg)) {
                $response = array('status' => 0, 'message' => 'Enter your Comment');
            } else {
                if (empty($parent_id)) {
                    $data = array(
                        'blog_id' => $blog_id,
                        'user_id' => $user_id,
                        'parent_id' => 0,
                        'comment_msg' => $comment_msg,
                        'status' => 1,
                        'datetime' => $datetime,
                    );
                } else {
                    $data = array(
                        'blog_id' => $blog_id,
                        'user_id' => $user_id,
                        'parent_id' => $parent_id,
                        'comment_msg' => $comment_msg,
                        'status' => 1,
                        'datetime' => $datetime,
                    );
                }
                $table = 'tr08_user_blog_comment';
                $data = $this->BlogModel->insert_all($table, $data);
                if ($data) {
                    $response = array('status' => 200, 'message' => 'saved');
                } else {
                    $response = array('status' => 201, 'message' => 'issue');
                }
            }
        }
        echo json_encode($response);
    }

    public function replay_comment($id)
    {
        $table = 'tr08_user_blog_comment';
        $table1 = 'tr01_user';
        $select = 'tr08_user_blog_comment.*, tr01_user.first_name,  tr01_user.last_name, tr01_user.profile_image';
        $JOIN = 'tr01_user.id = tr08_user_blog_comment.user_id';
        $JOIN1 = 'tr08_user_blog_comment.id = tr08_user_blog_comment.parent_id';
        $where = array('tr08_user_blog_comment.blog_id' => $id);
        $order = 'id';
        $result = $this->BlogModel->join_two_table($table, $table1, $where, $JOIN, $select, $order);
        $sendtemp = array();
        foreach ($result as $row) {
            $sendtemp[] = $row;
        }
        echo json_encode($result);

    }

    function getMoreData()
    {
        $lastId = $_GET['lastId'];
        $table = 'tr08_user_blog';
        $table1 = 'm05_business_username';
        $table2 = 'tr01_user';
        $table3 = 'm03_category';
        $JOIN1 = 'm05_business_username.page_id = tr08_user_blog.page_id';
        $JOIN2 = 'tr01_user.id = tr08_user_blog.user_id';
        $JOIN3 = 'm03_category.id = tr08_user_blog.blog_category';
        $select = '`tr08_user_blog`.*, `m03_category`.`name` as `category_name`, `tr01_user`.`user_code`, `m05_business_username`.user_name';
        $order = 'tr08_user_blog.id';
        $where = ['tr08_user_blog.status' => 1, 'tr08_user_blog.id<' => $lastId];
        $join_position = 'LEFT';
        $limit = '10';
        $result = $this->BlogModel->fetch_post_join_data_with_order_limit($table, $table1, $table2, $table3, $where, $JOIN1, $JOIN2, $JOIN3, $select, $order, $join_position, $limit);
        echo json_encode($result);
    }
}