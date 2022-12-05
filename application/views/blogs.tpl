<?php echo $layout['meta'];?>
<body>
<div id="wrapper">

    <!-- Header -->
    <?php echo $layout['header'];?>
    <!-- sidebar -->
    <?php echo $layout['sidebar'];?>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer loader">
            <div class="lg:flex  lg:space-x-12">

                <div class="lg:w-4/4">

                    <div class="flex justify-between items-center relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <h2 class="text-2xl font-semibold"> Blog
                                <input type="hidden" name="total_count" id="total_count"
                                       value="<?= $total->total_count;?>"></h2>
                            <!-- <p data-toggle="modal" data-target="#login_bylo">Click to open Modal</p>-->
                            <!--   <nav class="responsive-nav md:m-0 -mx-4 style-2">
                                   <ul uk-switcher="connect: #blogs-tab; animation: uk-animation-fade">
                                       <li><a href="#" class="lg:px-2">   Suggestions </a></li>
                                       <li><a href="#" class="lg:px-2"> Latest </a></li>
                                   </ul>
                               </nav>
                               -->

                        </div>
                    </div>

                    <div class="card divide-y divide-gray-100 px-4" id="post-list">
                        <?php
                        if(!empty($blog_list)){
                            foreach($blog_list as $blog) {
                        ?>
                        <div class="lg:flex lg:space-x-6 py-5 post-item" id="<?= $blog->id?>">
                            <div class="lg:w-60 w-full h-40 overflow-hidden rounded-lg relative shadow-sm">
                                <?php if(!empty($blog->blog_image)) { ?>
                                <?php if(!empty($blog->folder_name)){ ?>
                                <img src="<?php echo base_url('/').$blog->folder_name?><?php echo $blog->blog_image?>"
                                     alt=""
                                     class="w-full h-full absolute inset-0 object-cover">
                                <?php } else { ?>
                                <img src="<?php echo base_url('upload')?><?php echo $blog->blog_image?>" alt=""
                                     class="w-full h-full absolute inset-0 object-cover">
                                <?php } ?>
                                <?php } else { ?>
                                <img src="<?php echo base_url()?>assets/images/blog/img-4.jpg" alt=""
                                     class="w-full h-full absolute inset-0 object-cover">
                                <?php } ?>
                                <div class="absolute bg-blue-100 font-semibold px-2.5 py-1 rounded-full text-blue-500 text-xs top-2.5 left-2.5">
                                    <?= $blog->category_name?>
                                </div>
                            </div>
                            <div class="flex-1 lg:pt-0 pt-4">
                                <?php if($blog->blog_status == 0) { ?>
                                <a href="<?php echo base_url('/').$blog->blog_url?>"
                                   class="text-xl font-semibold line-clamp-2"><?= $blog->blog_title?></a>
                                <?php } else { ?>
                                <?php if($blog->page_id != 0) { ?>
                                <a href="<?php echo base_url()?>blog/<?php echo $blog->user_name?>/<?php echo $blog->blog_url?>"
                                   class="text-xl font-semibold line-clamp-2"><?= $blog->blog_title?></a>
                                <?php } else { ?>
                                <a href="<?php echo base_url()?>blog/<?= $blog->user_code?>/<?= $blog->blog_url?>"
                                   class="text-xl font-semibold line-clamp-2"><?= $blog->blog_title?></a>
                                <?php } ?>
                                <?php } ?>
                                <p class="line-clamp-2 pt-3"><?= $blog->blog_short_description?></p>

                                <div class="flex items-center pt-3">
                                    <div class="flex items-center">
                                        <ion-icon name="thumbs-up-outline" class="text-xl mr-2"></ion-icon>
                                        12
                                    </div>
                                    <div class="flex items-center mx-4">
                                        <ion-icon name="chatbubble-ellipses-outline" class="text-xl mr-2"></ion-icon>
                                        12

                                    </div>
                                    <div class="flex items-center">
                                        <ion-icon name="bookmark-outline" class="text-xl mr-2"></ion-icon>
                                        12
                                    </div>
                                </div>

                            </div>
                        </div>
                        <?php } } ?>
                    </div>
                    <div class="ajax-loader text-center">
                        Loading more posts...
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>


<!-- open chat box -->
<div uk-toggle="target: #offcanvas-chat" class="start-chat">
    <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
    </svg>
</div>

<div id="offcanvas-chat" uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar bg-white p-0 w-full lg:w-80 shadow-2xl">


        <div class="relative pt-5 px-4">

            <h3 class="text-2xl font-bold mb-2"> Chats </h3>

            <div class="absolute right-3 top-4 flex items-center space-x-2">

                <button class="uk-offcanvas-close  px-2 -mt-1 relative rounded-full inset-0 lg:hidden blcok"
                        type="button" uk-close></button>

                <a href="#" uk-toggle="target: #search;animation: uk-animation-slide-top-small">
                    <ion-icon name="search" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <a href="#">
                    <ion-icon name="settings-outline" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <a href="#">
                    <ion-icon name="ellipsis-vertical" class="text-xl hover:bg-gray-100 p-1 rounded-full"></ion-icon>
                </a>
                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                     uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small; offset:5">
                    <ul class="space-y-1">
                        <li>
                            <a href="#"
                               class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="checkbox-outline" class="pr-2 text-xl"></ion-icon>
                                Mark all as read
                            </a>
                        </li>
                        <li>
                            <a href="#"
                               class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="settings-outline" class="pr-2 text-xl"></ion-icon>
                                Chat setting
                            </a>
                        </li>
                        <li>
                            <a href="#"
                               class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="notifications-off-outline" class="pr-2 text-lg"></ion-icon>
                                Disable notifications
                            </a>
                        </li>
                        <li>
                            <a href="#"
                               class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="star-outline" class="pr-2 text-xl"></ion-icon>
                                Create a group chat
                            </a>
                        </li>
                    </ul>
                </div>


            </div>


        </div>

        <div class="absolute bg-white z-10 w-full -mt-5 lg:-mt-2 transform translate-y-1.5 py-2 border-b items-center flex"
             id="search" hidden>
            <input type="text" placeholder="Search.." class="flex-1">
            <ion-icon name="close-outline" class="text-2xl hover:bg-gray-100 p-1 rounded-full mr-4 cursor-pointer"
                      uk-toggle="target: #search;animation: uk-animation-slide-top-small"></ion-icon>
        </div>

        <nav class="responsive-nav border-b extanded mb-2 -mt-2">
            <ul uk-switcher="connect: #chats-tab; animation: uk-animation-fade">
                <li class="uk-active"><a class="active" href="#0"> Friends </a></li>
                <li><a href="#0">Groups <span> 10 </span> </a></li>
            </ul>
        </nav>

        <div class="contact-list px-2 uk-switcher" id="chats-tab">

            <div class="p-1">
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="contact-username"> Alex Dolgove</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="contact-username">Stella Johnson</div>
                </a>

                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="contact-username">Adrian Mohani</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="contact-username"> Jonathan Madano</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-friend.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>


            </div>
            <div class="p-1">
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="contact-username"> Alex Dolgove</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="contact-username">Stella Johnson</div>
                </a>

                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="contact-username">Adrian Mohani</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="contact-username"> Jonathan Madano</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                        <span class="user_status"></span>
                    </div>
                    <div class="contact-username"> Erica Jones</div>
                </a>
                <a href="chats-group.html">
                    <div class="contact-avatar">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                        <span class="user_status status_online"></span>
                    </div>
                    <div class="contact-username"> Dennis Han</div>
                </a>


            </div>

        </div>
    </div>
</div>

<?php echo $layout['js'];?>

<script type="text/javascript">
    $(document).ready(function () {
        windowOnScroll();
    });

    function windowOnScroll() {
        $(window).on("scroll", function (e) {
            var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
            if (scrollBottom) {
                if ($(".post-item").length < $("#total_count").val()) {
                    var lastId = $(".post-item:last").attr("id");
                    getMoreData(lastId);
                }
            }
        });
    }

    function getMoreData(lastId) {
        $(window).off("scroll");
        $.ajax({
            url: '<?= base_url('BlogCntrl/')?>getMoreData/?lastId=' + lastId,
            type:"get",
            beforeSend: function () {
            $('.ajax-loader').show();
            },
        success:function (data) {
            var dataObj = JSON.parse(data);
            $.each(dataObj, function (i, d) {
                setTimeout(function () {
                    $('.ajax-loader').hide();
                    $("#post-list").append('<div class="lg:flex lg:space-x-6 py-5 post-item" id=" ' + d.id + ' ">' +
                        '<div class="lg:w-60 w-full h-40 overflow-hidden rounded-lg relative shadow-sm">' +
                        (d['folder_name'] != '' ? '<img src="' + baseUrl + '/' + d['folder_name'] + '/' + d['blog_image'] + '" class="w-full h-full absolute inset-0 object-cover">' : '<img src="' + baseUrl + '/upload/' + d['blog_image'] + '" class="w-full h-full absolute inset-0 object-cover">') +
                        '<div class="absolute bg-blue-100 font-semibold px-2.5 py-1 rounded-full text-blue-500 text-xs top-2.5 left-2.5">' + d.category_name + '' +
                        '</div>' +
                        '</div>' +
                        '<div class="flex-1 lg:pt-0 pt-4">' +
                        '<a href="#" class="text-xl font-semibold line-clamp-2"> ' + d.blog_title + '</a>' +
                        '<p class="line-clamp-2 pt-3">' + d.blog_short_description + '</p>' +
                        '<div class="flex items-center pt-3">' +
                        '<div class="flex items-center">' +
                        '<ion-icon name="thumbs-up-outline" class="text-xl mr-2"></ion-icon>' +
                        '12' +
                        '</div>' +
                        '<div class="flex items-center mx-4">' +
                        '<ion-icon name="chatbubble-ellipses-outline" class="text-xl mr-2"></ion-icon>' +
                        '12' +
                        '</div>' +
                        '<div class="flex items-center">' +
                        '<ion-icon name="bookmark-outline" class="text-xl mr-2"></ion-icon>' +
                        '12' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>');
                    windowOnScroll();
                }, 1000);
            });
        }
    });
    }
</script>