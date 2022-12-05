<?php

function uploadimgfile($index, $folder = "other", $prefix = "other")
{
    $target_dir = 'upload';  // try to put full physical path
    // identity accstatement address advtimg other
    $uploadOk = 1;
    $senddata = array();
    $senddata['data'] = "NILL";
    $notallowed = array("php", "js", "css", "html", "sql");  // defined here the extesion not to upload

    $shownotallowed = "Only jpg/jpeg/png files allowed to upload.";

    $extension = explode(".", basename($_FILES[$index]["name"]));

    $extension = end($extension);
    $realfilnename = basename($_FILES[$index]["name"]);
    $datetofolder = date("Y/M/d");
    $datetofolder = strtolower($datetofolder);
    $checkdirectory = $target_dir . "$folder/$datetofolder";

    if (!file_exists($checkdirectory)) {
        mkdir($checkdirectory, 0777, true);
    }
    $filnename = "$folder/$datetofolder/$prefix" . md5(time() . rand()) . ".$extension";

    $target_file = $target_dir . $filnename;
    if (in_array($extension, $notallowed)) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = $shownotallowed;
        return $senddata;
    }

    // Check file size
    if ($_FILES[$index]["size"] > 5242880) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = "Maximum File Upload size is 5 MB.";
        return $senddata;
        // echo "Sorry, your file is too large.";
        // $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $senddata['status'] = 0;
        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
        return $senddata;
        // echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"], $target_file)) {
            //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
            $senddata['status'] = 1;
            $tempdata = array();
            $tempdata['name'] = $filnename;
            $tempdata['realname'] = $realfilnename;

            //exit();
            $senddata['data'] = $tempdata;

            $senddata['message'] = "File Uploaded successfully.";

            return $senddata;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $senddata['status'] = 0;
            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.................";

            return $senddata;
        }
    }
}

function uploadvideofile($index, $folder = "other", $prefix = "other")
{
    $target_dir = 'video_upload';  // try to put full physical path
    // identity accstatement address advtimg other
    $uploadOk = 1;
    $senddata = array();
    $senddata['data'] = "NILL";
    $notallowed = array("php", "js", "css", "html", "sql");  // defined here the extension not to upload

    $shownotallowed = "Only MP4/MOV/WMV/AVI/AVCHD/MKV/WEBM/FLV/F4V/SWF files allowed to upload.";

    $extension = explode(".", basename($_FILES[$index]["name"]));

    $extension = end($extension);
    $realfilnename = basename($_FILES[$index]["name"]);
    $datetofolder = date("Y/M/d");
    $datetofolder = strtolower($datetofolder);
    $checkdirectory = $target_dir . "$folder/$datetofolder";

    if (!file_exists($checkdirectory)) {
        mkdir($checkdirectory, 0777, true);
    }
    $filnename = "$folder/$datetofolder/$prefix" . md5(time() . rand()) . ".$extension";

    $target_file = $target_dir . $filnename;
    if (in_array($extension, $notallowed)) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = $shownotallowed;
        return $senddata;
    }

    // Check file size
    if ($_FILES[$index]["size"] > 26214400) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = "Maximum File Upload size is 25 MB.";
        return $senddata;
        // echo "Sorry, your file is too large.";
        // $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $senddata['status'] = 0;
        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
        return $senddata;
        // echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"], $target_file)) {
            //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
            $senddata['status'] = 1;
            $tempdata = array();
            $tempdata['name'] = $filnename;
            $tempdata['realname'] = $realfilnename;

            //exit();
            $senddata['data'] = $tempdata;

            $senddata['message'] = "File Uploaded successfully.";

            return $senddata;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $senddata['status'] = 0;
            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.................";

            return $senddata;
        }
    }
}

function uploadaudiofile($index, $folder = "other", $prefix = "other")
{
    $target_dir = 'video_upload';  // try to put full physical path
    // identity accstatement address advtimg other
    $uploadOk = 1;
    $senddata = array();
    $senddata['data'] = "NILL";
    $notallowed = array("php", "js", "css", "html", "sql");  // defined here the extension not to upload

    $shownotallowed = "Only MP4/MOV/WMV/AVI/AVCHD/MKV/WEBM/FLV/F4V/SWF files allowed to upload.";

    $extension = explode(".", basename($_FILES[$index]["name"]));

    $extension = end($extension);
    $realfilnename = basename($_FILES[$index]["name"]);
    $datetofolder = date("Y/M/d");
    $datetofolder = strtolower($datetofolder);
    $checkdirectory = $target_dir . "$folder/$datetofolder";

    if (!file_exists($checkdirectory)) {
        mkdir($checkdirectory, 0777, true);
    }
    $filnename = "$folder/$datetofolder/$prefix" . md5(time() . rand()) . ".$extension";

    $target_file = $target_dir . $filnename;
    if (in_array($extension, $notallowed)) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = $shownotallowed;
        return $senddata;
    }

    // Check file size
    if ($_FILES[$index]["size"] > 26214400) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = "Maximum File Upload size is 25 MB.";
        return $senddata;
        // echo "Sorry, your file is too large.";
        // $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $senddata['status'] = 0;
        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
        return $senddata;
        // echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"], $target_file)) {
            //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
            $senddata['status'] = 1;
            $tempdata = array();
            $tempdata['name'] = $filnename;
            $tempdata['realname'] = $realfilnename;

            //exit();
            $senddata['data'] = $tempdata;

            $senddata['message'] = "File Uploaded successfully.";

            return $senddata;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $senddata['status'] = 0;
            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.................";

            return $senddata;
        }
    }
}

function uploadDocumentfile($index, $folder = "other", $prefix = "other")
{
    $target_dir = 'video_upload';  // try to put full physical path
    // identity accstatement address advtimg other
    $uploadOk = 1;
    $senddata = array();
    $senddata['data'] = "NILL";
    $notallowed = array("php", "js", "css", "html", "sql");  // defined here the extension not to upload

    $shownotallowed = "Only PDF files allowed to upload.";

    $extension = explode(".", basename($_FILES[$index]["name"]));

    $extension = end($extension);
    $realfilnename = basename($_FILES[$index]["name"]);
    $datetofolder = date("Y/M/d");
    $datetofolder = strtolower($datetofolder);
    $checkdirectory = $target_dir . "$folder/$datetofolder";

    if (!file_exists($checkdirectory)) {
        mkdir($checkdirectory, 0777, true);
    }
    $filnename = "$folder/$datetofolder/$prefix" . md5(time() . rand()) . ".$extension";

    $target_file = $target_dir . $filnename;
    if (in_array($extension, $notallowed)) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = $shownotallowed;
        return $senddata;
    }

    // Check file size
    if ($_FILES[$index]["size"] > 5242880) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = "Maximum File Upload size is 25 MB.";
        return $senddata;
        // echo "Sorry, your file is too large.";
        // $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $senddata['status'] = 0;
        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
        return $senddata;
        // echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"], $target_file)) {
            //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
            $senddata['status'] = 1;
            $tempdata = array();
            $tempdata['name'] = $filnename;
            $tempdata['realname'] = $realfilnename;
            $senddata['data'] = $tempdata;

            $senddata['message'] = "File Uploaded successfully.";
            return $senddata;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $senddata['status'] = 0;
            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.................";
            return $senddata;
        }
    }
}


//function sent_mail($to,$sendemailto,$sendemailsub,$message)
//{
//    //$sendemailhtmlbody    =  str_replace("#CONTENT#",$message);
//    $sendemailaddreplyto = "anubhavdwivedi245@gmail.com";
//    $headers = "MIME-Version: 1.0" . "\r\n";
//    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
//    $headers .= 'From: Contact us <'.$sendemailaddreplyto.'>' . "\r\n";
//    //$message ;
//    if (mail($sendemailto,$sendemailsub,$message,$headers))
//    {
//        return true;
//    } else {
//        return false;
//    }
//}


function api_response($response)
{
    $CI =& get_instance();
    $CI->output
        ->set_status_header(200)
        ->set_content_type('application/json', 'utf-8')
        ->set_output(json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES))
        ->_display();
    exit;
}

function get_country()
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->where('status', 1);
    $query = $ci->db->get('m02_country')->result();
    return $query;
}

function get_state($id)
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->where('id', $id);
    $query = $ci->db->get('states')->result();
    $state = $query->name;
    return $state;

}

function get_city($id)
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->where('id', $id);
    $query = $ci->db->get('m02_city')->result();
    $city = $query->city;
    return $city;
}

function get_color($id)
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->where('m13_3_id', $id);
    $query = $ci->db->get('m13_3_pro_color')->row();
    $state = $query->m13_3_code;
    return $state;
}

function get_page($id)
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->select('tr02_user_pages.*, m05_business_username.user_name');
    $ci->db->from('tr02_user_pages');
    $ci->db->JOIN('m05_business_username', 'm05_business_username.page_id = tr02_user_pages.id');
    $ci->db->where('tr02_user_pages.user_id', $id);
    $res = $ci->db->get()->result();
    if(!empty($res)){
        return $res;
    }
}

function _ds($date)
{
    return date('d-m-Y', strtotime($date));
}

function _dl($date)
{
    if ($date != '') {
        return date(' H:iA l jS F Y', strtotime($date));
    } else {
        return '';
    }

}

function _time($date)
{
    return date('h:i A', strtotime($date));
}

function f_dt($date)
{
    return date('l jS F Y', strtotime($date));
}

function ymd($date)
{
    return date('Y-m-d', strtotime($date));
}

function get_vendor_amount($vendor_id, $s_id)
{
    $ci =& get_instance();
    $ci->load->database();
    $ci->db->select('*')->from('tr_services')->where('service_id', $s_id)->where('user_id', $vendor_id);
    $res = $ci->db->get()->row();
    //return $ci->db->last_query();
    return $res->price;

}

function sent_mail($username, $subject, $message, $mailfor)
{
    $CI =& get_instance();
    $CI->load->database();
    $CI->db->where('status', 1);
    $query = $CI->db->get('m02_email')->row();

    if ($query) {
        $config = array(
            'protocol' => 'smtp',
            'smtp_host' => $query->host,
            '_smtp_auth' => 'TURE',
            'smtp_user' => $query->username,
            'smtp_pass' => $query->password,
            'smtp_port' => $query->port,
            'smtp_crypto' => 'tls',
            'charset' => 'UTF-8',
            'priority' => '1'
        );
        $theme = file_get_contents(FCPATH . "/email.theme");
        $sendemailhtmlbody = str_Replace("#CONTENT#", $message, $theme);
        $headers = $subject;
        $message = $sendemailhtmlbody;
        $CI->email->initialize($config);
        $CI->load->library('email', $config);
        $CI->email
            ->set_newline("\r\n")
            ->set_header('Byloapp Marketplace Community', 'charset=utf-8')
            ->set_header('Content-type', 'text/html')
            ->from($query->username, $headers)
            ->to(trim($username))
            ->subject($subject)
            ->message($message);
        if($CI->email->send()){
            //Success email Sent
            $response = ['status'   => 1];
        }else{
            //Email Failed To Send
            $response = ['status'   => 0];
        }
        return $response;
    }
}



function createAvatarImage($string)
{

    $imageFilePath = "images/" . $string . ".png";

    //base avatar image that we use to center our text string on top of it.
    $avatar = imagecreatetruecolor(978, 285);

    $bg_color = imagecolorallocate($avatar, 60, 60, 60);

    imagefill($avatar, 0, 0, $bg_color);
    $avatar_text_color = imagecolorallocate($avatar, 0, 0, 0);
    // Load the gd font and write
    $font = imageloadfont('assets/gd-font.gdf');
    imagestring($avatar, $font, 10, 10, $string, $avatar_text_color);

    imagepng($avatar, $imageFilePath);

    imagedestroy($avatar);

    return $imageFilePath;
}

function createICONImage($string)
{

    $imageFilePath = "Iconimage/" . $string . ".png";

    //base avatar image that we use to center our text string on top of it.
    $avatar = imagecreatetruecolor(100, 100);

    $bg_color = imagecolorallocate($avatar, 37, 99, 235);

    imagefill($avatar, 0, 0, $bg_color);
    $avatar_text_color = imagecolorallocate($avatar, 255, 255, 255);
    // Load the gd font and write
    $font = imageloadfont('assets/gd-font.gdf');
    imagestring($avatar, $font, 10, 10, $string, $avatar_text_color);

    imagepng($avatar, $imageFilePath);

    imagedestroy($avatar);

    return $imageFilePath;
}

function create_bannerAvatarImage($string)
{

    $imageFilePath = "image_banner/" . $string . ".png";

    //base avatar image that we use to center our text string on top of it.
    $avatar = imagecreatetruecolor(978, 285);

    $bg_color = imagecolorallocate($avatar, 255, 0, 0 / 62);

    imagefill($avatar, 326, 95, $bg_color);
    $avatar_text_color = imagecolorallocate($avatar, 255, 255, 255);
    imagearc($avatar, 500, 140, 200, 200, 0, 360, $avatar_text_color);
    // Load the gd font and write
    $font = imageloadfont('assets/gd-font.gdf');
    imagestring($avatar, $font, 480, 120, $string, $avatar_text_color);

    imagepng($avatar, $imageFilePath);

    imagedestroy($avatar);

    return $imageFilePath;
}

function generate_random()
{
    $length = "15";
    $char = "0123456789";
    $random = substr(str_shuffle($char), 0, $length);
    $random_number = date('d') . $random . date('h');
    return $random_number;
}

function random_number($year, $date, $month, $hours, $min, $sec)
{
    $length = "5";
    $char = "0123456789";
    $random = substr(str_shuffle($char), 0, $length);
    $random_number = $year . '' . $date . '' . $month . '' . $random . '' . $hours . '' . $min . '' . $sec;
    return $random_number;
}

function post_story_random_id(){
    $year = date('Y');
    $date = date('d');
    $month = date('m');
    $hours = date('h');
    $min = date('m');
    $sec = date('s');

    $length = "5";
    $char = "0123456789";
    $random = substr(str_shuffle($char), 0, $length);
    $post_story_random_id = $year . '' . $date . '' . $month . '' . $random . '' . $hours . '' . $min . '' . $sec;
    return $post_story_random_id;
}

// OTP For Random number
function OTP_random()
{
    $length = "4";
    $char = "0123456789";
    $random = substr(str_shuffle($char), 0, $length);
    return $random;
}

//Private Key for API by system
function private_key()
{
    $length = "20";
    $char = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZavbcdeghijklmnopqrstuvwxyz";
    $random = substr(str_shuffle($char), 0, $length);
    return $random;
}

//password generate by system
function system_password()
{
    $length = "10";
    $char = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZavbcdeghijklmnopqrstuvwxyz";
    $random = substr(str_shuffle($char), 0, $length);
    return $random;
}

// upload multiple image code

function upload_multiple_image($index, $i, $folder = "", $prefix = "feed")
{
    // $target_dir  = "upload_directory_path/";  // try to put full physical path
    $target_dir = "/upload_multiple/";
    // identity accstatement address advtimg other
    $uploadOk = 1;
    $senddata = array();
    $senddata['data'] = "NILL";
    $notallowed = array("php", "js", "css", "html");  // defined here the extesion not to upload
    $shownotallowed = "PHP, JS, CSS, HTML file is not allowed to upload.";
    $extension = explode(".", basename($_FILES[$index]["name"][$i]));
    $extension = end($extension);
    $realfilnename = basename($_FILES[$index]["name"][$i]);
    $datetofolder = date("Y/M/d");
    $datetofolder = strtolower($datetofolder);

    $checkdirectory = $target_dir . "$folder/$datetofolder";

    if (!file_exists($checkdirectory)) {
        mkdir($checkdirectory, 0755, true);
    }

    $filnename = "$folder/$datetofolder/$prefix" . time() . $i . ".$extension";
    $target_file = $target_dir . $filnename;

    if (in_array($extension, $notallowed)) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = $shownotallowed;
        return $senddata;
    }
    // Check file size
    if ($_FILES[$index]["size"][$i] > 10485760) {
        $uploadOk = 0;
        $senddata['status'] = 0;
        $senddata['message'] = "Maximum File Upload size is 10MB.";
        return $senddata;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $senddata['status'] = 0;
        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
        return $senddata;
        // echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"][$i], $target_file)) {
            // echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
            $senddata['status'] = 1;
            $tempdata = array();
            $tempdata['name'] = $filnename;
            $tempdata['realname'] = $realfilnename;
            $senddata['data'] = $tempdata;
            $senddata['message'] = "File Uploaded successfully.";
            return $senddata;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $senddata['status'] = 0;
            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.";
            return $senddata;
        }
    }
}

//function upload_multiple_video($index,$folder="other",$prefix="other",$i)
//{
//    // $target_dir  = "upload_directory_path/";  // try to put full physical path
//    $target_dir  = "/upload/";
//    // identity accstatement address advtimg other
//    $uploadOk = 1;
//    $senddata = array();
//    $senddata['data'] = "NILL";
//    $notallowed = array("php","js","css","html");  // defined here the extesion not to upload
//    $shownotallowed = "PHP, JS, CSS, HTML file is not allowed to upload.";
//    $extension = explode(".",basename($_FILES[$index]["name"][$i]));
//    $extension = end($extension);
//    $realfilnename = basename($_FILES[$index]["name"][$i]);
//    $datetofolder = date("Y/M/d");
//    $datetofolder = strtolower($datetofolder);
//
//    $checkdirectory = $target_dir."$folder/$datetofolder";
//
//    if (!file_exists($checkdirectory))
//    {
//        mkdir($checkdirectory, 0777, true);
//    }
//
//    $filnename   = "$folder/$datetofolder/$prefix".time().$i.".$extension";
//    $target_file = $target_dir . $filnename;
//
//    if (in_array($extension, $notallowed))
//    {
//        $uploadOk = 0;
//        $senddata['status']  = 0;
//        $senddata['message'] = $shownotallowed;
//        return $senddata;
//    }
//    // Check file size
//    if ($_FILES[$index]["size"][$i] > 10485760)
//    {
//        $uploadOk = 0;
//        $senddata['status']  = 0;
//        $senddata['message'] = "Maximum File Upload size is 10MB.";
//        return $senddata;
//    }
//    // Check if $uploadOk is set to 0 by an error
//    if ($uploadOk == 0)
//    {
//        $senddata['status']  = 0;
//        $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.2";
//        return $senddata;
//        // echo "Sorry, your file was not uploaded.";
//        // if everything is ok, try to upload file
//    } else {
//        if (move_uploaded_file($_FILES[$index]["tmp_name"][$i], $target_file))
//        {
//            // echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
//            $senddata['status']  = 1;
//            $tempdata = array();
//            $tempdata['name']   	=	$filnename;
//            $tempdata['realname']  	=	$realfilnename;
//            $senddata['data']  	= 	$tempdata;
//            $senddata['message'] = "File Uploaded successfully.";
//            return $senddata;
//        } else {
//            // echo "Sorry, there was an error uploading your file.";
//            $senddata['status']  = 0;
//            $senddata['message'] = "<b>Sorry!</b> There was an error uploading your file.";
//            return $senddata;
//        }
//    }
//}

function get_header()
{
    $ci =& get_instance();
    $headers = $ci->input->request_headers();
    $ci->load->database();
    $ci->db->select('*')->from('m00_rest_api')->where('my_key', $headers['X-Api-Key']);
    $res = $ci->db->get()->row();
    //return $ci->db->last_query();
    return $res;
}


//image without validation

function upload_img_file($index, $folder = "other", $prefix = "other")
{
    // try to put full physical path
    $target_dir = 'upload';
    // identity acc statement address adv time other
    $upload_Ok = 1;
    $send_data = array();
    $send_data['data'] = "NILL";
    // here we declare the extension not to upload on the image
    $not_allowed = array("php", "js", "css", "html", "sql");

    $show_not_allowed = "Only jpg/jpeg/png files allowed to upload.";

    $extension = explode(".", basename($_FILES[$index]["name"]));

    $extension = end($extension);
    $real_fil_name = basename($_FILES[$index]["name"]);
    $date_to_folder = date("Y/M/d");
    $date_to_folder = strtolower($date_to_folder);
    $check_directory = $target_dir . "$folder/$date_to_folder";

    if (!file_exists($check_directory)) {
        mkdir($check_directory, 0777, true);
    }
    $file_name = "$folder/$date_to_folder/$prefix" . md5(time() . rand()) . ".$extension";

    $target_file = $target_dir . $file_name;
    if (in_array($extension, $not_allowed)) {
        $uploadOk = 0;
        $send_data['status'] = 400;
        $send_data['message'] = $show_not_allowed;
        return $send_data;
    }

    // Check file size
    if ($_FILES[$index]["size"] > 5242880) {
        $uploadOk = 0;
        $send_data['status'] = 400;
        $send_data['message'] = 'Maximum File Upload size is 5 MB.';
        return $send_data;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($upload_Ok == 0) {
        $send_data['status'] = 400;
        $send_data['message'] = "<b>Sorry!</b> There was an error uploading your file.";
        return $send_data;
    } else {
        if (move_uploaded_file($_FILES[$index]["tmp_name"], $target_file)) {
            $send_data['status'] = 1;
            $temp_data = array();
            $temp_data['name'] = $file_name;
            $temp_data['realname'] = $real_fil_name;
            $send_data['data'] = $temp_data;
            $send_data['message'] = "File Uploaded successfully.";
            return $send_data;
        } else {
            // echo "Sorry, there was an error uploading your file.";
            $send_data['status'] = 400;
            $send_data['message'] = "<b>Sorry!</b> There was an error uploading your file.................";
            return $send_data;
        }
    }
}

//split function for name and address
function split_function($value)
{
    $parts = array();

    while (strlen(trim($value)) > 0) {
        $value = trim($value);
        $string = preg_replace('#.*\s([\w-]*)$#', '$1', $value);
        $parts[] = $string;
        $value = trim(preg_replace('#' . preg_quote($string, '#') . '#', '', $value));
    }

    if (empty($parts)) {
        return false;
    }

    $parts = array_reverse($parts);
    $value = array();
    $value['address'] = $parts[0];
    $value['state'] = (isset($parts[2])) ? $parts[1] : '';
    $value['city'] = (isset($parts[2])) ? $parts[2] : (isset($parts[1]) ? $parts[1] : '');

    return $value;
}

function send_sms($mobile, $Create_OTP, $template_name)
{
    $CI =& get_instance();
    $CI->load->database();
    $CI->db->where('status', 1);
    $CI->db->where('template_name', $template_name);
    $query = $CI->db->get('m02_SMTP_configuration')->row();
    if ($query) {
        $post_data = [
            "template_id" => $query->flow_id,
            "sender" => $query->sender_id,
            "mobiles" => "91" . $mobile,
        ];
        //$url = "https://api.msg91.com/api/v5/otp?template_id=$query->flow_id&mobile=91$mobile&authkey=$query->Auth_key&otp=$Create_OTP";
        $url = "https://module.logonutility.com/send-otp/index?key=462B5742B2208F&channel_id=x&mobile=918770414130";
        $curl = curl_init();
        curl_setopt_array($curl, array(
            //CURLOPT_URL => "https://api.msg91.com/api/v5/flow/",
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => $query->method,
            CURLOPT_POSTFIELDS => json_encode($post_data),
            CURLOPT_HTTPHEADER => [
                "content-type: application/JSON"
            ],
        ));
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            echo "cURL Error #:" . $err;
            exit;
        } else {
            echo $response;
        }
    } else {
        echo "Some issue on fetching data";
    }
    return;
}

function sms_login_otp($Create_OTP, $mobile, $template_name)
{
    send_sms($mobile, $Create_OTP, $template_name);
}

//function sent_sms($mobile, $msg){
//    $auth_key = "344458A3gEkEtueBp5ff96b58P1";
//    $sender_id = "ByloIn";
//    $OTP = '123456';
//    $msg = urlencode("'.$OTP.' is your Bylo login OTP. Connect with people around you.");
//    $postData = array(
//        'authkey'   => $auth_key,
//        'mobile'   =>   $mobile,
//        'message'   => $msg,
//        'sender'    => $sender_id,
//    );
//
//    $url = "https://control.msg91.com/api/sendotp.php";
//
//    $curl = curl_init($url);
//
//        curl_setopt_array($curl, [
//        //CURLOPT_URL => "https://api.msg91.com/api/v5/flow/",
//        CURLOPT_RETURNTRANSFER => true,
//        CURLOPT_ENCODING => "",
//        CURLOPT_MAXREDIRS => 10,
//        CURLOPT_TIMEOUT => 30,
//        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//        CURLOPT_CUSTOMREQUEST => "POST",
//        CURLOPT_POSTFIELDS => $postData,
//        CURLOPT_SSL_VERIFYHOST => 0,
//        CURLOPT_SSL_VERIFYPEER => 0,
//
//    ]);
//
//    $response = curl_exec($curl);
//    $err = curl_error($curl);
//
//    curl_close($curl);
//
//    if ($err) {
//        echo "cURL Error #:" . $err;
//    } else {
//        echo $response;
//    }
//}

function base_image_upload($index, $folder = "other", $prefix = "other")
{
    $path = "upload/";
    $uploadOk = 1;
    $sent_data = array();
    $sent_data['data'] = "NILL";
    $date_to_folder = date("Y/M/d");
    $date_to_folder = strtolower($date_to_folder);
    $check_directory = $path . "$date_to_folder";
    if (!file_exists($check_directory)) {
        mkdir($check_directory, 0777, true);
    }
    $file_name = "/$date_to_folder/$prefix" . md5(time() . rand());
    $target_file = $path . $file_name;

    if (move_uploaded_file($index, $target_file)) {
        //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
        $sent_data['status'] = 1;
        $temp_data = array();
        $temp_data['name'] = $file_name;
        $temp_data['realname'] = $index;

        //exit();
        $sent_data['data'] = $temp_data;

        $sent_data['message'] = "File Uploaded successfully.";

        return $sent_data;
    } else {
        // echo "Sorry, there was an error uploading your file.";
        $sent_data['status'] = 0;
        $sent_data['message'] = "<b>Sorry!</b> There was an error uploading your file.................";

        return $sent_data;
    }
}

function content_encode($value)
{
    $response = base64_encode(base64_encode(base64_encode($value)));
    return $response;
}

function content_decode($value)
{
    $response = base64_decode(base64_decode(base64_decode($value)));
    return $response;
}

function GetClientMac()
{
    if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    } else {
        $ip = $_SERVER["REMOTE_ADDR"];
    }
    return $ip;
}

function systemInfo()
{
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $os_platform = "Unknown OS Platform";
    $os_array = array('/windows phone 8/i' => 'Windows Phone 8',
        '/windows phone os 7/i' => 'Windows Phone 7',
        '/windows nt 6.3/i' => 'Windows 8.1',
        '/windows nt 6.2/i' => 'Windows 8',
        '/windows nt 6.1/i' => 'Windows 7',
        '/windows nt 6.0/i' => 'Windows Vista',
        '/windows nt 5.2/i' => 'Windows Server 2003/XP x64',
        '/windows nt 5.1/i' => 'Windows XP',
        '/windows xp/i' => 'Windows XP',
        '/windows nt 5.0/i' => 'Windows 2000',
        '/windows me/i' => 'Windows ME',
        '/win98/i' => 'Windows 98',
        '/win95/i' => 'Windows 95',
        '/win16/i' => 'Windows 3.11',
        '/macintosh|mac os x/i' => 'Mac OS X',
        '/mac_powerpc/i' => 'Mac OS 9',
        '/linux/i' => 'Linux',
        '/ubuntu/i' => 'Ubuntu',
        '/iphone/i' => 'iPhone',
        '/ipod/i' => 'iPod',
        '/ipad/i' => 'iPad',
        '/android/i' => 'Android',
        '/blackberry/i' => 'BlackBerry',
        '/webos/i' => 'Mobile');
    $found = false;
    //$addr = new RemoteAddress;
    $device = '';
    foreach ($os_array as $regex => $value) {
        if ($found)
            break;
        else if (preg_match($regex, $user_agent)) {
            $os_platform = $value;
            $device = !preg_match('/(windows|mac|linux|ubuntu)/i', $os_platform)
                ? 'MOBILE' : (preg_match('/phone/i', $os_platform) ? 'MOBILE' : 'SYSTEM');
        }
    }
    $device = !$device ? 'SYSTEM' : $device;
    return array('os' => $os_platform, 'device' => $device);
}

function browser()
{
    $user_agent = $_SERVER['HTTP_USER_AGENT'];

    $browser = "Unknown Browser";

    $browser_array = array('/msie/i' => 'Internet Explorer',
        '/firefox/i' => 'Firefox',
        '/safari/i' => 'Safari',
        '/chrome/i' => 'Chrome',
        '/opera/i' => 'Opera',
        '/netscape/i' => 'Netscape',
        '/maxthon/i' => 'Maxthon',
        '/konqueror/i' => 'Konqueror',
        '/mobile/i' => 'Handheld Browser');
    $found = false;
    foreach ($browser_array as $regex => $value) {
        if ($found)
            break;
        else if (preg_match($regex, $user_agent, $result)) {
            $browser = $value;
        }
    }
    return $browser;
}

//$detail = Detect::systemInfo();

function urlsafeB64Encode($input)
{
    $json = json_encode($input);
    return str_replace('=', '', strtr(base64_encode($json), '+/', '-_'));
}

function urlsafeB64Decode($input)
{
    $remainder = strlen($input) % 4;
    if ($remainder) {
        $padlen = 4 - $remainder;
        $input .= str_repeat('=', $padlen);
    }
    return base64_decode(strtr($input, '-_', '+/'));
    //json_decode($decode, true);
}

function saveProfilesImage($base64)
{
    if ($base64) {
        $folder = 'upload';
        $img = imagecreatefromstring(base64_decode($base64));
        if ($img != false) {
            $imageName = md5(time() . rand()) . '.jpg';
            $date_to_folder = date("Y/M/d");
            $date_to_folder = strtolower($date_to_folder);
            $check_directory = $folder . '/' . $date_to_folder;
            //$img_path      = $_SERVER['DOCUMENT_ROOT'];
            //$path = $img_path.'/'.$folder.'/'.$imageName;
            if (!file_exists($check_directory)) {
                mkdir($check_directory, 0777, true);
            }
            $path = $check_directory . '/' . $imageName;
            if (imagejpeg($img, $path))
                return $path;
            else
                return '';
        }
    } else {
        return '';
    }
}


function saveVideo($base64)
{
    if ($base64) {
        $folder = 'video_upload';
        $img = imagecreatefromstring(base64_decode($base64));
        if ($img != false) {
            $imageName = md5(time() . rand()) . '.mp4';
            $date_to_folder = date("Y/M/d");
            $date_to_folder = strtolower($date_to_folder);
            $check_directory = $folder . '/' . $date_to_folder;
            //$img_path      = $_SERVER['DOCUMENT_ROOT'];
            //$path = $img_path.'/'.$folder.'/'.$imageName;
            if (!file_exists($check_directory)) {
                mkdir($check_directory, 0777, true);
            }
            $path = $check_directory . '/' . $imageName;
            if (imagejpeg($img, $path))
                return $path;
            else
                return '';
        }
    } else {
        return '';
    }
}

function get_data_json_encode($table, $where)
{
    $CI =& get_instance();
    $CI->load->database();
    $CI->db->where($where);
    $query = $CI->db->get($table)->row();
    $json_data = json_encode($query);
    return $json_data;
}

function get_avtar($table, $where)
{
    $CI =& get_instance();
    $CI->load->database();
    $CI->db->where($where);
    $query = $CI->db->get($table)->row();
    return $query;
}

function disable_story()
{
    $current_date = date('Y-m-s h:i:s');
    $split_Time_Stamp = explode(' ', $current_date);
    $cur_date = $split_Time_Stamp[0];
    $cur_time = $split_Time_Stamp[1];
    $CI =& get_instance();
    $CI->load->database();
    $query = $CI->db->get('tr05_user_story')->result();
    foreach ($query as $key => $row) {
        $result[$key] = $row;
        $splitTimeStamp = explode(' ', $row->datetime);
        $date = $splitTimeStamp[0];
        $time = $splitTimeStamp[1];
        if ($cur_date != $date) {
            if($cur_date > $date){
                $data = [
                    'status' => 0
                ];
                $where = ['date!='    => $cur_date,];
                $CI->db->where($where);
                $update_result = $CI->db->update('tr05_user_story', $data);
                return $update_result;
            }
        }
    }
}

function set_config_data(){
         $table = 'm00_setconfig';
         $where = ['m00_name'       => 'favicon'];
         $CI =& get_instance();
         $CI->load->database();
         $CI->db->where($where);
         $query = $CI->db->get($table)->row();
         return $query;
}

function login_user_data(){
         $CI =& get_instance();
         $CI->load->database();
         $table = 'tr01_user';
         $where = ['id'       => $CI->session->userdata('id')];
         $CI->db->where($where);
         $query = $CI->db->get($table)->row();
         return $query;
}

function menu_list(){
       $CI =& get_instance();
       $CI->load->database();
       $table = 'm00_menu';
       $where = ['status'       => 1];
       $CI->db->where($where);
       $query = $CI->db->get($table)->result();
       return $query;
}
       
       //date calucation
       function time_ago($timestamp){
              
              date_default_timezone_set("Asia/Kolkata");
              $time_ago        = strtotime($timestamp);
              $current_time    = time();
              $time_difference = $current_time - $time_ago;
              $seconds         = $time_difference;
              
              $minutes = round($seconds / 60); // value 60 is seconds
              $hours   = round($seconds / 3600); //value 3600 is 60 minutes * 60 sec
              $days    = round($seconds / 86400); //86400 = 24 * 60 * 60;
              $weeks   = round($seconds / 604800); // 7*24*60*60;
              $months  = round($seconds / 2629440); //((365+365+365+365+366)/5/12)*24*60*60
              $years   = round($seconds / 31553280); //(365+365+365+365+366)/5 * 24 * 60 * 60
              
              if ($seconds <= 60){
                     
                     return "Just Now";
                     
              } else if ($minutes <= 60){
                     
                     if ($minutes == 1){
                            
                            return "1 minute";
                            
                     } else {
                            
                            return "$minutes minutes";
                            
                     }
                     
              } else if ($hours <= 24){
                     
                     if ($hours == 1){
                            
                            return "1 hour";
                            
                     } else {
                            
                            return "$hours hrs";
                            
                     }
                     
              } else if ($days <= 7){
                     
                     if ($days == 1){
                            
                            return "yesterday";
                            
                     } else {
                            
                            return "$days days";
                            
                     }
                     
              } else if ($weeks <= 4.3){
                     
                     if ($weeks == 1){
                            
                            return "1 week";
                            
                     } else {
                            
                            return "$weeks weeks";
                            
                     }
                     
              } else if ($months <= 12){
                     
                     if ($months == 1){
                            
                            return "1 month";
                            
                     } else {
                            
                            return "$months months";
                            
                     }
                     
              } else {
                     
                     if ($years == 1){
                            
                            return "1 year";
                            
                     } else {
                            
                            return "$years years";
                            
                     }
              }
       }