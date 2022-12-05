<?php echo $layout['meta']; ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<style>
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
        max-width: 93%;
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

    ::before {
        color: #ee4a55;
    }

    span.flex.items-center.space-x-2 {
        cursor: pointer;
    }

    span.icon-material-outline-thumb-up.unlike {
        color: #8167ac;
    }

    span.icon-material-outline-thumb-up.unlike::before {
        color: #8167ac;
    }

    body.modal-open {
        overflow: scroll;
    }

    div#replypost_149 {
        width: 92% !important;
        margin: 0 35px !important;
        border-radius: 5px !important;
    }
    img.bg-gray-200.border.border-white.rounded-full.w-10.h-10 {
        object-fit: cover;
    }

    i.uil-envelope.mr-1::before {
    color: #fff !important;
}
</style>
<?php $data = login_user_data();
?>
<body>
<div id="wrapper">
    <?php echo $layout['header']; ?>
    <?php echo $layout['sidebar']; ?>
    <div class="main_content">
        <div class="mcontainer">
            <div class="lg:flex lg:space-x-1">
                <div class="lg:w-3/4 lg:px-20 space-y-7 feeds-post">
                    <?php echo $layout['post']; ?>
                    <?php
                    if(!empty($feed_data)){
                    foreach ($feed_data as $feed){
                    $date_time = time_ago($feed->datetime); ?>
                    <div class="card lg:mx-0 anubhav">
                        <div class="flex justify-between items-center lg:p-4 p-2.5">
                            <div class="flex flex-1 items-center space-x-4">
                                <?php if($feed->page_name == 0 || $feed->page_name == ''){ ?>
                                <img src="<?= base_url()?><?php if(empty($feed->profile_image)){echo $feed->avatar;}else{echo "upload/".$feed->profile_image;}?>"
                                     class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                <?php } else { ?>
                                <img src="<?= base_url('upload');?><?php if(!empty($feed->business_Logo)) {echo "$feed->business_Logo";}?>"
                                     class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                <?php } ?>

                                <div class="flex-1">
                                    <?php if($feed->page_name == 0 || $feed->page_name == ''){ ?>
                                    <a onmouseover="Myfetch('<?=$feed->id?>')" href="<?= base_url().$feed->user_code?>"
                                       class="text-black"><?= $feed->first_name .' '. $feed->last_name?> </a>
                                    <?php } else { ?>
                                    <a onmouseover="Myfetch('<?=$feed->id?>')"
                                       href="<?= base_url('page/').$feed->city_name.'/'.$feed->user_name?>"
                                       class="text-black"><?= $feed->user_page_name?> </a>
                                    <?php } ?>

                                    <div uk-drop="pos: bottom-center ;animation: uk-animation-slide-left-small" class="hover-name-popup">
                                        <div class="contact-list-box contact-list">
                                            <div id="hover_data_<?=$feed->id?>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-gray-500 flex items-center space-x-2"> <?= $date_time?>
                                    </div>
                                </div>
                            </div>
                            <?php if(!empty($this->session->userdata('id'))){ ?>
                            <div>
                                <a href="#">
                                    <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                </a>

                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                     uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">

                                    <ul class="space-y-1">
                                        <li>
                                            <a uk-toggle="target: #create-post-modal" href="#create-post-modal"
                                               onclick="openModal();"
                                               class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                <i class="uil-share-alt mr-1"></i> Share
                                            </a>
                                        </li>
                                        <?php if ($feed->user_id == $this->session->userdata('id')){ ?>
                                        <li>
                                            <a href="#" uk-toggle="target: #create-post-modal"
                                               class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                <i class="uil-edit-alt mr-1"></i> Edit Post
                                            </a>
                                        </li>
                                        <?php } ?>
                                        <li>
                                            <a onclick="Mysaved('<?=$feed->id?>')" href="#"
                                               class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                <i class="uil-edit-alt mr-1"></i> Save Post
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="-mx-2 my-2 dark:border-gray-800">
                                        </li>
                                        <?php if ($feed->user_id == $this->session->userdata('id')){ ?>
                                        <li>
                                            <a href="#"
                                               class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                                <i class="uil-trash-alt mr-1"></i> Delete
                                            </a>
                                        </li>
                                        <?php } ?>
                                    </ul>

                                </div>
                            </div>
                            <?php } ?>
                        </div>
                        <?php if(!empty($feed->content)){ ?>
                        <div class="pt-0 pb-3 pl-3 pr-3 py-0 border-b dark:border-gray-700">
                            <span><?= $feed->content?> </span>
                        </div>
                        <?php }?>
                        <?php if(!empty($feed->image)){ ?>
                        <a href="javascript:void(0)">
                            <img src="<?= base_url('upload').$feed->image?>" alt=""
                                 class="max-h-96 w-full object-cover">
                        </a>
                        <?php } ?>
                        <div class="p-2 space-y-3">
                            <div class="flex space-x-4 lg:font-bold">
                                <?php if(!empty($feed->post_like)){
                                foreach($feed->post_like as $like) {
                                if($like->user_id == $this->session->userdata('id') && $like->status == 1) {
                                ?>
                                <span class="lcs"> <img src="<?= base_url('assets/images/web_icon/unLike.svg')?>" class="w-5 unlike"
                                                        id="unlike_<?=$feed->id?>"
                                                        onclick="unlikepost('<?= $feed->id?>','<?= $like->id?>','<?= $feed->user_id?>');"></span>
                                <?php  } else { ?>
                                <span class="lcs">   <img src="<?= base_url('assets/images/web_icon/heart01.svg')?>" class="w-5 like"
                                                          id="like_<?=$feed->id?>"
                                                          onclick="likepost('<?= $feed->id?>', '<?= $feed->user_id?>')"></span>
                                <?php } } } else { ?>
                                <span class="lcs">   <img src="<?= base_url('assets/images/web_icon/heart01.svg')?>" class="w-5 like"
                                                          id="like_<?=$feed->id?>"
                                                          onclick="likepost('<?= $feed->id?>', '<?= $feed->user_id?>')"></span>
                                <?php } ?>
                                <span class="lcs">  <img id="comment" src="<?= base_url('assets/images/web_icon/comment.svg')?>"
                                                         class="flex items-center space-x-2 w-5"
                                                         onclick="hide_comment_area('<?php echo $feed->id?>')"> </span>
                                <span class="lcs"> <img src="<?= base_url('assets/images/web_icon/share.svg')?>" class="w-5"></span>
                                <div class="flex items-center space-x-2 flex-1 justify-end">

                                </div>
                            </div>
                            <div class="bg-gray-100 relative h-20" id="newpost_<?= $feed->id?>" style="display:none">
                                <input type="text"
                                       onkeydown="search(this, '<?= $feed->id?>','<?= $feed->page_name?>', '<?= $feed->user_id?>')"
                                       id="comment_filed_<?= $feed->id?>" placeholder="Add your Comment.."
                                       class="bg-transparent max-h-10 py-3 shadow-none px-3"/>
                                <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                    <a href="#">
                                        <ion-icon name="image-outline"
                                                  class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                </div>
                            </div>
                            <div class="comment_area_<?php echo $feed->id?>">
                                <?php if(!empty($feed->user_comment)) {
                                foreach($feed->user_comment as $comment) { ?>
                                <div class="comments-area">
                                    <ul>
                                        <li>
                                            <figure>
                                                <img alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900"
                                                     src="<?= base_url()?><?php if(!empty($comment->profile_image)){echo "upload/".$comment->profile_image;}else {echo "$comment->avatar_image";}?>">
                                            </figure>
                                            <div class="commenter">
                                                <h5><a title="" href="#"><?= $comment->first_name .' '.
                                                        $comment->last_name?></a></h5>
                                                <span>2 hours ago</span>
                                                <p> <?= $comment->comment?> </p>

                                            </div>
                                            <div class="flex justify-end">
                                                <div class="p-2 " style="cursor:pointer; position:relative;">
                                                    <img style="width:20px"
                                                         onclick="hide_reply_comment_area('<?= $comment->id?>')"
                                                         src="<?php echo base_url('assets/images/web_icon/share.svg')?>">
                                                </div>
                                            </div>
                                            <div class="bg-gray-100 relative h-20" id="replypost_<?= $comment->id?>"
                                                 style="display:none">
                                                <input type="text"
                                                       onkeydown="replycomment(this, '<?= $feed->id?>','<?= $comment->id?>', '<?= $feed->user_id?>')"
                                                       id="comment_filed_<?= $feed->id?>"
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
                                                <li>
                                                    <figure>
                                                        <img alt="" src="<?= base_url('upload').$child_comment->profile_image?>"
                                                                 class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                                    </figure>
                                                    <div class="commenter">
                                                        <h5><a title="" href="#"><?= $child_comment->first_name .' '.
                                                                $child_comment->last_name?></a></h5>
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
                    </div>
                    <?php } } ?>
                </div>
                <div class="lg:w-72 w-full" id="user_birthday">
                    <?php if(!empty($user_birthday)) {
                     foreach($user_birthday as $birth) {
                     ?>
                    <div class="bg-white mb-5 px-4 py-3 rounded-md shadow">
                        <span class="text-line-through font-semibold"> Birthdays </span>
                        <a href="#birthdays" uk-toggle>
                            <div class="-mx-2 duration-300 flex hover:bg-gray-50 px-2 py-2 rounded-md">
                                <img src="<?php echo base_url();?>/assets/images/icons/gift-icon.png"
                                     class="w-9 h-9 mr-3" alt="">
                                <p class="line-clamp-2 leading-6">
                                    <span>
                                        <?= $birth->first_name .'  '. $birth->last_name ?> </span> and
                                    <span> two others </span> have a birthdays to day .
                                </p>
                            </div>
                        </a>
                    </div>
                    <?php } } ?>
                    <?php
                     if(!empty($request)){
                        foreach($request as $friend){
                         if($friend->status == 2){
                    ?>
                    <div id="friend_request" class="lg:w-72 w-full">
                        <div class="bg-white mb-5 px-4 py-3 rounded-md shadow">
                            <span class="icon-feather-users"></span>
                            <span class="text-line-through font-semibold"> Friend requests </span>
                            <div class="-mx-3 duration-300 items-center flex hover:bg-gray-50 px-3 py-3 rounded-md">
                                <div class="req-img  mr-3">
                                    <a href="<?= base_url()?>/user/<?= $friend->user_code;?>" class="w-9 h-9 mr-3"> <img
                                                src="<?php echo base_url('upload');?>/<?= $friend->profile_image?>"
                                                class="bg-gray-200 border border-white rounded-full w-10 h-10"
                                                alt=""></a>
                                </div>
                                <p class="leading-6 req-name"><a href="<?= base_url()?>/user/<?= $friend->user_code;?>"
                                                                 class="font-medium"><span><?= $friend->
                                            first_name;?> <?= $friend->last_name?> </span></a>
                                    <span class="req-btn mt-2">
                              <button class="button primary flex-1 block mr-2"
                                      onclick="confirm_request('<?php echo $friend->sender_id?>')"
                                      type="button">Confirm </button>
                              <button class="button bg-gray-btn flex-1 block mr-2"
                                      onclick="delete_request('<?php echo $friend->id?>')"
                                      type="button">Delete </button>
                              </span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <?php } } } ?>


                    <div class="" uk-sticky="offset:80">

                        <div class="contact-list">
                            <?php
                           if(!empty($friend_list)) {
                               foreach($friend_list as $friend) {
                           ?>
                            <a href="<?php echo base_url('');?><?= $friend->user_code;?>">
                                <div class="contact-avatar"
                                     onmouseover="fetch_user('<?php echo $friend->receiver_id?>')">
                                    <?php if(!empty($friend->profile_image)) { ?>
                                    <img src="<?php echo base_url('upload/');?><?= $friend->profile_image;?>" alt="">
                                    <?php } else { ?>
                                    <img src="<?php echo base_url();?><?= $friend->avatar_image;?>" alt="">
                                    <?php } ?>
                                    <span class="user_status status_online"></span>
                                </div>
                                <div class="contact-username"> <?= $friend->first_name .' '. $friend->last_name?></div>
                            </a>
                            <div uk-drop="pos: left-center ;animation: uk-animation-slide-left-small"
                                 class="hover-name-popup">
                                <div class="contact-list-box contact-list">
                                    <div id="hover_user_data_<?php echo $friend->receiver_id?>">
                                    </div>
                                </div>
                            </div>
                            <?php } }?>

                            
                            <h4 class="text-xl font-semibold"> Blog </h4>
                            <div class=" blog-list-feed py-4">
                                <?php
                                if(!empty($blog_data)) {
                                    foreach($blog_data as $blog) {
                                ?>
                                <div class="lg:flex lg:space-x-6">
                                    <a href="blog-read.html">
                                        <div class="lg:w-20 w-full h-16 overflow-hidden rounded-lg relative shadow-sm">
                                            <img src="<?= base_url('/').$blog->blog_image?>" alt=""
                                                 class="w-full h-full absolute inset-0 object-cover">
                                        </div>
                                    </a>
                                    <div class="flex-1 lg:pt-0 pt-2">
                                        <a href="<?= base_url('blog/').$blog->user_name.'/'.$blog->blog_url?>" class="title-blog-feed font-semibold line-clamp-2">
                                            <?= $blog->blog_title?></a>
                                        <p class="line-clamp-1 blog-time-feed"> <?= date("d-m-Y", strtotime($blog->datetime));?> </p>
                                    </div>
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
<div id="birthdays" uk-modal>
    <div class="uk-modal-dialog uk-modal-body rounded-xl shadow-lg">
        <button class="uk-modal-close-default p-2.5 bg-gray-100 rounded-full m-3" type="button" uk-close></button>
        <div class="flex items-center space-x-3 mb-10">
            <ion-icon name="gift" class="text-yellow-500 text-xl bg-yellow-50 p-1 rounded-md"></ion-icon>
            <div class="text-xl font-semibold"> Today's birthdays</div>
        </div>
        <div class="space-y-6">
            <div class="sm:space-y-8 space-y-6 pb-2">
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt=""
                         class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"><a href="#"> Alex Dolgove </a></div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""
                         class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"><a href="#"> Stella Johnson </a></div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
            </div>
            <div class="relative cursor-pointer" uk-toggle="target: #upcoming; animation: uk-animation-fade">
                <div class="bg-gray-50 rounded-lg px-5 py-4 font-semibold text-base"> Upcoming birthdays</div>
                <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400"
                   id="upcoming" hidden></i>
                <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400"
                   id="upcoming"></i>
            </div>
            <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming" hidden>
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-6.jpg" alt=""
                         class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"><a href="#"> Erica Jones </a></div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
                <div class="flex items-center sm:space-x-6 space-x-3">
                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt=""
                         class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                    <div class="flex-1">
                        <div class="flex items-center justify-between mb-3">
                            <div class="text-base font-semibold"><a href="#"> Dennis Han </a></div>
                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                        </div>
                        <div class="relative">
                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $layout['message']?>
<?php echo $layout['Create_story']?>
<?php echo $layout['footer']?>
<?php echo $layout['js']?>
<script>
</script>
<script>
    $("#file-input").change(function () {
        filename = this.files[0].name
        console.log(filename);
    });
</script>
<script>
    $("#doc_file").change(function () {
        filename = this.files[0].name
        console.log(filename);
    });

    function openModal() {
        $('#create-post-modal').modal('show');
    }
</script>
