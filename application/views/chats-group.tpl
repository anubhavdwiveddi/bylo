<?php echo $layout['meta']?>
<body class="is_message">
    <div id="Wrapper" class="is-collapse">
        <!-- Header -->
        <?php echo $layout['header']?>
        <!-- sidebar -->
        <?php echo $layout['sidebar']?>

        <!-- Main Contents -->
        <div class="main_content">

            <span uk-toggle="target: .message-content;" class="lg:hidden fixed left-0 top-36 bg-red-600 z-10 py-1 px-4 rounded-r-3xl text-white"> Users</span>

            <div class="messages-container is_group">
                <div class="messages-container-inner">

                    <div class="messages-inbox">
                        <div class="messages-headline">
                            <div class="input-with-icon" hidden>
                                    <input id="autocomplete-input" type="text" placeholder="Search">
                                <i class="icon-material-outline-search"></i>
                            </div>
                            <h2 class="text-2xl font-semibold">Chats</h2>
                            <span class="absolute icon-feather-edit mr-4 text-xl uk-position-center-right cursor-pointer"></span>
                        </div>
                        <div class="messages-inbox-inner" data-simplebar>
                            <ul>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-online"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Stella Johnson</h5>
                                                <span>4 hours ago</span>
                                            </div>
                                            <p>laoreet dolore magna aliquam erat volutpat sed diam nonummy</p>
                                        </div>
                                    </a>
                                </li>
    
                                <li class="active-message">
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-offline"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Adrian Mohani</h5>
                                                <span>Yesterday</span>
                                            </div>
                                            <p>Sed diam nonummy nibh euismod tincidunt ut laoreet dolore</p>
                                        </div>
                                    </a>
                                </li>
                                
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-offline"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Alia Dolgove</h5>
                                                <span>2 days ago</span>
                                            </div>
                                            <p>Dipiscing elit, sed diam nonummy nibh euismod tincidunt </p>
                                        </div>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-online"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-4.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Jonathan Madano</h5>
                                                <span>2 days ago</span>
                                            </div>
                                            <p>Nisl ut aliquip ex ea commodo consequa!</p>
                                        </div>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-online"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-6.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Stella Johnson</h5>
                                                <span>4 hours ago</span>
                                            </div>
                                            <p>laoreet dolore magna aliquam erat volutpat sed diam nonummy</p>
                                        </div>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-offline"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-5.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Adrian Mohani</h5>
                                                <span>Yesterday</span>
                                            </div>
                                            <p>Hi Tom! Hate to break it to you but I'm actually on vacation</p>
                                        </div>
                                    </a>
                                </li>
                                
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-offline"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Alia Dolgove</h5>
                                                <span>2 days ago</span>
                                            </div>
                                            <p>Dipiscing elit, sed diam nonummy nibh euismod tincidunt </p>
                                        </div>
                                    </a>
                                </li>
    
                                <li>
                                    <a href="#">
                                        <div class="message-avatar"><i class="status-icon status-online"></i><img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""></div>
    
                                        <div class="message-by">
                                            <div class="message-by-headline">
                                                <h5>Jonathan Madano</h5>
                                                <span>2 days ago</span>
                                            </div>
                                            <p>Nisl ut aliquip ex ea commodo consequa</p>
                                        </div>
                                    </a>
                                </li>
    
                            </ul>
                        </div>
                    </div>

                    <div class="message-content">

                        <div class="messages-headline">
                            <h4>Adrian Mohani</h4>
                            <a href="#" class="message-action"><i class="icon-feather-trash-2"></i> <span class="md:inline hidden"> Delete Conversation</span></a>
                        </div>
                        
                        <div class="message-content-scrolbar" data-simplebar>
                        
                            <!-- Message Content Inner -->
                            <div class="message-content-inner">
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong>Stella Johnson</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>Consectetuer adipiscing elit, sed diam nonummy nibh euismod laoreet</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong> Johnson</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>oreet.  dolore magna imperdiet quod mazim placerat facer possim. 👍</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong>Stella</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>Albuom commodo consequat 😉</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong>Margaret</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>Option congue nihil imperdiet mazim placerat facer possim</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong>Dolgove</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>Nam liber tempor cum soluta nobis eleifend  doming id quod mazim placerat 😎</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-3.jpg" alt=""></div>
                                        <div class="message-text">
                                            <div class="message-metadata">
                                                <strong>Madano</strong> <time class="activity">9 months, 1 week ago</time>
                                            </div>
                                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                        
                                <div class="message-bubble">
                                    <div class="message-bubble-inner">
                                        <div class="message-avatar"><img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg" alt=""></div>
                                        <div class="message-text">
                                            <!-- Typing Indicator -->
                                            <div class="typing-indicator">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <!-- Message Content Inner / End -->
                        
                            <!-- Reply Area -->
                            <div class="message-reply">
                                <textarea cols="1" rows="1" placeholder="Your Message"></textarea>
                                <button class="button ripple-effect">Send</button>
                            </div>
                        
                        
                        </div>

                    </div>

                </div>
            </div>
            
        </div>
        
    </div>



    <!-- open chat box -->
    <!-- <?php echo $layout['message']?>-->


    <?php echo $layout['js']?>
</body>
</html>