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
                
                <div class="max-w-xl mx-auto">
                    
                    <div class="card sm:p-7 p-4">

                        <div class="flex items-center space-x-3">
                            <ion-icon name="gift" class="text-yellow-500 text-xl bg-yellow-50 p-1 rounded-md"></ion-icon>
                            <div class="text-xl font-semibold"> Today's birthdays </div>
                        </div>

                        <div class="space-y-8 mt-10">
                            <div class="sm:space-y-8 space-y-6">
                
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#">  Alex Dolgove </a> </div>
                                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#"> Dennis Han </a> </div>
                                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#">  Alex Dolgove </a> </div>
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
                                <div class="bg-gray-50 rounded-lg px-5 py-4 font-semibold text-base"> Upcoming birthdays </div>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-up right-4 text-xl top-1/2 transform text-gray-400" id="upcoming" hidden></i>
                                <i class="-translate-y-1/2 absolute icon-feather-chevron-down right-4 text-xl top-1/2 transform text-gray-400" id="upcoming"></i>
                            </div>
                            <div class="mt-5 sm:space-y-8 space-y-6" id="upcoming" hidden>
                
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-6.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#"> Alex Jones </a> </div>
                                            <div class="font-medium text-sm text-gray-400"> 19 years old</div>
                                        </div>
                                        <div class="relative">
                                            <input type="text" name="" id="" class="with-border" placeholder="Write her on Timeline">
                                            <ion-icon name="happy" class="absolute right-3 text-2xl top-1/4"></ion-icon>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex items-center sm:space-x-6 space-x-3">
                                    <img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt="" class="sm:w-16 sm:h-16 w-14 h-14 rounded-full">
                                    <div class="flex-1">
                                        <div class="flex items-center justify-between mb-3">
                                            <div class="text-base font-semibold"> <a href="#"> Dennis Han </a> </div>
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
    
    <!-- For Night mode -->
    <script>
        (function (window, document, undefined) {
            'use strict';
            if (!('localStorage' in window)) return;
            var nightMode = localStorage.getItem('gmtNightMode');
            if (nightMode) {
                document.documentElement.className += ' night-mode';
            }
        })(window, document);
    
        (function (window, document, undefined) {
    
            'use strict';
    
            // Feature test
            if (!('localStorage' in window)) return;
    
            // Get our newly insert toggle
            var nightMode = document.querySelector('#night-mode');
            if (!nightMode) return;
    
            // When clicked, toggle night mode on or off
            nightMode.addEventListener('click', function (event) {
                event.preventDefault();
                document.documentElement.classList.toggle('dark');
                if (document.documentElement.classList.contains('dark')) {
                    localStorage.setItem('gmtNightMode', true);
                    return;
                }
                localStorage.removeItem('gmtNightMode');
            }, false);
    
        })(window, document);
    </script>
  
    <!-- Javascript
    ================================================== -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="<?php echo base_url();?>/assets/js/tippy.all.min.js"></script>
    <script src="<?php echo base_url();?>/assets/js/uikit.js"></script>
    <script src="<?php echo base_url();?>/assets/js/simplebar.js"></script>
    <script src="<?php echo base_url();?>/assets/js/custom.js"></script>
    <script src="<?php echo base_url();?>/assets/js/bootstrap-select.min.js"></script>
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

</body>
</html>