<?php echo $layout['meta']?>
<div id="wrapper">

        <?php echo $layout['header']?>
        <!-- sidebar -->
        <?php echo $layout['sidebar']?>
        <!-- Main Contents -->
        <div class="main_content">
                <div class="mcontainer">
                        <div class="flex justify-between relative md:mb-4 mb-2">
                                <div class="flex-1">
                                        <!--  <h2 class="text-2xl font-semibold">Latest Videos </h2>  -->
                                </div>
                        </div>

                        <!--All Video  -->
                        <div class="relative watch-video">
                                <div class="lg:px-40">
                                        <?php
                                                if(!empty($publish_video)) {
                                                foreach($publish_video as $video) {
                                        ?>
                                        <div class="card lg:mx-0 uk-animation-slide-bottom-small mb-4">
                                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                                        <div class="flex flex-1 items-center space-x-4">
                                                                        <?php if($video->page_id ==0 || $video->page_id =='') { ?>
                                                                        <img src="<?php echo base_url('upload/').$video->profile_image?>"
                                                                             class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                                                <?php } else { ?>
                                                                <img src="<?= base_url('')?><?php if(!empty($video->business_Logo)){echo "upload/$video->business_Logo";}else {echo "avatar_image";}?>"
                                                                     class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                                                <?php } ?>
                                                                <div class="flex-1  capitalize">

                                                                        <div class="text-black font-semibold dark:text-gray-100">
                                                                                <?php if($video->page_id ==0 || $video->page_id =='') { ?>
                                                                                        <?= $video->first_name .' '. $video->last_name?>
                                                                                <?php } else { ?>
                                                                                <?= $video->user_page_name?>
                                                                                <?php } ?>
                                                                        </div>
                                                                        <div class="flex space-x-2 items-center text-sm mt-1">
                                                                                <div><?php echo date("d F Y", strtotime($video->datetime))?></div>
                                                                                <div class="md:block hidden"></div>
                                                                                <!--<div> 156.9K views</div>-->
                                                                        </div>
                                                                </div>
                                                        </div>
                                                        <div>
                                                                <a href="#" aria-expanded="false">
                                                                        <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                                                </a>
                                                                <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700 uk-drop" uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                                                        <ul class="space-y-1">
                                                                                <!---<li>
                                                                                        <a href="#"
                                                                                           class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                                                                <i class="uil-share-alt mr-1"></i> Share
                                                                                        </a>
                                                                                </li>-->

                                                                                <li>
                                                                                        <a href="#"
                                                                                           class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                                                                <i class="uil-favorite mr-1"></i> Save
                                                                                        </a>
                                                                                </li>
                                                                        </ul>

                                                                </div>
                                                        </div>
                                                </div>

                                                <div class="w-full h-full">
                                                        <a href="<?php echo base_url('video/').$video->Video_id;?>">
                                                                <span class="cr-pointer">
                                                                        <video controls autoplay muted class="max-h-96 w-full object-cover">
                                                                                <source src="<?php echo base_url()?>video_upload<?= $video->video_address?>">
                                                                        </video>
                                                                </span>
                                                        </a>
                                                </div>

                                                <div class="p-4 space-y-3">

                                                        <div class="flex space-x-4">
                                                                <?php foreach($video->post_like as $like) {
                                                                if($like->user_id == $this->session->userdata('id')) {
                                                                ?>
                                                                <img src="<?= base_url('assets/images/web_icon/unLike.svg')?>" class="w-5 unlike" id="unlike_<?=$video->id?>" onclick="videolike('<?= $video->id?>','<?= $like->id?>','<?= $video->user_id?>');">
                                                                <?php  } else {
                                                                        ?>
                                                                <img src="<?= base_url('assets/images/web_icon/heart01.svg')?>" class="w-5 like" id="like_<?=$video->id?>" onclick="videolike('<?= $video->id?>', '<?= $video->user_id?>')">
                                                                <?php } } ?>
                                                                <!--<span class="icon-material-outline-thumb-up"> Comment </span>
                                                                <span class="icon-material-outline-thumb-up flex items-center flex-1 justify-end"> Share </span>-->

                                                        </div>
                                                        <!--<div class="flex items-center space-x-3 pt-2">
                                                            <div class="flex items-center">
                                                                <img src="assets/images/avatars/avatar-1.jpg" alt=""
                                                                     class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                                                <img src="assets/images/avatars/avatar-4.jpg" alt=""
                                                                     class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                                                <img src="assets/images/avatars/avatar-2.jpg" alt=""
                                                                     class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                                            </div>
                                                            <div class="dark:text-gray-100">
                                                                Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                                            </div>
                                                        </div>

                                                        <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                                            <div class="flex">
                                                                <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                                    <img src="assets/images/avatars/avatar-1.jpg" alt=""
                                                                         class="absolute h-full rounded-full w-full">
                                                                </div>
                                                                <div>
                                                                    <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                                        <p class="leading-6">In ut odio libero vulputate
                                                                            <urna class="i uil-heart"></urna>
                                                                            <i class="uil-grin-tongue-wink"> </i></p>
                                                                        <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                                    </div>
                                                                    <div class="text-sm flex items-center space-x-3 mt-2 ml-5">
                                                                        <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                                        <a href="#"> Replay </a>
                                                                        <span> 3d </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="flex">
                                                                <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                                                    <img src="assets/images/avatars/avatar-1.jpg" alt=""
                                                                         class="absolute h-full rounded-full w-full">
                                                                </div>
                                                                <div>
                                                                    <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                                                        <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet
                                                                            dolore magna aliquam erat volutpat. David !<i
                                                                                    class="uil-grin-tongue-wink-alt"></i></p>
                                                                        <div class="absolute w-3 h-3 top-3 -left-1 bg-gray-100 transform rotate-45 dark:bg-gray-800"></div>
                                                                    </div>
                                                                    <div class="text-xs flex items-center space-x-3 mt-2 ml-5">
                                                                        <a href="#" class="text-red-600"> <i class="uil-heart"></i> Love </a>
                                                                        <a href="#"> Replay </a>
                                                                        <span> 3d </span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <a href="#" class="hover:text-blue-600 hover:underline"> Veiw 8 more Comments </a>

                                                        <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                                            <input placeholder="Add your Comment.."
                                                                   class="bg-transparent max-h-10 shadow-none px-5">
                                                            <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                                <a href="#">
                                                                    <ion-icon name="happy-outline"
                                                                              class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img"
                                                                              aria-label="happy outline"></ion-icon>
                                                                </a>
                                                                <a href="#">
                                                                    <ion-icon name="image-outline"
                                                                              class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img"
                                                                              aria-label="image outline"></ion-icon>
                                                                </a>
                                                                <a href="#">
                                                                    <ion-icon name="link-outline"
                                                                              class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img"
                                                                              aria-label="link outline"></ion-icon>
                                                                </a>
                                                            </div>
                                                        </div>-->

                                                </div>

                                        </div>
                                        <?php } } ?>
                                </div>
                                <!-----video card end----->


                        </div>
                </div>
        </div>

</div>
<?php echo $layout['footer']?>
<?php echo $layout['js']?>