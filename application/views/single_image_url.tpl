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
        <div class="container_main fixed left-0 right-0 top-0 mt-12 img-container  bottom-0">

            <div class="lg:space-x-12">
                <div class="row">
                    <div class="col-lg-8 pr-0 pl-0">
                        <div class="profile_img">
                            <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow>
                                <ul class="uk-slideshow-items">
                                    <li>
                                        <img src="<?php echo base_url('upload/'). $photos_data->image_address?>"
                                             class="max-h-96 w-full object-contain" alt="" uk-cover>
                                    </li>
                                </ul>
                                <!--<a class="uk-position-center-left uk-position-small uk-hidden-hover text-white p-4"
                                   href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                                <a class="uk-position-center-right uk-position-small uk-hidden-hover text-white p-4"
                                   href="#" uk-slidenav-next uk-slideshow-item="next"></a>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 pl-0">
                        <div class="side-text-profile">
                            <div class="lg:mx-0 uk-animation-slide-bottom-small right-img-comment overflow-visible">
                                <!-- post header-->
                                <div class="flex justify-between items-center lg:p-4 p-2.5">
                                    <div class="flex flex-1 items-center space-x-4">
                                        <?php if(!empty($photos_data->business_Logo)) { ?>
                                        <img class="bg-gray-200 border border-white rounded-full w-10 h-10"
                                             src="<?php echo base_url('upload/').$photos_data->business_Logo?>"
                                             alt="<?= $photos_data->image_alt_name;?>">
                                        <?php } else { ?>
                                        <img class="bg-gray-200 border border-white rounded-full w-10 h-10"
                                             src="<?php echo base_url('upload/').$photos_data->profile_image?>"
                                             alt="<?= $photos_data->image_alt_name;?>">
                                        <?php } ?>

                                        <span class="flex-1 icon-material-outline">
                                            <a href="<?php echo base_url()?><?php if($photos_data->page_name != ''){ echo "page/$photos_data->city_name/$photos_data->user_name"; } else {echo "$photos_data->user_code"; }?>" class="text-black dark:text-gray-100">
                                                <?php if(!empty($photos_data->page_name)){
                                                echo "$photos_data->page_name"; } else {
                                                echo "$photos_data->first_name $photos_data->last_name";
                                                }
                                                ?> </a>
                                            <span class="icon-material-outline flex items-center"><?php echo $newdate = date("d F Y", strtotime($photos_data->datetime));?></span>
                                        </span>
                                    </div>
                                    <div>
                                        <a href="#" aria-expanded="false"> <i
                                                    class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                                        </a>
                                        <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700 uk-drop"
                                             uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">

                                            <ul style="margin-bottom: 0px;">
                                                <li>
                                                    <a href="#">
                                                        <i class="uil-favorite mr-1"></i> Save
                                                    </a>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>

                                <div class="p-3 space-y-3">

                                    <div class="flex like-cmt-share space-x-4">
                                        <span onclick="photolike('<?= $photos_data->id;?>')" class="<?php if($photos_data->liked_user == $this->session->userdata('id')) { echo "icon-material-outline-thumb-up text-blue-500";} else {echo "icon-material-outline-thumb-up";}?>"> Like </span>
                                        <span class="icon-material-outline-thumb-up"> Comment </span>
                                        <span onclick="Mysaved('<?php echo $photos_data->id?>', 'photo')" class="icon-material-outline-thumb-up flex items-center flex-1 justify-end"> Share </span>
                                    </div>
                                    <div class="flex items-center space-x-3 pt-2">
                                        <?php
                                            if(!empty($like_total)){
                                        ?>
                                        <div class="flex items-center">
                                            <?php
                                            if(!empty($like_user)) {
                                                foreach($like_user as $like) {
                                        ?>
                                            <img src="<?php echo base_url('upload'). $like->profile_image?>" alt=""
                                                 class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                            <?php } }?>
                                        </div>
                                        <?php if(!empty($like->first_name)) {
                                        echo "<span class='icon-material-outline'>
                                            Liked <strong> $like->first_name </strong> and <strong> $like_total->no_of_user Others </strong>
                                        </span>";
                                        } } ?>
                                    </div>

                                    <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                       <div id="photos_comment">
                                       </div>
                                    </div>
                                </div>

                                <div class="yes cm-img-upload emoji-relative  sticky right-0 bottom-0">
                                    <form id="comment" onSubmit="return false;" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" class="bg-gradient-to-b from-gray-100 to-gray-100" value="<?php echo $photos_data->id?>" id="photos_id">
                                    <div class="bg-gray-100 rounded-full rela  dark:bg-gray-800 border-t">
                                            <input name="Comment" onkeypress="public_photo_comment('<?php echo $photos_data->id?>')"
                                                   placeholder="Add your Comment.."
                                                   class="bg-transparent max-h-10 shadow-none px-5 ">

                                            <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                                <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full md hydrated" role="img" aria-label="happy outline"></ion-icon>
                                                <span class="btn_upload">
												    <input type="file" name="comment_image" id="imag3" title="" class="input-img"/>
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
    </div>

</div>

<?php echo $layout['footer']?>
<?php echo $layout['js']?>
