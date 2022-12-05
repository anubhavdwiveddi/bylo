<?php echo $layout['meta'];?>
<div id="wrapper">
        <!-- Header -->
        <?php echo $layout['header'];?>
        <!-- sidebar -->
        <!-- Main Contents -->
        <div class="main_content_photos">
                <div class="back-to-page">
                        <a href="https://byloapp.in/feed" class="">
                                <svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"
                                     data-svg="close-icon">
                                        <line fill="none" stroke="#000" stroke-width="1.1" x1="1" y1="1" x2="13" y2="13"></line>
                                        <line fill="none" stroke="#000" stroke-width="1.1" x1="13" y1="1" x2="1" y2="13"></line>
                                </svg>
                        </a>
                </div>
                <?php if(!empty($public_video)){
                        foreach($public_video as $video){
                ?>
                <div class="container_main fixed left-0 right-0 top-0 mt-12 img-container  bottom-0">
                        <div class="lg:space-x-12">
                                <div class="row">
                                        <div class="col-lg-8 pr-0 pl-0">
                                                <div class="profile_img video-profile">
                                                        <div class="video-single">
                                                                <video controls frameborder="0" width="100%" controlsList="nodownload" uk-video="automute: true" allowfullscreen uk-responsive>
                                                                        <source src="<?= base_url('video_upload/').$video->video_address;?>">
                                                                </video>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="col-lg-4 pl-0">
                                                <div class="side-text-profile">
                                                        <div class="lg:mx-0 uk-animation-slide-bottom-small right-img-comment overflow-visible">
                                                                <!-- post header-->
                                                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                                                        <div class="flex flex-1 items-center space-x-4">
                                                                                <?php if ($video->page_id == ''){ ?>
                                                                                        <img class="bg-gray-200 border border-white rounded-full w-10 h-10" src="<?php echo base_url('upload/').$video->profile_image;?>" alt="Maheshwari-Handwoven-Fabric-with-Gold-Zari-Warp-Stripes-8-scaled-300x400">
                                                                                <?php } else { ?>
                                                                                        <img class="bg-gray-200 border border-white rounded-full w-10 h-10" src="<?php echo base_url('')?><?php if(empty($video->business_Logo)) { echo "$video->avatar_image";} else { echo "upload/$video->business_Logo"; }?>" alt="Maheshwari-Handwoven-Fabric-with-Gold-Zari-Warp-Stripes-8-scaled-300x400">
                                                                                <?php } ?>

                                                                                <div class="flex-1 capitalize">
                                                                                        <?php if ($video->page_id == ''){ ?>
                                                                                        <a href="<?php echo base_url().$video->user_code?>" class="text-black dark:text-gray-100"><?php echo $video->first_name.' '.$video->last_name ?></a>
                                                                                        <?php } else { ?>
                                                                                        <a href="<?php echo base_url().$video->user_code?>" class="text-black dark:text-gray-100"><?php echo $video->user_page_name ?></a>
                                                                                        <?php } ?>
                                                                                        <div class="text-gray-700 flex items-center ft-10 space-x-2"> <?php echo $newdate = date("d F Y", strtotime($video->datetime));?> </a>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <!--<div>
                                                                                <a href="#" aria-expanded="false"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                                                                </a>
                                                                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700 uk-drop" uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">

                                                                                        <ul style="margin-bottom: 0px;">
                                                                                                <li>
                                                                                                        <a onclick="Mysaved('<?php echo $video->id?>', 'video')" href="#" class="flex items-center">
                                                                                                                <i class="<?php if ($video->saved_status == 1){echo "uil-favorite mr-1 text-black-500 bg-blue"; }else {echo "uil-favorite mr-1"; }?>"></i> Save
                                                                                                        </a>
                                                                                                </li>
                                                                                        </ul>

                                                                                </div>-->
                                                                        </div>
                                                                </div>
                                                                <div class="p-3 space-y-3">
                                                                        <div class="flex like-cmt-share space-x-4">
                                                                                <div class="flex space-x-4 lg:font-bold">
                                                                                        <?php foreach($video->post_like as $like) {
                                                                                                if($like->user_id == $this->session->userdata('id')) {
                                                                                        ?>
                                                                                        <img src="<?= base_url('assets/images/web_icon/unLike.svg')?>" class="w-5 unlike" id="unlike_<?=$video->id?>" onclick="videolike('<?= $video->id?>','<?= $like->id?>','<?= $video->user_id?>');">
                                                                                        <?php  } else { ?>
                                                                                        <img src="<?= base_url('assets/images/web_icon/heart01.svg')?>" class="w-5 like" id="like_<?=$video->id?>" onclick="videolike('<?= $video->id?>', '<?= $video->user_id?>')">
                                                                                        <?php } } ?>
                                                                                        <img id="comment" src="<?= base_url('assets/images/web_icon/comment.svg')?>" class="flex items-center space-x-2 w-5" onclick="hide_comment_area('<?php echo $video->id?>')">
                                                                                        <img src="<?= base_url('assets/images/web_icon/share.svg')?>" class="w-5" >
                                                                                        <div class="flex items-center space-x-2 flex-1 justify-end">
                                                                                                <?php
                                                                                                        if(!empty($video->post_like)) {
                                                                                                                foreach($video->post_like as $like) {
                                                                                                                        if($like->post_count != 0) {
                                                                                                ?>
                                                                                                <div style="font-size: 14px;">
                                                                                                        <?php if($this->session->userdata('id') == $like->user_id) { ?>
                                                                                                        Liked by <strong>  you</strong> and <strong> <?= $like->post_count?> other </strong>
                                                                                                        <?php } else { ?>
                                                                                                        Liked by <strong>  <?= $like->first_name .' '. $like->last_name ?> </strong> and <strong> <?= $like->post_count?> other </strong>
                                                                                                        <?php } ?>
                                                                                                </div>
                                                                                                <?php } } } ?>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="bg-gray-100 relative h-20" id="newpost_<?= $video->id?>" style="display:none" >
                                                                                        <input type="text" onkeydown="search(this, '<?= $video->id?>','<?= $video->page_name?>', '<?= $video->user_id?>')"  id="comment_filed_<?= $video->id?>" placeholder="Add your Comment.."
                                                                                               class="bg-transparent max-h-10 py-3 shadow-none px-3" />
                                                                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                                                                <a href="#">
                                                                                                        <ion-icon name="image-outline"
                                                                                                                  class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                                                                                </a>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="comment_area_<?php echo $video->id?>">
                                                                                        <?php
                                                                        if(!empty($video->user_comment)) {
                                                                                        foreach($video->user_comment as $comment) { ?>
                                                                                        <div class="comments-area">
                                                                                                <ul>
                                                                                                        <li>
                                                                                                                <figure><img alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900" src="<?= base_url('upload').$comment->profile_image;?>"></figure>
                                                                                                                <div class="commenter" >
                                                                                                                        <h5><a title="" href="#"><?= $comment->first_name .'  '. $comment->last_name?></a></h5>
                                                                                                                        <span>2 hours ago</span>
                                                                                                                        <p> <?= $comment->comment?> </p>
                                                                                                                </div>
                                                                                                                <div class="flex justify-end" >
                                                                                                                        <div class="p-2 " style="cursor:pointer; position:relative;">
                                                                                                                                <img style="width:20px" onclick="hide_reply_comment_area('<?= $comment->id?>')" src="<?php echo base_url('assets/images/web_icon/share.svg')?>">
                                                                                                                        </div>
                                                                                                                </div>
                                                                                                                <div class="bg-gray-100 relative h-20" id="replypost_<?= $comment->id?>" style="display:none">
                                                                                                                        <input type="text" onkeydown="replycomment(this, '<?= $video->id?>','<?= $comment->id?>', '<?= $video->user_id?>')"  id="comment_filed_<?= $video->id?>" placeholder="Comment Reply...."
                                                                                                                               class="bg-transparent max-h-10 py-3 shadow-none px-3" />
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
                                                                                                                        <li>
                                                                                                                                <figure><img alt="" src="<?= base_url('upload').$child_comment->profile_image?>" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900"></figure>
                                                                                                                                <div class="commenter">
                                                                                                                                        <h5><a title="" href="#"><?= $child_comment->first_name .' '. $child_comment->last_name?></a></h5>
                                                                                                                                        <span>2 hours ago</span>
                                                                                                                                        <p><?= $child_comment->comment?></p>
                                                                                                                                </div>

                                                                                                                        </li>
                                                                                                                        <?php } } ?>
                                                                                                                </ul>
                                                                                                        </li>
                                                                                                </ul>
                                                                                        </div>
                                                                                        <?php } } ?>
                                                                                </div>
                                                                        </div>
                                                                        <div class="flex items-center space-x-3 pt-2">
                                                                                <?php
                                                                                        if(!empty($like_total)){ ?>
                                                                                <div class="flex items-center">
                                                                                        <?php
                                                                                                if(!empty($like_user)) {
                                                                                                foreach ($like_user as $like) {
                                                                                       ?>
                                                                                        <a href="<?php echo base_url().$like->user_code?>"><img src="<?php echo base_url('upload/').$like->profile_image?>" alt=""
                                                                                                                                                class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900"></a>
                                                                                        <?php } }?>
                                                                                </div>
                                                                                <?php if(!empty($like->first_name)){
                                                                                echo "<span>Liked <strong> $like->first_name </strong> and <strong> $like_total->no_of_user Others </strong>
                                        </span> ";
                                                                                } ?>
                                                                                <?php } ?>

                                                                        </div>
                                                                        <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                                                                <div id="output">

                                                                                </div>
                                                                        </div>

                                                                        <!-- end comment form -->
                                                                </div>
                                                                <div class="yes cm-img-upload emoji-relative  sticky right-0 bottom-0">
                                                                        <form method="post" onSubmit="return false;" id="video_comment" enctype="multipart/form-data">
                                                                                <input type="hidden" class="bg-gradient-to-b from-gray-100 to-gray-100" value="" id="video_id">
                                                                                <div class="bg-gray-100 rounded-full rela  dark:bg-gray-800 border-t">

                                                                                        <input type="text" name="comment" onkeypress="video_comment('')" placeholder="Add your Comment.."
                                                                                               class="bg-transparent max-h-10 shadow-none px-5 add_emoji">

                                                                                        <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                                                                <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img" aria-label="happy outline"></ion-icon>
                                                                                                <span class="btn_upload">
													    <input type="file" onkeypress="video_comment('')" name="comment_image" id="imag3" title="" class="input-img"/>
                                                        <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img" aria-label="image outline"></ion-icon>
                                                    </span>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="img-view-ct">
                                                                                        <img id="Imgview3" src="" class="preview3 dimg-none"/>
                                                                                        <input type="button" id="removeImage3" value="x" class="btn-rmv3"/>
                                                                                </div>
                                                                        </form>
                                                                </div>

                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
                <?php } } ?>
        </div>
</div>


<?php echo $layout['footer']?>
<?php echo $layout['js']?>

