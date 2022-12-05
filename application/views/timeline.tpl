<?php echo $layout['meta'];?>
<style>
    .user-profile-menu .uk-sticky.uk-active.uk-sticky-fixed {
        z-index: 1;
        background: rgb(255, 255, 255);
        position: fixed;
        top: 64px !important;
        width: 571px !important;
    }

    a.text-black {
        font-size: 14px;
    }

    .flex.items-center.space-x-2.flex-1.justify-end {
        font-size: 13px;
    }

    .flex.space-x-4 svg {
        cursor: pointer;
    }

    .comments-area {
        display: inline-block;
        width: 100%;
    }

    .comments-area > ul {
        display: inline-block;
        list-style: outside none none;
        margin-bottom: 0;
        width: 100%;
        padding-left: 0;
    }

    .card {
        background: #80808003;
    }

    ul, ol {
        margin-top: 0;
    }

    .comments-area > ul li {
        display: inline-block;
        margin-top: 20px;
        width: 100%;
    }

    .comments-area > ul li .sub_li {
        display: inline-block;
        margin-top: 0px !important;
        width: 100%;
    }


    .comments-area > ul li figure {
        display: inline-block;
        vertical-align: top;
    }

    .commenter {
        background: #fff none repeat scroll 0 0;
        border-radius: 6px;
        display: inline-block;
        margin-bottom: 5px;
        margin-left: 4px;
        max-width: 90%;
        padding: 8px 10px;
        vertical-align: top;
        width: 100%;
    }

    .commenter > h5 {
        display: inline-block;
        font-size: 12px;
        margin-bottom: 0;
        margin-right: 10px;
    }

    h1, h2, h3, h4, h5, h6 {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        color: #3e3f5e;
    }

    .commenter > span {
        color: #92929e;
        font-size: 11px;
    }

    .commenter > p {
        display: inline-block;
        font-size: 12px;
        margin-bottom: 0;
        margin-top: 5px;
        width: 100%;
    }

    p {
        color: #7d7e9e;
        font-size: 14px;
        line-height: 24px;
        font-family: 'Roboto', sans-serif;
        margin-top: 0;
        font-weight: 300;
    }

    .commenter > span {
        color: #92929e;
        font-size: 11px;
    }

    .commenter > a {
        display: inline-block;
        font-size: 12px;
        width: 100%;
        color: #ff7373;
    }

    .sub-ul {
        padding-left: 30px;
    }

</style>
<div id="wrapper">
    <?php echo $layout['header'];?>
    <?php echo $layout['sidebar'];?>
    <?php

if(!empty($user_data)) {
foreach($user_data as $user) {
?>
    <div class="main_content">
        <div class="mcontainer">
            <div class="profile user-profile user-pr-banner">
                <div class="uk-margin add-file-page">
                    <div class="business-cover profiles_banner center-block">
                        <figure>
                            <div class="avatar-upload defailt-banner">
                                <?php if($user->id == $this->session->userdata('id')){ ?>
                                <form method="POST" id="reg_form"
                                      action="<?php echo base_url('WebCntrl/update_banner_image')?>"
                                      enctype="multipart/form-data">
                                    <!--banner---->
                                    <label class="cabinet">
                                        <input type='file' class="item-img file fl-none center-block"
                                               name="banner_image" accept=".png, .jpg, .jpeg"/>
                                    </label>

                                    <div class="profile_action absolute bottom-0 right-0 space-x-1.5 p-3 text-sm z-50 hidden lg:flex">
                                        <div>
                                            <a class="flex items-center justify-center h-8 px-3 rounded-md bg-gray-700 bg-opacity-70 text-white space-x-1.5"
                                               href="#user_banner_upload" uk-toggle>
                                                <ion-icon name="create-outline" class="text-xl"></ion-icon>
                                                <span> Change Cover Photo </span>
                                                <span></span>
                                            </a>
                                        </div>
                                    </div>
                                    <!--banner---->

                                    <div style="display:none;" id="save_crop">
                                        <div class="profile_action absolute top-0 right-0 space-x-1.5 p-3 text-sm z-50 hidden lg:flex">
                                            <button type="button" id="banner_update"
                                                    class="label-ct" for="imageUpload"><span
                                                        class="flex items-center justify-center h-8 px-3 rounded-md bg-gray-700 bg-opacity-70 text-white space-x-1.5"> Save</span>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="user-pr-banner">
                                        <div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog"
                                             aria-labelledby="myModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                    aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">
                                                        </h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="upload-demo" class="center-block"></div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">Close
                                                        </button>
                                                        <button type="button" id="cropImageBtn"
                                                                onclick="update_banner_image('<?php echo $this->session->userdata('id')?>', '')"
                                                                class="btn btn-primary">Save
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <?php } ?>
                                <div class="avatar-preview">
                                    <?php if(!empty($user->banner_image)) { ?>
                                    <img class="profile-user-img img-responsive gambar img-responsive" id="imagePreview"
                                         src="<?= base_url('')?><?php if(empty($user->folder_name)){ echo " $user->banner_image";}
                                    else {echo "upload/$user->banner_image";}?>"
                                    alt="User profile picture">
                                    <?php } else { ?>
                                    <img class="profile-user-img img-responsive gambar img-responsive" id="imagePreview"
                                         src="<?php echo base_url()?>assets/images/group/group-cover-1.jpg"
                                         alt="User profile picture">
                                    <?php } ?>
                                </div>
                            </div>
                        </figure>
                    </div>
                </div>

                <div id="user_banner_upload" uk-modal>
                    <div class="uk-modal-dialog">
                        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
                        <div class="uk-modal-header">
                            <h2 class="uk-modal-title">Banner Update</h2>
                        </div>

                        <!------  profile update popup  ------->
                        <form method="post" id="banner_image_form" enctype="multipart/form-data">
                            <div class="uk-modal-body profile_popup">
                                <div class="profile-update">
                                    <div class="avatar-upload">
                                        <div class="avatar-edit pr-update">
                                            <input type='file' id="imageUploadbanner" name="imageUpload"
                                                   accept=".png, .jpg, .jpeg"/>
                                            <label for="imageUploadbanner">
<span class="btn-text">
	<span class="icon-feather-plus"></span>
	Upload Banner Image
</span>
                                            </label>
                                        </div>
                                        <div class="avatar-preview">
                                            <img class="profile-user-img img-responsive" id="imagePreviewbanner1"
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

                                <div class="uk-modal-footer text-right" id="">
                                    <button class="button" type="button" onclick="updatebanner('<?= $user->id?>')">
                                        Save
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="profiles_content">
                    <div class="profile_avatar">
                        <div class="profile_avatar_holder">
                            <?php if(!empty($user->profile_image)) { ?>
                            <img src="<?php echo base_url('upload/')?><?= $user->profile_image;?>" alt="">
                            <?php } else { ?>
                            <img src="<?php echo base_url('')?><?= $user->avatar_image;?>" alt="">
                            <?php } ?>
                        </div>

                        <?php
if($user->id == $this->session->userdata('id')){
                        ?>
                        <a onclick="gepageid('')" href="#user_profile" uk-toggle>
                            <div class="icon_change_photo">
                                <ion-icon name="camera" class="text-xl"></ion-icon>
                            </div>
                        </a>
                        <?php } ?>
                    </div>

                    <div class="profile_info">
                        <h1><?= $user->first_name;?> <?= $user->last_name;?></h1>
                        <!--<p> Family , Food , Fashion , Fourever</p>-->
                    </div>
                    <span style="display:none;" id="user"><?= $user->user_id;?></span>
                </div>
                <div class="flex user-profile-menu justify-between lg:border-t border-gray-100 flex-col-reverse lg:flex-row pt-2"
                     id="request">
                    <div class="" uk-sticky="offset:80">
                        <div class=" pl-3">
                            <ul class="nav nav-tabs  b-tab nav nav-tabs nav-tabs b-tab -mb-0.5 lg:pl-2">
                                <li class="nav-item"><a class="nav-link nav-li active"
                                                        href="#timeline-friend">Timeline</a>
                                </li>
                                <li class="nav-item"><a class="nav-link nav-li" href="#friend-about">About</a></li>
                                <li class="nav-item"><a class="nav-link nav-li" href="#connections">Connection</a></li>
                                <li class="nav-item"><a class="nav-link nav-li" href="#photos">Photos </a></li>
                                <!-- <li><a href="#">Groups</a></li>-->
                                <li class="nav-item"><a class="nav-link nav-li" href="#videos">Videos</a></li>
                            </ul>
                        </div>
                    </div>
                    <?php if ($user->id == $this->session->userdata('id')) { ?>
                    <div class="flex items-center space-x-1.5 flex-shrink-0 pr-4 mb-2 justify-center order-1 relative">
                        <?php
if ($user->id == $this->session->userdata('id')) { ?>
                        <div class="social-icon-header mt-2">
                            <ul>
                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100">
                                        <i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100">
                                        <i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100">
                                        <i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100"><i
                                                class="fa fa-whatsapp" aria-hidden="true"></i></a></li>
                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100">
                                        <i class="fa fa-linkedin" aria-hidden="true"></i></a></li>

                                <li><a href="#"
                                       class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100">
                                        <i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <?php } else {
if(!empty($sent_request)) {
if($sent_request->status == 1) { ?>
                        <div class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
                            <span class="icon-feather-users"></span>
                            <span> Friends </span>
                        </div>
                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                             uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                            <ul class="space-y-1">
                                <li>
                                    <a href="#" onclick=""
                                       class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800 request_id">
                                        <span class="icon-feather-star space mr-2"></span> Favourites
                                    </a>
                                </li>
                                <li>
                                    <a href="#" onclick="delete_request('<?php echo $sent_request->id?>')"
                                       class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <span class="icon-feather-user-x space mr-2"></span> Unfriend
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <?php } else if($sent_request->sender_id == $user->user_id) { ?>
                        <div class="flex items-center justify-center h-9 px-5 rounded-md bg-gray-600 text-white  space-x-1.5">
                            <span class="icon-feather-user"></span>
                            <span> Respond </span>
                        </div>
                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                             uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                            <ul class="space-y-1">
                                <li>
                                    <a href="#" onclick="confirm_request('<?php echo $sent_request->id?>')"
                                       class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800 request_id">
                                        <span class="icon-feather-user-check space mr-2"></span> Confirm Request
                                    </a>
                                </li>
                                <li>
                                    <a href="#" onclick="delete_request('<?php echo $sent_request->id?>')"
                                       class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                        <span class="icon-feather-user-x space mr-2"></span> Reject Request
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <?php } else if($sent_request->sender_id == $this->session->userdata('id')){ ?>
                        <button type="button" onclick="delete_request('<?php echo $sent_request->id?>')"
                                class="flex items-center justify-center h-9 px-5 rounded-md bg-gray-600 text-white  space-x-1.5">
                            <span class="icon-feather-user-x"></span>
                            <span> Cancel Request </span>
                        </button>
                        <?php } else { ?>
                        <button type="button" onclick="sent_request('<?php echo $user->user_id?>')"
                                class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
                            <span class="icon-feather-user-plus"></span>
                            <span> Add Friends </span>
                        </button>
                        <?php } } else { ?>
                        <button type="button" onclick="sent_request('<?php echo $user->user_id?>')"
                                class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
                            <span class="icon-feather-user-plus"></span>
                            <span> Add Friends </span>
                        </button>
                        <?php } } ?>
                        <!-- search dropdown -->
                        <div class="absolute right-3 bg-white z-10 w-full flex items-center border rounded-md"
                             id="profile-search" hidden="">
                            <input type="text" placeholder="Search.." class="flex-1">
                            <ion-icon name="close-outline"
                                      class="text-2xl hover:bg-gray-100 p-1 rounded-full mr-2 cursor-pointer md hydrated"
                                      uk-toggle="target: #profile-search;animation: uk-animation-slide-top-small"
                                      role="img" aria-label="close outline"></ion-icon>
                        </div>

                        <!-- more icon -->
                    </div>
                    <?php } ?>
                </div>
            </div>

            <div class="tab-content  lg:mt-8 mt-4">
                <div class="tab-pane active in" id="timeline-friend">
                    <!-- Timeline -->
                    <div class="md:flex md:space-x-6 lg:mx-0">
                        <div class="space-y-5 flex-shrink-0 md:w-7/12">
                            <!---load post model-->
                            <?php echo $layout['post']?>
                            <?php if(!empty($post_data)){
foreach($post_data as $post){
$date1 = strtotime('Y-m-d');
$date2 = strtotime($post->datetime);
                            $diff = $date2 - $date1;
                            round($diff / 86400);
                            $result = round($diff);
                            ?>
                            <div class="card lg:mx-0 anubhav">
                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                    <div class="flex flex-1 items-center space-x-4">
                                        <img src="<?= base_url('upload');?><?php if(!empty($post->profile_image)) {echo "$post->profile_image";}?>"
                                             class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                        <div class="flex-1">
                                            <a onmouseover="Myfetch('<?=$post->id?>')"
                                               href="<?= base_url().$post->user_code?>"
                                               class="text-black font-semibold ft-14 dark:text-gray-100"><span><?= $post->
                                                    first_name .' '. $post->last_name?></span> </a>
                                            <div uk-drop="pos: bottom-center ;animation: uk-animation-slide-left-small"
                                                 class="hover-name-popup">
                                                <div class="contact-list-box contact-list">
                                                    <div id="hover_data_<?=$post->id?>">

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-gray-700 flex items-center space-x-2">
                                                <span><?= time_ago($post->datetime);?> </span>
                                                <ion-icon name="people"></ion-icon>
                                            </div>

                                        </div>
                                    </div>
                                    <?php if($user->id == $this->session->userdata('id')){ ?>
                                    <div>
                                        <a href="#">
                                            <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                        </a>
                                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                             uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                            <ul class="space-y-1">
                                                <li>
                                                    <a href="#" uk-toggle="target: #create-post-modal"
                                                       class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                        <i class="uil-share-alt mr-1"></i> Share
                                                    </a>
                                                </li>
                                                <?php
		if($post->user_id == $this->session->userdata('id')){
                                                ?>
                                                <!---<li>
                                                    <a href="#" uk-toggle="target: #create-post-modal"class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                        <i class="uil-edit-alt mr-1"></i> Edit Post
                                                    </a>
                                                </li>
                                                <li>
                                                    <hr class="-mx-2 my-2 dark:border-gray-800">
                                                </li>--->
                                                <!---<li>
                                                    <a href="#"
                                                    class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                        <i class="uil-trash-alt mr-1"></i> Delete
                                                    </a>
                                                </li>--->
                                                <?php } ?>
                                            </ul>
                                        </div>
                                    </div>
                                    <?php } ?>


                                </div>
                                <div class="pt-0 pb-3 pl-3 pr-3 py-0 border-b dark:border-gray-700">
                                    <span><?= $post->content;?> </span>
                                </div>
                                <?php if(!empty($post->image)){ ?>
                                <img src="<?= base_url('upload/').$post->image?>" alt=""
                                     class="max-h-96 w-full object-cover">
                                <?php } ?>
                                <div class="p-4 space-y-3">
                                    <div class="flex space-x-4 ">
                                        <?php foreach($post->post_like as $like) {
                                        if($like->user_id == $this->session->userdata('id')){
                                        ?>
                                        <img style="width:20px"
                                             onclick="unlikepost('<?= $post->id?>','<?= $like->id?>','<?= $post->user_id?>');"
                                             src="<?php echo base_url('assets/images/web_icon/unLike.svg')?>" alt=""
                                             class="max-h-96 w-full object-cover">
                                        <?php } else { ?>
                                        <img style="width:20px" data="85"
                                             src="<?php echo base_url('assets/images/web_icon/heart01.svg')?>"
                                             onclick="likepost('<?= $post->id?>','<?= $post->user_id?>')" alt=""
                                             class="max-h-96 w-full object-cover">
                                        <?php } } ?>
                                        <span class="flex items-center space-x-2">
<svg id="comment_<?= $post->id?>" onclick="hide_comment_area('<?= $post->id?>')" width="20px" data-name="Layer 1"
     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 336.56 336.56">
	<defs>
		<style>.cls-1{fill:url(#linear-gradient);}.cls-2{fill:#fff;}</style>
		<linearGradient id="linear-gradient" x1="34.79" y1="168.28" x2="301.77" y2="168.28"
                        gradientUnits="userSpaceOnUse">
			<stop offset="0.08" stop-color="#f15648"/>
			<stop offset="0.36" stop-color="#eb107c"/>
			<stop offset="0.7" stop-color="#8a63aa"/>
			<stop offset="1" stop-color="#73c6ef"/>
		</linearGradient>
	</defs>
	<path class="cls-1"
          d="M34.79,168.43c.41-65.5,48.45-121.68,113.09-131.67A133,133,0,0,1,300,146.94c4.8,29.32,0,57.32-13.93,83.62a8,8,0,0,0-.51,7c5.09,14.94,10,29.94,15,44.9,1.88,5.59,1.48,10.72-2.81,15s-9.48,4.69-15,2.83c-15.16-5.08-30.34-10.1-45.47-15.24a6.68,6.68,0,0,0-5.85.47c-79.24,42.4-176.72-4.06-193.62-92.37C36.16,185,35.74,176.68,34.79,168.43ZM267.16,267c-.44-1.42-.71-2.38-1-3.33-2.58-7.78-4.86-15.68-7.86-23.3-2.66-6.73-1.67-12.36,2-18.54,14.12-23.95,18.31-49.81,12.14-76.87-12.83-56.26-64.92-91.12-122-82.15-47,7.4-84.77,47.8-88.44,95.34-2.93,38.05,10.48,69.65,40.24,93.57,23,18.5,49.75,25.53,79.14,22.16a101.65,101.65,0,0,0,42.3-14.73c4.93-3,9.77-3.77,15.09-1.59,1,.39,2,.68,2.95,1Z"/>
<path class="cls-2"
      d="M277.79,277.63l-28.2-9.34c-1.09-.36-2.2-.69-3.26-1.12-5.9-2.41-11.26-1.61-16.72,1.76a112.38,112.38,0,0,1-46.85,16.32C150.21,289,120.59,281.2,95.1,260.7c-33-26.49-47.81-61.5-44.57-103.64,4.06-52.65,45.9-97.4,98-105.59,63.19-9.94,120.88,28.68,135.09,91,6.84,30,2.2,58.62-13.44,85.14-4,6.85-5.13,13.09-2.19,20.54,3.33,8.44,5.85,17.2,8.71,25.81C277,275,277.31,276.05,277.79,277.63Z"/></svg>
</span>
                                        <a href="#" class="flex items-center space-x-2">

                                            <svg id="Layer_1" width="20px" data-name="Layer 1"
                                                 xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 336.56 336.56">
                                                <defs>
                                                    <style>.cls-1{stroke-miterlimit:10;stroke-width:6.08px;fill:url(#linear-gradient);stroke:url(#linear-gradient-2);}</style>
                                                    <linearGradient id="linear-gradient" x1="26.7" y1="168.28"
                                                                    x2="309.86" y2="168.28"
                                                                    gradientUnits="userSpaceOnUse">
                                                        <stop offset="0.08" stop-color="#f15648"/>
                                                        <stop offset="0.36" stop-color="#eb107c"/>
                                                        <stop offset="0.7" stop-color="#8a63aa"/>
                                                        <stop offset="1" stop-color="#73c6ef"/>
                                                    </linearGradient>
                                                    <linearGradient id="linear-gradient-2" x1="23.66" y1="168.28"
                                                                    x2="312.9" y2="168.28"
                                                                    xlink:href="#linear-gradient"/>
                                                </defs>
                                                <path class="cls-1"
                                                      d="M309.86,60.47c-1.66,3.26-3.18,6.61-5,9.77q-62.44,107-124.94,214c-2.45,4.2-5.59,7.34-10.59,8-8,1.09-14.61-3.82-15.9-11.84-1.4-8.72-2.66-17.48-4-26.21q-5.65-37-11.32-74c-1.36-8.92-2.69-17.84-4.18-26.74a6.37,6.37,0,0,0-2-3.62Q82.45,109.69,32.82,69.7c-9.24-7.41-7.23-19.31.76-23.57A19.27,19.27,0,0,1,41,44.27c3.76-.31,7.55-.09,11.33-.09H293.74c9,0,12.83,2.68,15.93,11.1,0,.08.13.14.19.2ZM137.93,144c4.33-2.48,8.47-4.88,12.64-7.23,2.71-1.52,5-1.13,6.29,1s.57,4.58-2.16,6.19c-3.57,2.11-7.14,4.23-10.8,6.16a2.7,2.7,0,0,0-1.58,3.32c.66,3.81,1.22,7.64,1.8,11.46q5.7,37.16,11.38,74.29c2,13.3,4.05,26.59,6.11,39.88.51,3.31,2.46,5.06,5.48,5.14s4.36-1.87,5.67-4.11Q236.29,171.22,299.84,62.41c.34-.58.61-1.21,1.18-2.37-1.43.76-2.32,1.2-3.17,1.69C256.39,85.52,231.15,99.19,189.69,123a22.82,22.82,0,0,1-3.18,1.65,4.06,4.06,0,0,1-4.2-6.71,10.67,10.67,0,0,1,2.27-1.54c41-23.53,65.74-36.91,106.71-60.43,1.63-.93,3.22-1.92,4.83-2.88l-.17-.59H43.24c-1.19,0-2.58-.3-3.54.2a10.2,10.2,0,0,0-4.24,3.37c-1.47,2.52-.41,4.67,2.75,7.23l86.42,69.93Q131.28,138.61,137.93,144Z"/>
                                            </svg>
                                        </a>
                                        <div class="flex items-center space-x-2 flex-1 justify-end">

                                        </div>
                                    </div>
                                    <div class="bg-gray-100 relative h-20" id="newpost_<?= $post->id?>"
                                         style="display:none">
<textarea placeholder="Add your Comment.."
          class="bg-transparent max-h-10 py-3 shadow-none px-3"></textarea>
                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">

                                            <a href="#">
                                                <ion-icon name="link-outline"
                                                          class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="">
                                        <?php
if(!empty($post->user_comment)){
                                        foreach ($post->user_comment as $comment){
                                        ?>
                                        <div class="comments-area">
                                            <ul>
                                                <li>
                                                    <figure><img alt=""
                                                                 class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900"
                                                                 src="<?= base_url('upload').$comment->profile_image;?>">
                                                    </figure>
                                                    <div class="commenter" style="max-width: 93%; width:100%">
                                                        <h5><a title="" href="#"><?= $comment->first_name .' '.
                                                                $comment->last_name?></a></h5>
                                                        <!--<span>2 hours ago</span>-->
                                                        <p> <?= $comment->comment?> </p>
                                                    </div>
                                                    <div class="flex justify-end">
                                                        <div class="p-2 " style="cursor:pointer; position:relative;">
                                                            <img style="width:20px"
                                                                 onclick="hide_reply_comment_area('<?= $comment->id?>')"
                                                                 src="<?php echo base_url('assets/images/web_icon/share.svg')?>">
                                                        </div>
                                                    </div>
                                                    <div class="bg-gray-100 relative h-20"
                                                         id="replypost_<?= $comment->id?>" style="display:none">
                                                        <input type="text"
                                                               onkeydown="replycomment(this, '<?= $post->id?>','<?= $comment->id?>', '<?= $post->user_id?>')"
                                                               id="comment_filed_<?= $post->id?>"
                                                               placeholder="Comment Reply...."
                                                               class="bg-transparent max-h-10 py-3 shadow-none px-3"/>
                                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                            <a href="#">
                                                                <ion-icon name="image-outline"
                                                                          class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <ul class="sub-ul">
                                                        <?php
						if(!empty($comment->post_child_comment)){
                                                        foreach($comment->post_child_comment as $child_comment){ ?>
                                                        <li class="sub_li">
                                                            <figure>
                                                                <img alt=""
                                                                     src="<?= base_url('upload').$child_comment->profile_image?>"
                                                                     class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                                            </figure>
                                                            <div class="commenter">
                                                                <h5><a title="" href="#"><?= $child_comment->first_name
                                                                        .' '. $child_comment->last_name?></a></h5>
                                                                <span>2 hours ago</span>
                                                                <p><?= $child_comment->comment?></p>
                                                            </div>
                                                            <a title="Like" href="#"><i class="icofont-heart"></i></a>
                                                            <a title="Reply" href="#" class="reply-coment"><i
                                                                        class="icofont-reply"></i></a>
                                                        </li>
                                                        <?php } } ?>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <?php } }?>
                                    </div>

                                </div>

                            </div>
                            <?php } } ?>

                        </div>

                        <div class="w-full space-y-6">

                            <div class="widget card p-5">
                                <h4 class="text-lg font-semibold pb-5"> About </h4>

                                <ul class="text-gray-600 space-y-3 mt-3">
                                    <li class="flex space-x-2">
                                        <?php if(!empty($user->city)){ echo "
                                        <ion-icon name='globe'
                                                  class='rounded-full bg-gray-200 text-xl p-1 mr-3'></ion-icon>
                                        From $user->city, $user->state";}?>
                                    </li>
                                    <?php if(!empty($user->relationship)) { ?>
                                    <li class="flex items-center space-x-2">
                                        <ion-icon name="heart-sharp"
                                                  class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                        <?php  echo $user->relationship;?> <?php if(!empty($user->partner_name)){ echo
                                        "$user->partner_name";}?>
                                    </li>
                                    <?php } ?>
                                    <?php if(!empty($user->working)) { ?>
                                    <li class="flex items-center space-x-2">
                                        <ion-icon name="logo-rss"
                                                  class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                        <?= $user->working;?>
                                    </li>
                                    <?php } ?>
                                    <!---<li class="flex items-center space-x-2">
                                    <ion-icon name="logo-rss"
                                    class="rounded-full bg-gray-200 text-xl p-1 mr-3"></ion-icon>
                                    Studied MCA at Sanghvi Institute of Management and Science
                                    </li>--->
                                </ul>
                            </div>

                            <div class="widget card p-5 border-t">
                                <div class="flex items-center justify-between mb-4">
                                    <div>
                                        <h4 class="text-lg font-semibold"> Photos </h4>
                                    </div>

                                    <ul class="nav nav-tabs">
                                        <li>
                                            <a href="#photos" class="text-blue-600 ">See all Photos</a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="grid grid-cols-3 gap-3 text-gray-600 font-semibold">
                                    <?php
if(!empty($photos_grid)){
foreach($photos_grid as $photo) {
$result = substr($photo->image_alt_name, 0, 15);
                                    ?>
                                    <a href="<?php echo base_url('photo/').str_replace(' ', '-', $result).'/'.$photo->photos_id?>">
                                        <div class="avatar relative rounded-md overflow-hidden w-full h-24 mb-2">
                                            <img src="<?php echo base_url('upload')?><?= $photo->image_address?>" alt=""
                                                 class="w-full h-full object-cover absolute">
                                        </div>
                                    </a>
                                    <?php } } ?>
                                </div>
                            </div>
                            <div class="" uk-sticky="offset:80">
                                <div class="widget card p-5 border-t">
                                    <div class="flex items-center justify-between mb-4">
                                        <div>
                                            <h4 class="text-lg font-semibold"> Connection </h4>
                                            <span class="ft-15 flex items-center space-x-2">
</span>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li>
                                                <a href="#connections" class="text-blue-600 ">See all Connection</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="grid grid-cols-3 gap-3 text-gray-600 font-semibold">
                                        <?php
if(!empty($friend_list)) {
foreach($friend_list as $friend) {
	if($user->user_id == $friend->sender_id){
                                        ?>
                                        <a href="<?php echo base_url();?><?php echo $friend->user_code?>">
                                            <div class="avatar relative rounded-md overflow-hidden w-full h-24 mb-2">
                                                <img src="<?php echo base_url('upload/');?><?php echo $friend->profile_image?>"
                                                     alt=""
                                                     class="w-full h-full object-cover absolute">
                                            </div>
                                        </a>
                                        <?php } } }?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- About Friend  -->
                <div class="tab-pane" id="friend-about">
                    <div class="max-w-6xl mx-auto">
                        <h2 class="text-xl font-bold pb-2"> About</h2>
                        <div class="bg-white about_user lg:divide-x lg:flex lg:shadow-md rounded-md shadow lg:rounded-xl overflow-hidden lg:m-0 -mx-4">
                            <div class="lg:w-1/3">
                                <nav class="responsive-nav setting-nav setting-menu profile_about">
                                    <h4 class="mb-0 p-3 uk-visible@m hidden"> Setting Navigation </h4>
                                    <ul uk-switcher="connect: #user-tab; animation: uk-animation-fade">
                                        <li class="uk-active"><a href="#"> <i class="uil-cog"></i> Overview </a></li>
                                        <li><a href="#"> <i class="uil-user"></i> Work and education </a></li>
                                        <li><a href="#"> <i class="uil-usd-circle"></i> Contact and basic info</a></li>
                                        <!--<li><a href="#"> <i class="uil-unlock-alt"></i> Family and relationships </a>
                                        </li>-->
                                        <li><a href="#"> <i class="uil-dollar-alt"></i> Details about you</a></li>
                                        <!--	<li><a href="#"> <i class="uil-scenery"></i> Places lived</a></li>
                                        <li><a href="#"> <i class="uil-shield-check"></i> Life events</a></li>  -->
                                    </ul>
                                </nav>
                            </div>
                            <div class="lg:w-2/3">
                                <div class="contact-list px-2 uk-switcher" id="user-tab">
                                    <div class="p-1">
                                        <div class="grid md:grid-cols-1 sm:grid-cols-1 grid-cols-1 gap-x-2 gap-y-4 mt-3 mt-m-0">
                                            <div class="widget p-5 pt-m-0">
                                                <h4 class="text-lg font-semibold"></h4>
                                                <ul class="text-gray-600 space-y-3 mt-3">
                                                    <?php
		if(!empty($user_experience)) {
			foreach($user_experience as $experience) {
			?>
                                                    <li class="flex  space-x-2">
                                                        <div class="div-ab1">
                                                            <ion-icon class=" ft-abt p-1 mr-3 icon-feather-briefcase">
                                                                Working
                                                            </ion-icon>
                                                        </div>
                                                        <div class="div-ab2">
                                                            <span> <?= $experience->position ?> at <?= $experience->
                                                                company_name ?> </span><br/>
                                                            <span class="div-ab3"><?= $experience->city?></span>
                                                        </div>
                                                    </li>
                                                    <?php } } ?>
                                                    <?php
			if(!empty($user_education)) {
				foreach($user_education as $education){
				?>
                                                    <li class="flex  space-x-2">
                                                        <div class="div-ab1">
                                                            <ion-icon
                                                                    class=" ft-abt-ed p-1 mr-3 icon-material-outline-school"></ion-icon>
                                                            <span class="font-semibold ab-details"></span>
                                                        </div>
                                                        <div class="div-ab2">
						<span> Studied at <?= $education->
                            college_name ?></span><br/>
                                                            <span class="div-ab3"> Attended from <?= $newdate = date("Y", strtotime($education->
                                                                from_date));?> To <?= $newdate = date("Y", strtotime($education->
                                                                to_date));?></span>
                                                        </div>

                                                    </li>
                                                    <?php } } ?>
                                                    <li class="flex space-x-2">
                                                        <?php if(!empty($user->
                                                        city)){echo "<div class='div-ab1'><ion-icon class='p-1 ft-abt mr-3 icon-material-outline-language'></ion-icon></div> <div class='div-ab2'><span>$user->city, $user->state </span></div>";}
                                                        ?>
                                                    </li>
                                                    <li class="flex  space-x-2">

                                                        <?php if(!empty($user->relationship)) {
                                                        echo "
                                                        <div class='div-ab1'>
                                                            <ion-icon
                                                                    class='text-xl p-1 mr-3 icon-material-outline-favorite-border'></ion-icon>
                                                        </div>
                                                        <div class='div-ab2'>
                                                            <span> $user->relationship;</span>
                                                        </div>
                                                        ";}?>
                                                    </li>
                                                    <li class="flex  space-x-2">
                                                        <div class="div-ab1">
                                                            <ion-icon
                                                                    class=" text-xl p-1 mr-3 icon-feather-phone-call"></ion-icon>
                                                        </div>
                                                        <div class="div-ab2">
                                                            <span><a href="tel:<?= $user->mobile;?>"><?= $user->
                                                                    mobile;?></a></span>
                                                        </div>

                                                    </li>
                                                </ul>

                                            </div>
                                        </div>
                                    </div>
                                    <!------ tab 2 ---->
                                    <div class="p-1">
                                        <div class="grid md:grid-cols-1 sm:grid-cols-1 grid-cols-2 gap-x-2 gap-y-4 mt-3">
                                            <div class="p-4">
                                                <h4 class="text-lg font-semibold"> Work </h4>
                                                <?php
	if($user->id == $this->session->userdata('id')) {
                                                ?>
                                                <div class="pb-0 pt-2 flex space-x-3" style="color: #2563eb;">
                                                    <button type="button"
                                                            onclick="add_multiple_rows('work_experience')">
                                                        <span class="icon-material-outline-add-circle-outline"> </span>
                                                        Add work experience
                                                    </button>
                                                </div>

                                                <?php } ?>
                                                <div class="col-span-2">
                                                    <div class="col-span-2 pt-2  job_list" id="job_list">
                                                    </div>
                                                </div>
                                                <div class="col-span-1 mb-2">
                                                    <label class="font-semibold" class="semibold"></label>
                                                </div>
                                                <?php
	if(!empty($user_experience)) {
		foreach($user_experience as $experience) {
		?>
                                                <div class="col-span-2">
                                                    <form method="post" id="user_working_data"
                                                          action="<?= base_url('MasterCntrl/update_data')?>">
                                                        <div class="space-y-3 working_data"
                                                             id="working_<?= $experience->id?>">
                                                            <div class="flex items-center">
                                                                <div class="switches-list -mt-8 is-large">
                                                                    <div class="switch-container">
                                                                        <label class="switch">
                                                                            <?php if($experience->status == 1){ ?>
                                                                            <input type="checkbox" checked>
                                                                            <?php } else { ?>
                                                                            <input type="checkbox">
                                                                            <?php } ?>
                                                                            <span class="switch-button"></span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div> <?= $experience->position ?>
                                                                        at <?= $experience->company_name ?>
                                                                    </div>
                                                                    <span style="font-size: 11px;"><?= $experience->
                                                                        city?> <?php if (!empty($newdate = date("Y", strtotime($experience->
                                                                        from_date)))){ echo $newdate; } ?> <?php if(!empty($experience->
                                                                        to_date)) { echo date("Y", strtotime($experience->to_date)); }?></span>
                                                                </div>
                                                                <?php
							if($user->id == $this->session->userdata('id'))
                                                                {
                                                                ?>
                                                                <div class="switches-list -mt-8 is-large">
                                                                    <div class="col-md-1 pd5" style="display: flex;">
                                                                        <button type="button" class="ibtnDel"
                                                                                style="margin-right: 10px;">
                                                                            <span class="icon-feather-trash-2"></span>
                                                                        </button>
                                                                        <button type="button"
                                                                                onclick="about_data('<?= $experience->user_id?>', 'tr01_user_working')"
                                                                                class="ibtnDel edit">
                                                                            <span class="icon-feather-edit-2"></span>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <?php } ?>
                                                            </div>
                                                            <hr>
                                                        </div>

                                                    </form>
                                                </div>
                                                <?php } }?>


                                                <div></div>
                                                <div class="col-span-2 pb-2">
                                                    <label for="" class="font-semibold">Education</label>
                                                </div>

                                                <?php
		if($user->id == $this->session->userdata('id')) {
                                                ?>
                                                <div class="pb-0 pt-3 flex space-x-3" style="color: #2563eb;">
                                                    <button type="button" onclick="add_multiple_rows('college')"><span
                                                                class="icon-material-outline-add-circle-outline">
				</span> Add college or university
                                                    </button>
                                                </div>
                                                <?php } ?>
                                                <div class="col-span-2">
                                                    <div class="col-span-2 lg:p-6 p-0 job_list" id="education_list">
                                                    </div>
                                                </div>
                                                <div class="col-span-1 mb-2">
                                                    <label class="font-semibold" class="semibold"></label>
                                                </div>
                                                <?php
		if(!empty($user_education)) {
			foreach($user_education as $education){
				
			?>
                                                <div class="col-span-2" id="user_education">
                                                    <div>
                                                        <div class="space-y-3">
                                                            <div class="flex items-center">
                                                                <div class="switches-list -mt-8 is-large">
                                                                    <div class="switch-container">
                                                                        <label class="switch">
                                                                            <?php if($education->status == 1){ ?>
                                                                            <input type="checkbox" checked>
                                                                            <?php } else { ?>
                                                                            <input type="checkbox">
                                                                            <?php } ?>
                                                                            <span class="switch-button"></span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div> <?php echo $education->college_name?></div>
                                                                    <span style="font-size: 11px;"><?php echo $education->
                                                                        field?> <?= $newdate = date("Y", strtotime($education->
                                                                        from_date));?> - <?= $newdate = date("Y", strtotime($education->
                                                                        to_date));?></span>
                                                                </div>
                                                                <?php
								if($user->id == $this->session->userdata('id'))
                                                                {
                                                                ?>
                                                                <div class="switches-list -mt-8 is-large">
                                                                    <div class="col-md-1 pd5" style="display: flex;">
                                                                        <button type="button"
                                                                                id="education_<?php echo $education->id?>"
                                                                                value="tr01_user_education"
                                                                                class="ibtnDel"
                                                                                onclick="deletedata('<?php echo $education->id?>')"
                                                                                style="margin-right: 10px;">
                                                                            <span class="icon-feather-trash-2"></span>
                                                                        </button>
                                                                        <button type="button" class="ibtnDel edit">
                                                                            <span class="icon-feather-edit-2"></span>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <?php } ?>
                                                            </div>
                                                            <hr>
                                                        </div>

                                                    </div>
                                                </div>
                                                <?php } }?>


                                            </div>
                                        </div>
                                    </div>
                                    <!------ tab 3 ---->

                                    <div class="p-1">
                                        <div class="grid md:grid-cols-1 sm:grid-cols-1 grid-cols-2 gap-x-2 gap-y-4 mt-3">
                                            <div class="widget p-5">
                                                <h4 class="text-lg font-semibold"> Contact info </h4>
                                                <ul class="text-gray-600 space-y-3 mt-3">
                                                    <li class="flex  space-x-2">
                                                        <ion-icon class="p-1 mr-3 icon-feather-phone-call"></ion-icon>
                                                        <span class="font-semibold">	Mobile :</span>
                                                        <span><a href="tel:<?php echo $user->mobile;?>"><?php echo $user->
                                                                mobile;?></a></span>
                                                    </li>
                                                    <li class="flex  space-x-2">
                                                        <ion-icon
                                                                class=" ft-abt p-1 mr-3 icon-material-outline-email"></ion-icon>
                                                        <span class="font-semibold">Email :</span>
                                                        <span><a href="mailto:<?php echo $user->email;?>"><?php echo $user->
                                                                email;?></a> </span>

                                                    <li class="flex  space-x-2">
                                                        <ion-icon class="p-1 ft-abt mr-3 icon-feather-user"></ion-icon>
                                                        <span class="font-semibold">Gender :  </span> <span>
				<?php if($user->gender == 1){
					echo "Male";
					} else if ($user->gender == 2) {
					echo "Female";
					} else if ($user->gender == 3) {
				echo "Other"; }
				?>
			</span>
                                                    </li>
                                                    <li class="flex  space-x-2">
                                                        <ion-icon
                                                                class=" ft-abt p-1 mr-3 icon-material-outline-cake"></ion-icon>
                                                        <span class="font">Birth date : </span>
                                                        <span> <?= $newdate = date("d M Y", strtotime($user->
                                                            birthdate));?></span>
                                                    </li>
                                                    <div class="col-span-2 pb-2">
                                                        <label for="" class="font-semibold">Social links</label>
                                                        <?php if($user->id == $this->session->userdata('id')) { ?>
                                                        <div class="" style="color: #2563eb;">
                                                            <button onclick="add_multiple_rows('social_media')"
                                                                    type="button"><span
                                                                        class="icon-material-outline-add-circle-outline">
						</span> Add your Social Link
                                                            </button>
                                                        </div>
                                                        <?php } ?>
                                                        <div id="social_media">

                                                        </div>
                                                    </div>
                                                    <?php
			if(!empty($user_social)) {
				foreach($user_social as $social) {
				?>
                                                    <ul class="social-user-link">
                                                        <li><span class="font-medium text-sm"><?php echo $social->
                                                                social_name?></span> : <a
                                                                    class="underline text-blue-700" target="_blank"
                                                                    href="<?php echo $social->social_link?>"> <?php echo $social->
                                                                social_link?></a>
                                                            <?php if($this->session->userdata('id')== $user->id){ ?>
                                                            <button type="button" class="ibtnDel gray float-right">
                                                                <span class="icon-feather-trash-2"></span>
                                                            </button>
                                                            <?php } ?>
                                                        </li>
                                                    </ul>
                                                    <?php } } ?>

                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                    <!------ tab 4 ---->
                                    <!--<div class="p-1">
                                    <div class="grid md:grid-cols-1 sm:grid-cols-1 grid-cols-2 gap-x-2 gap-y-4 mt-3">
                                    <div class="widget p-5">
                                        <h4 class="text-lg font-semibold"> Relationship </h4>
                                        <ul class="text-gray-600 space-y-3 mt-3">
                                            <?php if($user->relationship == 'Single') { ?>
                                                <li class="flex  space-x-2">
                                                    <ion-icon
                                                    class="ft-abt  p-1 mr-3 icon-material-outline-favorite-border"></ion-icon>
                                                    <span class="font"><?php echo $user->relationship;?></span>
                                                    <span> </span>
                                                </li>
                                                <?php } else { ?>

                                                <li class="flex  space-x-2">
                                                    <?php if(!empty($user->partner_name)) {
                                                        echo "<ion-icon class='ft-abt  p-1 mr-3 icon-material-outline-favorite-border'></ion-icon>
                                                        <span class='font'>with $user->relationship $user->partner_name </span>
                                                    <span> </span>";}?>
                                                </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                    </div>
                                    </div>-->
                                    <!------ tab 5 ---->
                                    <div class="p-1">
                                        <div class="grid md:grid-cols-1 sm:grid-cols-1 grid-cols-2 gap-x-2 gap-y-4 mt-3">
                                            <div class="widget p-5">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <h4 class="text-lg font-semibold"> Details about you </h4>
                                                    </div>
                                                    <!--  <div class="col-lg-6">
                                                          <button id="add_about_you" class="blue-color"><i class="icon-material-outline-add-circle-outline" aria-hidden="true"></i> Add About
                                                        <button>
                                                    </div>-->
                                                </div>
                                                <!-- <div id="about-you-form" style="display:none;">

                                                    <div class="about-you-form">
                                                    <form>
                                                    <textarea class="form-control" rows="2" id="comment"></textarea>
                                                    <div class="form-about-footer">
                                                    <button id="bach_btn_about_you" class="bg-gray-600 flex h-9 items-center justify-center rounded-md text-white mr-2 px-5 font-medium"> Cancel</button>
                                                    <button id="bach_btn_about_you" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium"> save</button>
                                                    </div>
                                                    </form>
                                                    </div>
                                                </div>-->

                                                <!--  <div id="about-you-form-edit" style="display:none;">

                                                    <div class="about-you-form">
                                                    <form>
                                                    <textarea class="form-control" rows="2" id="comment"></textarea>
                                                    <div class="form-about-footer">
                                                    <button id="bach_btn_about_edit" class="bg-gray-600 flex h-9 items-center justify-center rounded-md text-white mr-2 px-5 font-medium"> Cancel</button>
                                                    <button id="bach_btn_about_edit" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium"> Update</button>
                                                    </div>
                                                    </form>
                                                    </div>
                                                </div>-->
                                                <div id="us_about_content">
                                                    <div class="text-gray-600 space-y-3 mt-3">
                                                        <!--  <div class="flex  space-x-2">
                                                            <ion-icon
                                                            class="ft-abt  p-1 mr-3 icon-material-outline-textsms"></ion-icon>
                                                            <span class="font">	About :</span>
                                                            <button id="us_about_edit_btn" class="blue-color"><span class="icon-feather-edit-2"></span> Edit About</button>
                                                        </div>-->
                                                        <div class="us-about">
                                                            <p><?= $user->about?></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>


                    </div>

                </div>
                <!--- tab member -=-->
                <div class="tab-pane fade" id="connections">
                    <div class="card md:p-6 p-4 max-w-6xl mx-auto">

                        <div class="justify-between items-start relative md:mb-4 mb-3">

                            <div class="widget search-member">
                                <div class="find-friend-header mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h3 class="text-lg font-semibold mb-0"> Connections </h3>
                                        </div>
                                        <div class="col-lg-6 mt-0">
                                            <div class="row">
                                                <!--<div class="col-lg-5">-->
                                                <div class="search-friend">
                                                    <i class="uil-search-alt"></i>
                                                    <input class="search-input-friends" type="text"
                                                           placeholder="Search">
                                                </div>
                                                <!--</div>-->
                                                <?php
		if($user->user_id == $this->session->userdata('id')) {
                                                ?>
                                                <!--<div class="col-lg-4">
                                                    <a href="<?php echo base_url()?>friends"
                                                    class="flex items-center justify-center blue-text">
                                                    Friend requests
                                                    </a>
                                                    </div>
                                                    <div class="col-lg-3">
                                                    <a href="<?php echo base_url()?>friends"
                                                    class="flex items-center justify-center  blue-text">
                                                    Find requests
                                                    </a>
                                                </div>--->
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="main">
                                    <div class="row">
                                        <?php
if(!empty($friend_list)) {
	foreach($friend_list as $friend) {
		if($user->user_id == $friend->sender_id){
                                        ?>
                                        <div class="col-lg-6">
                                            <div class="flex items-center space-x-4 rounded-md card-friend -mx-2 p-3 hover:bg-gray-50 title">
                                                <a href="<?php echo base_url()?><?php echo $friend->user_code?>"
                                                   class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                                    <img src="<?php echo base_url('upload')?><?php echo $friend->profile_image?>"
                                                         class="absolute w-full h-full inset-0 " alt="">
                                                </a>
                                                <div class="flex-1">
                                                    <a href="<?php echo base_url()?><?php echo $friend->user_code?>"
                                                       class="text-base font-semibold capitalize"><?php echo $friend->
                                                        first_name .' '. $friend->last_name?></a>
                                                    <?php if($friend->city != 0 && $friend->country != 0) { ?>
                                                    <div class="text-sm text-gray-500 mt-0.5"> Lives
                                                        in <?php echo $friend->city .', '. $friend->country?>
                                                    </div>
                                                    <?php } ?>
                                                </div>
                                                <?php if(!empty($this->session->userdata('id'))) { ?>
                                                <button>
                                                    <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                                </button>

                                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                                     uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                                    <ul class="space-y-1">
                                                        <li>
                                                            <a href="#"
                                                               class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                                <i class="icon-feather-user-x mr-1"></i> Unfriend
                                                            </a>
                                                        </li>
                                                    </ul>

                                                </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php } } } ?>

                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>


                <!-- Photos  -->
                <div class="tab-pane fade" id="photos">
                    <div class="card md:p-6 p-2 max-w-6xl mx-auto">

                        <div class="flex justify-between items-start relative md:mb-4 mb-3">
                            <div class="flex-1">
                                <h2 class="text-xl font-bold"> Photos </h2>
                            </div>
                            <?php
if($user->id == $this->session->userdata('id')) {
                            ?>
                            <a onclick="page_image_id('<?= $user->id?>','user')" href="#add-image-modal" uk-toggle
                               class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white absolute right-0"
                               data-tippy-placement="left" title="Create New Album">
                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </a>
                            <?php }?>
                        </div>
                        <div class="" id="user-img-tab">
                            <div class="p-1">
                                <div class="grid md:grid-cols-5 sm:grid-cols-3 grid-cols-2 gap-3 mt-2">
                                    <?php if(!empty($photos_data)){
foreach($photos_data as $photo) {
?>
                                    <div>
                                        <div class=" max-w-full lg:h-44 h-36 rounded-lg relative shadow uk-transition-toggle">
                                            <img src="<?php echo base_url('upload');?><?= $photo->image_address;?>"
                                                 class="w-full h-full absolute object-cover inset-0">
                                            <?php
		if($user->id == $this->session->userdata('id')) {
                                            ?>
                                            <div class="top-2 right-2 absolute" aria-expanded="false">
                                                <button class="del-btn-photo" type="button">
                                                    <span class="icon-feather-edit"></span>
                                                </button>
                                            </div>

                                            <!------ Remove photo model ---->

                                            <div class="uk-width-small photo-edit" uk-drop="mode: click">
                                                <div class="card p-3">
                                                    <div class="uk-drop-grid" uk-grid>
                                                        <button id="education_<?php echo $photo->id?>"
                                                                value="tr02_photos_data"
                                                                onclick="deletedata('<?php echo $photo->id?>')"
                                                                type="button">
                                                            Remove
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <?php } ?>
                                            <!-- overly-->
                                        </div>
                                    </div>
                                    <?php } }?>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Groups  -->
                <!----tab 4--->

                <!--  <div class="card md:p-6 p-2 max-w-6xl mx-auto">

                <div class="flex justify-between items-start relative md:mb-4 mb-3">
                <div class="flex-1">
                <h2 class="text-xl font-bold"> Groups </h2>
                </div>
                <a href="create-group.html" data-tippy-placement="left" data-tippy=""
                data-original-title="Create New Album"
                class="bg-blue-100 font-semibold py-2 px-6 rounded-md text-sm md:mt-0 mt-3 text-blue-600">
                Create
                </a>

                </div>
                <div class="" id="group-tab">

                <div class="p-1">
                <div class="grid md:grid-cols-2  grid-cols-2 gap-x-2 gap-y-4 mt-3">

                <div class="flex items-center flex-col md:flex-row justify-center p-4 rounded-md shadow hover:shadow-md md:space-x-4">
                <a href="timeline-group.html" iv=""
                class="w-16 h-16 flex-shrink-0 overflow-hidden rounded-full relative">
                <img src="<//?php echo base_url();?>/assets/images/group/group-3.jpg"
                class="absolute w-full h-full inset-0 " alt="">
                </a>
                <div class="flex-1">
                <a href="timeline-page.html" class="text-base font-semibold capitalize">Graphic
                Design </a>
                <div class="text-sm text-gray-500"> 54 mutual friends</div>
                </div>
                <button class="bg-gray-100 font-semibold py-2 px-3 rounded-md text-sm md:mt-0 mt-3">
                Following
                </button>
                </div>
                <div class="flex items-center flex-col md:flex-row justify-center p-4 rounded-md shadow hover:shadow-md md:space-x-4">
                <a href="timeline-group.html" iv=""
                class="w-16 h-16 flex-shrink-0 overflow-hidden rounded-full relative">
                <img src="<//?php echo base_url();?>/assets/images/group/group-4.jpg"
                class="absolute w-full h-full inset-0 " alt="">
                </a>
                <div class="flex-1">
                <a href="timeline-page.html" class="text-base font-semibold capitalize">
                Mountain Riders </a>
                <div class="text-sm text-gray-500"> 54 mutual friends</div>
                </div>
                <button class="bg-gray-100 font-semibold py-2 px-3 rounded-md text-sm md:mt-0 mt-3">
                Following
                </button>
                </div>

                </div>

                <div class="flex justify-center mt-6">
                <a href="#"
                class="bg-white dark:bg-gray-900 font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
                Load more ..</a>
                </div>
                </div>
                </div>
                </div> -->

                <!-- Videos -->
                <div class="tab-pane fade" id="videos">
                    <div class="card md:p-6 p-2 max-w-6xl mx-auto">

                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="text-xl font-bold"> Videos </h2>
                            </div>
                            <div class="col-lg-6">
                                <div class="right-ct">
                                    <?php
if($user->id == $this->session->userdata('id')) {
                                    ?>
                                    <a onclick="page_video_id('<?= $user->id?>','user')" href="#add-video-modal"
                                       uk-toggle
                                       class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
                                       title="Add Photos">
                                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                                  clip-rule="evenodd"></path>
                                        </svg>
                                    </a>
                                    <?php }?>
                                </div>

                            </div>
                        </div>

                        <div class="" id="friend-tab">
                            <!----- tab 1 ------>
                            <div class="p-1">
                                <div class="grid md:grid-cols-3 grid-cols-2  gap-x-2 gap-y-4 mt-3">
                                    <?php
if(!empty($video_list)){
foreach($video_list as $video){
?>
                                    <div>
                                        <a href="<?php echo base_url()?>video_watch/<?php echo $video->Video_id?>"
                                           class="w-full h-36 rounded-lg relative block">
                                            <video class="w-full h-full absolute inset-0 object-cover">
                                                <source src="<?php echo base_url('video_upload')?><?php echo $video->video_address?>">
                                            </video>
                                            <?php
			if($user->id == $this->session->userdata('id')) {
                                            ?>
                                            <div class="top-2 right-2 absolute" aria-expanded="false">
                                                <button class="del-btn-photo" type="button"><span
                                                            class="icon-feather-edit"></span></button>
                                            </div>
                                            <div class="uk-width-small photo-edit" uk-drop="mode: click">
                                                <div class="card p-3">
                                                    <div class="uk-drop-grid" uk-grid>
                                                        <button type="button">
                                                            Remove
                                                        </button>

                                                    </div>
                                                </div>
                                            </div>
                                            <?php } ?>
                                            <span class="absolute bg-black bg-opacity-60 bottom-1 font-semibold px-1.5 py-0.5 right-1 rounded text-white text-xs"> 12:21</span>
                                            <img src="<?php echo base_url();?>assets/images/icon-play.svg"
                                                 class="w-12 h-12 uk-position-center" alt="">
                                        </a>
                                    </div>
                                    <?php } } ?>

                                </div>
                            </div>

                        </div>


                    </div>
                </div>

            </div>

        </div>
    </div>
    <?php } }?>
</div>
<?php echo $layout['message']?>
<?php echo $layout['footer']?>
<?php echo $layout['js']?>
