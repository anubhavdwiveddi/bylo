<?php echo $layout['meta'];?>
<body>
<div id="wrapper">
        <?php
$url2 = $video->video_address;
        ?>
        <!-- Header -->
        <?php echo $layout['header'];?>
        <!-- sidebar -->
        <?php echo $layout['sidebar'];?>
        <!-- Main Contents -->
        <div class="main_content">
                <div class="mcontainer">
                        <div class="lg:flex lg:space-x-10">
                                <div class="lg:w-3/4">
                                        <div class="">
                                                <video controls frameborder="0" uk-video="automute: true" allowfullscreen uk-responsive>
                                                        <source src="<?php echo base_url('video_upload');?><?php echo $video->video_address?>">
                                                </video>
                                        </div>

                                        <div class="py-5 space-y-4">

                                                <div class="md:flex items-center justify-between">
                                                        <a href="#" class="flex items-center space-x-3">
                                                                <img src="<?php echo base_url()?>/assets/images/avatars/avatar-2.jpg" alt=""
                                                                     class="w-10 rounded-full">
                                                                <div class="">
                                                                        <div class="text-base font-semibold"> <?php echo $video->first_name?> <?php echo $video->last_name?></div>
                                                                        <div class="text-xs"> Published on <?php echo $newdate = date("D, M Y", strtotime($video->datetime));?></div>
                                                                </div>
                                                        </a>
                                                        <div class="flex items-center space-x-3 md:pt-0 pt-2">
                                                                <div class="like-btn" uk-tooltip="Unlike it">
                                                                        <i class="uil-thumbs-down"></i>
                                                                        <span class="likes">16</span>
                                                                </div>
                                                                <div class="flex h-2 w-36 bg-gray-200 rounded-lg overflow-hidden">
                                                                        <div class="w-2/3 bg-gradient-to-br from-purple-400 to-blue-400 h-4"></div>
                                                                </div>
                                                                <div class="like-btn" uk-tooltip="I like it">
                                                                        <i class="uil-thumbs-up"></i>
                                                                        <span class="likes">21</span>
                                                                </div>
                                                        </div>
                                                </div>
                                                <hr>
                                                <div class="text-lg font-semibold pt-2"> Comments ( 5210 )</div>
                                                <div class="my-5">
                                                        <div class="flex gap-x-4 mb-5 relative">
                                                                <img src="<?php echo base_url()?>/assets/images/avatars/avatar-4.jpg" alt=""
                                                                     class="rounded-full shadow w-12 h-12">
                                                                <div>
                                                                        <h4 class="text-base m-0 font-semibold"> Stella Johnson</h4>
                                                                        <span class="text-gray-700 text-sm"> 10th June 2021 </span>
                                                                        <p class="mt-3">
                                                                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam ut laoreet
                                                                                dolore
                                                                                magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
                                                                                tation
                                                                                ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                                                                        </p>
                                                                </div>
                                                        </div>
                                                </div>

                                        </div>


                                </div>

                                <!-- sidebar -->
                                <div class="lg:w-1/4 w-full">

                                        <h3 class="text-xl font-bold mb-2"> Related Videos </h3>

                                        <div class="py-2 relative">
                                                <a href="video-watch.html"
                                                   class="w-full h-32 overflow-hidden rounded-lg relative shadow-sm flex-shrink-0 block">
                                                        <img src="<?php echo base_url()?>/assets/images/video/img-3.png" alt=""
                                                             class="w-full h-full absolute inset-0 object-cover">
                                                        <img src="<?php echo base_url()?>/assets/images/icon-play.svg"
                                                             class="w-12 h-12 uk-position-center" alt="">
                                                        <span class="absolute bg-black bg-opacity-60 bottom-1 font-semibold px-1.5 py-0.5 right-1 rounded text-white text-xs"> 12:21</span>
                                                </a>
                                                <div class="flex-1 pt-3 relative">
                                                        <a href="video-watch.html" class="line-clamp-2 font-semibold"> Exploring an Abandoned Water
                                                                Park in China </a>
                                                        <div class="flex space-x-2 items-center text-sm pt-1">
                                                                <div> 27 weeks ago</div>
                                                                <div>·</div>
                                                                <div> 156.9K views</div>
                                                        </div>
                                                </div>
                                        </div>


                                </div>

                        </div>


                </div>
        </div>

</div>


<!-- open chat box -->
<?php echo $layout['message'];?>
<?php echo $layout['footer'];?>
<?php echo $layout['js'];?>
</body>
</html>