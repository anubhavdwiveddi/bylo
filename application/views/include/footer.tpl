<?php $data = login_user_data();
?>
<div id="user_profile" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Update Images </h2>
        </div>

        <!------  profile update popup  ------->
        <form method="post" id="profile_image_form" enctype="multipart/form-data">
            <div class="uk-modal-body profile_popup">
                <div class="profile-update">
                    <div class="avatar-upload">
                        <div class="avatar-edit pr-update">
                            <input type='file' id="imageUpload1" name="imageUpload" accept=".png, .jpg, .jpeg"/>
                            <label for="imageUpload1">
                                <span class="btn-text">
                                    <span class="icon-feather-plus"></span>
                                    Upload Image
                                </span>
                            </label>
                        </div>
                        <div class="avatar-preview">
                            <img class="profile-user-img img-responsive" id="imagePreview1"
                                 src="<?php echo base_url()?>assets/images/group/group-3.jpg"
                                 alt="User profile picture">
                        </div>
                    </div>
                    <input type="hidden" id="page_main_id" class="shadow-none with-border">
                </div>
            </div>

            <div class=" flex items-center w-full justify-between border-t p-3   text-right">
                <select name="user_visibility" class="pr-pub-select mt-2 story">
                    <option value="2">Public</option>
                    <option value="1">Only me</option>
                </select>

                <div class="uk-modal-footer text-right" id="upload_profile_image_page">

                </div>
            </div>
        </form>
    </div>
</div>

<!---------- succes message --------->
<div id="success_msg" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display:none">
    <div class="toast-header">
        <strong class="mr-auto">Success</strong>
        <small></small>
        <button type="button" class="ml-2 mb-1 close myBtn" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="toast-body" id="success_msg_subject">
    </div>
</div>

<!---------- error message --------->

<div id="error_msg" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display:none">
    <div class="toast-header">
        <strong class="mr-auto">Error</strong>
        <small></small>
        <button type="button" class="ml-2 mb-1 close myBtn" data-dismiss="toast" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="toast-body" id="error_msg_subject">
    </div>
</div>


<!---------- error message --------->

<div id="add-image-modal" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Update Images </h2>
        </div>

        <!------  profile update popup  ------->
        <form method="POST" id="upload_all_image" enctype="multipart/form-data">
        <div class="uk-modal-body profile_popup">
            <div class="profile-update">
                <div class="avatar-upload">
                    <div class="avatar-edit pr-update">

                            <input type='file' id="imgInp" name="image_upload" accept=".png, .jpg, .jpeg"/>
                            <label for="image_upload">
                                <span class="btn-text">
                                    <span class="icon-feather-plus"></span>
                                    Upload Image
                                </span>
                            </label>

                    </div>
                    <div class="avatar-preview">
                        <img class="profile-user-img img-responsive" id="imageID"
                             src="<?php echo base_url()?>assets/images/group/group-3.jpg"
                             alt="User profile picture">
                    </div>
                </div>
            </div>
        </div>
        <div class="flex items-center w-full justify-between border-t p-3 text-right">
            <select name="publish_status" class="pr-pub-select mt-2 story">
                <option value="2">Public</option>
                <option value="1">Only me</option>
            </select>

            <div class="flex space-x-2" id="upload_image_on_pages">
            </div>
        </div>
        </form>
    </div>
</div>

<div id="add-video-modal" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Update Video </h2>
        </div>

        <!------  profile update popup  ------->
        <form method="post" id="videoupload" enctype="multipart/form-data">
        <div class="uk-modal-body profile_popup">
            <div class="profile-update">
                <div class="avatar-upload">
                    <div class="avatar-edit pr-update">

                            <input type="file" id="avatar" name="avatar" accept="video/*">
                            <label for="avatar">
                                <span class="btn-text">
                                    <span class="icon-feather-plus"></span>
                                    Upload Video
                                </span>
                            </label>
                    </div>
                    <div class="pageid" style="display: none">
                        <span id="pageid" style="display: none"></span></div>
                    <div class="">
                        <video width="800" controls controlsList="nodownload">
                            <source src="mov_bbb.mp4" id="video_here">
                            Your browser does not support HTML5 video.
                        </video>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex items-center w-full justify-between border-t p-3 text-right">
            <select name="publish_status" class="pr-pub-select mt-2 story">
                <option value="2">Public</option>
                <option value="1">Only me</option>
            </select>
            <div class="flex space-x-2" id="upload_video_on_pages">
            </div>
        </div>
        </form>
    </div>
</div>

<div id="showModal" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title" id="model_title"></h2>
        </div>
        <div class="uk-modal-body collection-model">
            <!-- search icon for mobile -->
            <div class="form-group">
                <span id="message_saved"> </span>
            </div>
        </div>
        <div class="uk-modal-footer text-right">
            <button class="button uk-modal-close" type="button">Ok</button>
        </div>
    </div>
</div>



<div class="user-pr-banner">
    <div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="upload-demo" class="center-block"></div>

                </div>
                <div class="modal-footer" id="crop_box">

                </div>
            </div>
        </div>
    </div>
</div>


<div class="popup-box chat-popup" id="qnimate">
    <div class="popup-head" id="chat_header">
    </div>
    <div class="popup-messages" id="msg">

    </div>
    <div class="popup-messages" id="msg">

    </div>
    <div class="popup-messages-footer">
        <form method="post" action="/UserEcomCntrl/Insert_chat" id="page_chat">
            <div class="message-reply-box yes cm-img-upload">
                <div class="img-grid">
                    <div class="img-view-ct mt-2">
                        <img id="Imgview3" src="" class="preview3 dimg-none">
                        <input type="button" id="removeImage3" value="x" class="btn-rmv3">
                    </div>
                </div>

                <div class="message-reply" id="msg_replay">
 
            </div>
			 </div>
        </form>
    </div>
</div>



<!-- This is  Register Model modal -->
<div id="register" uk-modal>
        <div class="uk-modal-dialog uk-modal-body rounded-xl shadow-2xl p-0 lg:w-5/12 card-body">
                <button class="uk-modal-close-default p-3 bg-gray-100 rounded-full m-3" type="button" uk-close></button>
                <div class="border-b px-7 py-3">
                        <div class="lg:text-2xl text-xl font-semibold mb-1"> Sign Up</div>
                        <div class="text-base text-gray-600"> It’s quick and easy.</div>
                </div>
                <form class="p-7 pt-0 space-y-5" method="post" action="<?php echo base_url()?>WebCntrl/User_registration" id="user_registration">
                        <div class="row">
                                <div class="col-md-6">
                                        <input type="text" name="first_name" id="first_name" placeholder="Your Name" class="with-border">
                                        <span id="txt_first_name"></span>
                                </div>
                                <div class="col-md-6">
                                        <input type="text" placeholder="Last  Name" name="last_name" id="last_name" class="with-border">
                                        <span id="txt_last_name"></span>
                                </div>

                                <div class="col-md-12">
                                        <input type="email" placeholder="Enter your email" class="with-border" name="email" id="email">
                                        <span id="txt_email"></span>
                                </div>

                                <div class="col-md-8">
                                        <div class="mobile-code">
                                                <div class="ct-code">
                                                        <select class="code-select">
                                                                <option> +91</option>
                                                                <option> +44</option>
                                                        </select>
                                                </div>
                                                <div class="mob-no">
                                                        <input type="text" placeholder="Enter your contact number" class="with-border" name="mobile"
                                                               id="register_mobile">
                                                        <span id="txt_mobile"></span>
                                                </div>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                        <input type="text" placeholder="Mobile verify" class="with-border" name="mobile_code"
                                               id="mobile_code">
                                        <span id="txt_mobile"></span>
                                </div>

                                <div class="col-md-6">
                                        <input readonly type="password" placeholder="Password" class="with-border pass-show" name="password"
                                               id="password">
                                        <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                                        <span id="txt_password"></span>
                                </div>
                                <div class="col-md-6">
                                        <input type="password" readonly placeholder="Confirm Password" class="with-border pass-show"
                                               name="confirm_password"
                                               id="confirm_password">
                                        <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                                        <span id="txt_confirm_password"></span>
                                </div>

                                <div class="col-md-6">
                                        <select name="gender" id="gender" class="selectpicker mt-2 with-border" disabled>
                                                <option value="">Select gender</option>
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                                <option value="3">Other</option>
                                        </select>
                                        <span id="txt_gender"></span>
                                </div>
                                <div class="col-md-6">
                                        <label></label>
                                        <input readonly type="date" placeholder="Birthdate" name="birthdate" id="birthdate"
                                               class="with-border">
                                        <span id="txt_birth_date"></span>
                                </div>
                        </div>

                        <P id="age"></P>

                        <p class="text-xs text-gray-400 pt-3">By clicking Sign Up, you agree to our
                                <a href="#" class="text-blue-500">Terms</a>,
                                <a href="#">Data Policy</a> and
                                <a href="#">Cookies Policy</a>.
                                You may receive SMS Notifications from us and can opt out any time.
                        </p>
                        <div class="flex">
                                <button type="button" onclick="master_function('user_registration', 'tr01_user')"
                                        class="bylo-red-600 font-semibold mx-auto px-10 py-3 rounded-md text-center text-white">
                                        Get Started
                                </button>
                        </div>
                </form>

        </div>
</div>

<!-----Login Model for user Model  ----->
<div id="login_model" uk-modal>
    <div class="uk-modal-dialog uk-modal-body rounded-xl shadow-2xl p-0 lg:w-4/12 card-body">
        <button class="uk-modal-close-default bg-gray-100 rounded-full m-3" type="button" uk-close></button>
        <div class="border-b px-7 py-3">
            <div class="lg:text-2xl text-xl font-semibold mb-1"> Sign in</div>
        </div>
        <form class="p-7 pt-0 space-y-5" method="post" action="" id="login_form">
            <div class="row">

                <div class="col-md-12">
                    <input type="text" placeholder="Enter Email / Mobile" name="user_email" id="user_email" class="with-border">
                    <span id="txt_email"></span>
                </div>

                <div class="col-md-12">
                    <input type="password" id="user_password" name="user_password" placeholder="Password"
                           class="with-border pass-show">
                    <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                    <span id="txt_alert_password"></span>
                </div>
            </div>
            <div class="flex">
                <button type="button" onclick="master_function('user_registration', 'tr01_user')"
                        class="bg-green-600 hover:bg-green-500 hover:text-white ft-12 pd-user-login px-5 rounded-md text-center text-white mx-auto">
                    Get Started
                </button>
            </div>
        </form>

    </div>
</div>
<?php
if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
         $url = "https://";
    else
         $url = "http://";
    $url.= $_SERVER['HTTP_HOST'];
    $url.= $_SERVER['REQUEST_URI'];
    if($this->session->userdata('id') == ''){
?>

<div class="modal fade bylo-login" id="login_bylo">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <div class="login-model">
                    <div class="form-login-content">
                        <a href="<?= base_url()?>"> <img src="<?= base_url('assets/images/bylo-logo.jpg')?>"> </a>
                        <h2 class="hello-txt"> Hello Again </h2>
                    </div>
                    <div class="social-login">
                        <p> Login With
                            <button style="background: #2a41e8; padding: 14px 12px 5px 16px;" class="fb-login social-login">
                                <span class="icon-brand-facebook-f" style="color: white;"></span>
                            </button>
                            <button onclick="google_login()" class="google-login social-login" style="background: #e83749; padding: 10px;">
                                <span class="icon-brand-google" style="color: white;"></span>
                            </button>
                        </p>
                    </div>


                    <form action="<?= base_url('WebCntrl/User_login')?>" id="user_login_form" class="pr-6 pl-6 space-y-4 relative login-form rounded-lg card-body" method="post">
                        <md-divider class="login-divider ">
                            <span>OR</span>
                        </md-divider>
                        <div class="row mt-0">
                            <div class="col-md-12 mt-0">
                                <input type="email" name="email" id=user_email_address placeholder="Email or Phone Number" class="with-border">
                                <span id="txt_alert_email"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mt-0">
                                <input type="password" name="user_password" id="user_password_address" placeholder="Password" class="with-border pass-show">
                                <i class="toggle-password fa fa-fw fa-eye-slash"></i>
                                <span id="txt_alert_password"></span>
                            </div>
                        </div>

                        <button type="button" onclick="user_login()" class="bylo-red-600 ft-12 pd-user-login rounded-md text-center text-white w-full">
                            LOGIN NOW
                        </button>

                        <div class="row">
                            <div class="col-md-6 mt-0">
                                <div class="checkbox">
                                    <input type="checkbox" id="chekcbox1" checked="">
                                    <label for="chekcbox1"><span class="checkbox-icon "></span> <span class="pl-2">  Remember Me </span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 pl-0  mt-0">
                                <a href="/forget_password" class="text-blue-500 text-right block forgot-txt"> Forgot
                                    Password? </a>
                            </div>
                        </div>

                        <hr class="pb-3.5">
                        <div class="flex mt-0">
                            <a href="#register" type="button" class="bg-green-600 hover:bg-green-500 hover:text-white ft-12 pd-user-login px-5 rounded-md text-center text-white mx-auto" data-dismiss="modal"  uk-toggle="">
                                Create New Account
                            </a>
                        </div>
                      <!--  <div class="privacy-policy">
                            <p><a href="#modal-terms" uk-toggle=""> Terms Of Use </a> and <a href="#modal-policy" uk-toggle="">
                                    Privacy Policy </a></p>
                        </div>-->
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>
<?php } ?>


<script>
function user_login(){
var email = $('#user_email_address').val();
    var password = $('#user_password_address').val();
    if (email == '') {
        document.getElementById('error_msg_subject').innerHTML = 'Enter Your Email address';
        $('#error_msg').delay(3000).hide('slow');
        $('#error_msg').css('display', 'block');
    } else if (password == '') {
        document.getElementById('error_msg_subject').innerHTML = 'Enter Your Password';
        $('#error_msg').delay(3000).hide('slow');
        $('#error_msg').css('display', 'block');
    } else {
        $.ajax({
            type: 'POST',
            url: 'WebCntrl/User_login',
            data: {email: email, password: password},
            success: function (response) {
                var res = JSON.parse(response);
                if (res['status'] == 1) {
                    $('#user_login').attr('disabled', true);
                    document.getElementById('success_msg_subject').innerHTML = res['message'];
                    $('#success_msg').delay(3000).hide('slow');
                    $('#success_msg').css('display', 'block');
                    $("#login_form").get(0).reset();
                    sessionStorage.setItem('key', res['session']['id']);
                    location.href = "feed";
                    var initials = res['first_name'].charAt(0) + "" + res['last_name'].charAt(0);
                    document.getElementById("profileImage").innerHTML = initials;
                } else {
                    document.getElementById('error_msg_subject').innerHTML = res['message'];
                    $('#error_msg').delay(3000).hide('slow');
                    $('#error_msg').css('display', 'block');
                }
            }
        });
    }
}
</script>