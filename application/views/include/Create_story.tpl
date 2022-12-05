<!-- Create-story section -->
<?php $data = login_user_data();
?>
<div class="ct-story">
    <form method="post" action="StoryCntrl/insert_story" class="story-prev" name="story_content" id="reg_form"
          accept-charset="UTF-8" class="mainInformationContrainer" file="1">
        <div class="story-prev">
            <div class="story-sidebar uk-animation-slide-left-medium">
                <div class="md:flex justify-between items-center py-2 hidden">
                    <h3 class="text-2xl font-semibold">Add Story </h3>
                    <a href="#" class="text-blue-600"> </a>
                </div>
                <div class="story-sidebar-scrollbar" data-simplebar>
                    <h6 class="font-medium">Setting </h6>
                    <a class="flex space-x-4 items-center hover:bg-gray-100 md:my-2 py-2 rounded-lg hover:text-gray-700"
                    <a class="flex space-x-4 items-center hover:bg-gray-100 md:my-2 py-2 rounded-lg hover:text-gray-700"
                       href="#story_post">
                        <?php if(!empty($this->session->userdata('profile_image'))){ ?>
                        <img src="<?php echo base_url('upload')?>/<?php echo $this->session->userdata('profile_image');?>"
                             class="story-media-img" data-alt="Image">
                        <?php } else { ?>
                        <img src="<?php echo base_url();?>/assets/images/avatars/profile.jpg"
                             class="story-media-img" data-alt="Image">
                        <?php } ?>

                        <div class="flex-1">
                            <div class="text-lg font-semibold">
                                <?= $this->session->userdata('first_name');?> <?= $this->
                                session->userdata('last_name');?>
                            </div>
                            <div class="text-sm -mt-0.5"></div>
                        </div>
                    </a>
                    <h3 class="text-lg font-medium lg:mt-3 mt-1"> Your Story </h3>
                    <div class="story-post" style="display:none">
                        <!----- text area for text content ------>
                        <div class="show_text">

                            <div class="line h-32">
                                <textarea class="line__input h-32" name="post_content" placeholder="Typing Start"
                                          id="story" onkeyup="this.setAttribute('value', this.value);"
                                          autocomplete="off"></textarea>
                            </div>

                            <button type="button" class="button gray ">
                                <a href="#modal-discard" uk-toggle> Discard </a>
                            </button>
                            <button type="button" onclick="MyFunction('insert_content')" class="button ">
                                Upload Content
                            </button>

                        </div>

                        <!------ discard  model popup ----->
                        <div id="modal-discard" uk-modal>
                            <div class="uk-modal-dialog">
                                <button class="uk-modal-close-default m-3" type="button" uk-close></button>
                                <div class="uk-modal-header">
                                    <h2 class="uk-modal-title">Discard story?</h2>
                                </div>
                                <div class="uk-modal-body">
                                    <p>Are you sure that you want to discard this story? Your story won't be saved.</p>
                                </div>
                                <div class="uk-modal-footer text-right">
                                    <button class="button gray uk-modal-close" type="button">Continue Editing</button>
                                    <button class="button story-btn-close" type="button">Discard</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="story-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="content-story">


                            <button id="upload_image" class="add-story-img hide_content hide_text" type="button"
                                    onchange="Mystory('Image_story')">
                                <div>

                                    <label for="imgInp">
                                        <div class="oneInfo">
                              <span class="spanForFileInput">
                                 <div>
                                    <span class="icon-material-outline-insert-photo">
                                    </span>
                                    <input type="button" class="selectImage" value="Create a photo story"/>
                                    <input type="file" name="image" value="Create a photo story" id="imgInp"/>
                                 </div>
                              </span>
                                        </div>
                                    </label>

                                    <div class="oneInfo">
                                    </div>

                            </button>

                            <!---- story images preview  --->
                            <div class="add-story-img  show_content upload_img" style="display:none">
                                <div class="oneInfo thumbnail">

                                    <div class="oneInfo thumbnail">
                                        <img src="#" id="imageID"/>
                                        <!--<div class="text ">
                                            <p class="p-2 live-txt" id="live-preview"></p>
                                        </div>-->
                                    </div>

                                </div>

                            </div>

                            <!---- text story --->
                            <button type="button" onclick="Mystory('text_story')"
                                    class="add-story-text hide_content feed_content">
                                <div class="hide_text">
				 <span class="ad-text"> Aa
                  </span>
                                    <p>Create a text story </p>
                                </div>

                                <p class="p-2 live-txt" id="live-preview-text"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- story colose button-->
        <span class="story-btn-close" uk-toggle="target: body ; cls: story-active"
              uk-tooltip="title:Close story ; pos: left">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
           xmlns="http://www.w3.org/2000/svg">
         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
   </span>
</div>
</form>
</div>


<!-- View Friends story Section -->
<div class="post-prev">
    <div class="story-sidebar uk-animation-slide-left-medium">
        <div class="md:flex justify-between items-center py-2 hidden">
            <h3 class="text-2xl font-semibold"> All Story </h3>
            <a href="#" class="text-blue-600"> Setting</a>
        </div>
        <div class="story-sidebar-scrollbar" data-simplebar>
            <h3 class="text-lg font-medium"> Your Story </h3>
            <a class="flex space-x-4 items-center hover:bg-gray-100 md:my-2 py-2 rounded-lg hover:text-gray-700"
               href="#story_post">
                <img src="<?php echo base_url();?>/assets/images/avatars/profile.jpg"
                     class="story-media-img" data-alt="Image">
                <div class="flex-1">
                    <div class="text-lg font-semibold"> Deepak Gour</div>
                    <div class="text-sm -mt-0.5"></div>
                </div>
            </a>
            <h3 class="text-lg font-medium lg:mt-3 mt-1"> Friends Story </h3>
            <div class="story-users-list"
                 uk-switcher="connect: #story_slider ; toggle: > * ; animation: uk-animation-slide-right-medium, uk-animation-slide-left-medium ">
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-1.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Dennis Han</div>
                        <p><span class="story-count"> 2 new </span> <span class="story-time"> 4Mn ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-2.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p><span class="story-count"> 1 new </span> <span class="story-time"> 1hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-3.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username">Alex Dolgove</div>
                        <p><span class="story-count"> 3 new </span> <span class="story-time"> 2hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-4.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Stella Johnson</div>
                        <p><span class="story-count"> 2 new </span> <span class="story-time"> 3hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p><span class="story-count"> 1 new </span> <span class="story-time"> 4hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Dennis Han</div>
                        <p><span class="story-count"> 2 new </span> <span class="story-time"> 8Hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-6.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p><span class="story-count"> 1 new </span> <span class="story-time"> 12hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-7.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username">Alex Dolgove</div>
                        <p><span class="story-count"> 3 new </span> <span class="story-time"> 22hr ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-8.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Stella Johnson</div>
                        <p><span class="story-count"> 2 new </span> <span class="story-time"> 3Dy ago</span></p>
                    </div>
                </a>
                <a href="#">
                    <div class="story-media">
                        <img src="assets/images/avatars/avatar-5.jpg" alt="">
                    </div>
                    <div class="story-text">
                        <div class="story-username"> Adrian Mohani</div>
                        <p><span class="story-count"> 1 new </span> <span class="story-time"> 4Dy ago</span></p>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="story-content">
        <ul class="uk-switcher uk-animation-scale-up" id="story_slider">
            <li class="relative">
                <span uk-switcher-item="previous" class="slider-icon is-left"> </span>
                <span uk-switcher-item="next" class="slider-icon is-right"> </span>
                <div>
                        <img src="assets/images/avatars/avatar-lg-2.jpg" class="story-slider-image">
                </div>
            </li>
        </ul>
    </div>
    <!-- story colose button-->
    <span class="story-btn-close" uk-toggle="target: body ; cls: post-active"
          uk-tooltip="title:Close story ; pos: left">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
      </svg>
   </span>
</div>
