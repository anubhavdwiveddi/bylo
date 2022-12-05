<?php echo $layout['meta'];?>
<body>
    <div id="wrapper">
        <!-- Header -->
        <?php echo $layout['header'];?>
        <!-- sidebar -->
        <?php echo $layout['sidebar'];?>

        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">

                <!--  breadcrumb -->
                <div class="breadcrumb-area py-0">
                    <div class="breadcrumb">
                        <ul class="m-0">
                            <li>
                                <a href="index.html">Groups</a>
                            </li>
                            <li class="active">
                                <a href="#">Create New Group </a>
                            </li>
                        </ul>
                    </div>
                </div>


                <!-- create page-->
                <div class="max-w-2xl m-auto shadow-md rounded-md bg-white lg:mt-20">  
 
                    <!-- form header -->
                    <div class="text-center border-b border-gray-100 py-6">
                        <h3 class="font-bold text-xl"> Create New Group </h3>
                    </div>

                    <!-- form body -->
                    <div class="p-10 space-y-7 create-group" >

                        <div class="line">
                            <input class="line__input" id="" name="" type="text" onkeyup="this.setAttribute('value', this.value);" value="" autocomplete="off">
                            <span for="username" class="line__placeholder"> Group Name </span>
                        </div>

                        <div>
                            <label for="" class="font-semibold text-base"> Group Category </label>
                            <select id="" name=""  class="shadow-none  with-border">
                                <option value="1">Technology</option>
                                <option value="2">Cars and Vehicles</option>
                                <option value="3">Comedy</option>
                                <option value="4">Economics and Trade</option>
                                <option value="5">Education</option>
                                <option value="6">Entertainment</option>
                                <option value="7">Movies & Animation</option>
                                <option value="8">Gaming</option>
                                <option value="9">History and Facts</option>
                                <option value="10">Live Style</option> 
                                <option value="0">Other</option>
                           </select>
                        </div>
						
						<div>
                            <label for="" class="font-semibold text-base"> Invite Friend  </label>
                            <select id='invite_friend' class="form-control select2 shadow-none  with-border" multiple>
                                <option value="1">Aayush,</option>
                                <option value="2">Kishan,</option>
                                <option value="3">Anil</option>
                            </select>
                        </div>

                        <div class="line h-32"> 
                            <textarea class="line__input h-32"  id="" name="" type="text" onkeyup="this.setAttribute('value', this.value);" value="" autocomplete="off"></textarea>
                            <span for="username" class="line__placeholder"> Group description </span> 
                        </div>

                        <div class="px-2 space-y-2">
                            <label for="" class="font-semibold text-base"> Choose Privacy </label> 
                            <div> Anyone can see who's in the group and what they post. </div>
                            <select id="" name=""  class="shadow-none  with-border">
                                <option data-icon="uil-bullseye"> Private </option>
                                <option data-icon="uil-chat-bubble-user">My Following</option>
                                <option data-icon="uil-layer-group-slash">Unlisted</option>
                                <option data-icon="uil-globe" selected>Puplic</option>
                            </select>
                        </div>
                        
                    </div>
                    
                    <!-- form footer -->
                    <div class="flex justify-center border-gray-100 py-8">
                        <button type="button" class="button lg:w-1/3">
                            Create Now
                        </button>
                    </div>
                    
                </div>

        
            </div>
        </div>
        
    </div>

    <!-- Create new album -->

    <div id="offcanvas-create" uk-offcanvas="flip: true; overlay: true">
        <div class="uk-offcanvas-bar lg:w-4/12 w-full dark:bg-gray-700 dark:text-gray-300 p-0 bg-white flex flex-col justify-center">
    
            <button class="uk-offcanvas-close absolute" type="button" uk-close></button>

            <!-- notivication header -->
            <div class="-mb-1 border-b font-semibold px-5 py-5 text-lg">
                <h4> Create album </h4>
            </div>

            <div class="p-6 space-y-3 flex-1">
                <div>
                    <label> Album Name  </label>
                    <input type="text" class="with-border" placeholder="">
                </div>
                <div>
                    <label> Visibilty   </label>
                    <select id="" name=""  class="shadow-none selectpicker with-border">
                        <option data-icon="uil-bullseye"> Private </option>
                        <option data-icon="uil-chat-bubble-user">My Following</option>
                        <option data-icon="uil-layer-group-slash">Unlisted</option>
                        <option data-icon="uil-globe" selected>Puplic</option>
                    </select>
                </div>
                <div uk-form-custom class="w-full py-3">
                        <div class="bg-gray-100 border-2 border-dashed flex flex-col h-32 items-center justify-center relative w-full rounded-lg dark:bg-gray-800 dark:border-gray-600">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-12">
                                <path d="M5.5 13a3.5 3.5 0 01-.369-6.98 4 4 0 117.753-1.977A4.5 4.5 0 1113.5 13H11V9.413l1.293 1.293a1 1 0 001.414-1.414l-3-3a1 1 0 00-1.414 0l-3 3a1 1 0 001.414 1.414L9 9.414V13H5.5z" />
                                <path d="M9 13h2v5a1 1 0 11-2 0v-5z" />
                            </svg>
                        </div>
                    <input type="file">
                </div>
               
            </div>
            <div class="p-5">
                <button type="button"  class="button w-full">
                    Create Now
                </button>
            </div>

            
        </div>
    </div>


    <!-- open chat box -->
    <div uk-toggle="target: #offcanvas-chat" class="start-chat">
        <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
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
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                 <ion-icon name="checkbox-outline" class="pr-2 text-xl"></ion-icon> Mark all as read
                              </a> 
                          </li>
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="settings-outline" class="pr-2 text-xl"></ion-icon>  Chat setting 
                              </a> 
                          </li>
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="notifications-off-outline" class="pr-2 text-lg"></ion-icon>   Disable notifications
                              </a> 
                          </li> 
                          <li> 
                              <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                <ion-icon name="star-outline"  class="pr-2 text-xl"></ion-icon>  Create a group chat 
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
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-7.jpg" alt="">
                        </div>
                        <div class="contact-username"> Alex Dolgove</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-8.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt="">
                        </div>
                        <div class="contact-username">Stella Johnson</div>
                    </a>
                    
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt="">
                        </div>
                        <div class="contact-username">Adrian Mohani </div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-6.jpg" alt="">
                        </div>
                        <div class="contact-username"> Jonathan Madano</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-friend.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                   

                </div>
               <div class="p-1">
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-7.jpg" alt="">
                        </div>
                        <div class="contact-username"> Alex Dolgove</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-8.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt="">
                        </div>
                        <div class="contact-username">Stella Johnson</div>
                    </a>
                    
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt="">
                        </div>
                        <div class="contact-username">Adrian Mohani </div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-6.jpg" alt="">
                        </div>
                        <div class="contact-username"> Jonathan Madano</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt="">
                            <span class="user_status"></span>
                        </div>
                        <div class="contact-username"> Erica Jones</div>
                    </a>
                    <a href="chats-group.html">
                        <div class="contact-avatar">
                            <img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt="">
                            <span class="user_status status_online"></span>
                        </div>
                        <div class="contact-username"> Dennis Han</div>
                    </a>
                   

                </div>

            </div>
        </div>
    </div>
    <?php echo $layout['js'];?>
</body>
</html>