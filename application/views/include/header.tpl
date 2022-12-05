<style>
    .p-5 {
        padding: 1.25rem !important;
    }
</style>
<body class="reload_div"></body>
<header>
    <?php $data = login_user_data(); ?>
    <div class="header_wrap">
        <div class="header_inner mcontainer">
            <div class="left_side">
                 <span class="slide_menu" uk-toggle="target: #wrapper ; cls: is-collapse is-active">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path
                                d="M3 4h18v2H3V4zm0 7h12v2H3v-2zm0 7h18v2H3v-2z"
                                fill="currentColor"></path></svg>
                </span> 
                <div id="logo">
                    <a href="<?php echo base_url()?>feed">
                        <img src="<?php echo base_url();?>/assets/images/bylo-logo.jpg"
                              alt="">
                        <img src="<?php echo base_url();?>/assets/images/bylo-logo.jpg" class="logo_mobile" alt="">
                    </a>
                </div>
            </div>

            <!-- search icon for mobile -->
            <div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox"></div>
            <div class="header_search"><i class="uil-search-alt"></i>
                <input value="" type="text" class="form-control" placeholder="Search Byloapp"
                       onkeyup="search_connection('value', this.value)" id="search_connection" autocomplete="off">
                <div uk-drop="mode: click" class="header_search_dropdown" style="height: 237px; left: 0px; top: 44px; overflow-x: hidden;">
                    <div id="connection">

                    </div>
                    <ul>
                        <li>
                            <div class="grid grid-cols-2 gap-3">
                                <div>
                                    <div class="flex" id="flex_search">
                                        <span class="list-avatar icon-material-outline-search"></span>
                                        <div class="list-name"> Search For <span id="search_re"></span></div>
                                    </div>
                                </div>
                        </li>
                    </ul>

                </div>
            </div>
            
            <?php
                if(empty($this->session->userdata('id'))){
            ?>
            <div class="right_side">
                <div class="header_login" >
                    <div class="p-1">
						<a href="<?= base_url('login')?>"><button type="button" class="button"> <span class="log_text_hide"> Login </span> <ion-icon class="icon-feather-user md hydrated" role="img"></ion-icon> </button></a>
					</div>
                </div>
            </div>
        </div>
        <?php } else { ?>
        <div class="right_side">

            <div class="header_widgets">
                <a href="<?= base_url('u/').$data->user_code?>">
                    <div class="user-dp">
                        <?php if(!empty($data->profile_image)) { ?>
                        <img src="<?= base_url('upload/').'/'.$data->profile_image?>"
                             alt="">
                        <?php } else { ?>
                        <img src="<?= base_url().'/'.$data->avatar_image?>" alt="">
                        <?php }?>
                        <div class="name">
                            <h4><?= $data->first_name ?></h4>
                        </div>
                    </div>
                </a>


                <a href="#" class="is_icon" uk-tooltip="title: Notifications">
                    <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
                    </svg>
                    <span>3</span>
                </a>
                <div uk-drop="mode: click" class="header_dropdown">
                    <div class="dropdown_scrollbar" data-simplebar>
                        <div class="drop_headline">
                            <h4>Notifications </h4>
                            <div class="btn_action">
                                <a href="#" data-tippy-placement="left" title="Notifications">
                                    <ion-icon name="settings-outline"></ion-icon>
                                </a>
                                <a href="#" data-tippy-placement="left" title="Mark as read all">
                                    <ion-icon name="checkbox-outline"></ion-icon>
                                </a>
                            </div>
                        </div>
                        <ul>
                            <li>
                                <a href="#">
                                    <div class="drop_avatar">
                                        <img src="<?php echo base_url();?>/assets/images/avatars/avatar-1.jpg"
                                             alt="">
                                    </div>
                                    <span class="drop_icon bg-gradient-primary">
                                                     <i class="icon-feather-thumbs-up"></i>
                                                 </span>
                                    <div class="drop_text">
                                        <p>
                                            <strong>Adrian Mohani</strong> Like Your Comment On Video
                                            <span class="text-link">Learn Prototype Faster </span>
                                        </p>
                                        <time> 2 hours ago</time>
                                    </div>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>

                <!-- Message -->
                <a href="#" class="is_icon" uk-tooltip="title: Message">
                    <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                              clip-rule="evenodd"></path>
                    </svg>
                    <span>4</span>
                </a>
                <div uk-drop="mode: click" class="header_dropdown is_message">
                    <div class="dropdown_scrollbar" data-simplebar>
                        <div class="drop_headline">
                            <h4>Messages </h4>
                            <div class="btn_action">
                                <a href="#" data-tippy-placement="left" title="Notifications">
                                    <ion-icon name="settings-outline"
                                              uk-tooltip="title: Message settings ; pos: left"></ion-icon>
                                </a>
                                <a href="#" data-tippy-placement="left" title="Mark as read all">
                                    <ion-icon name="checkbox-outline"></ion-icon>
                                </a>
                            </div>
                        </div>
                        <input type="text" class="uk-input" placeholder="Search in Messages">
                        <ul>
                            <li class="un-read">
                                <a href="#">
                                    <div class="drop_avatar"><img
                                                src="<?php echo base_url();?>/assets/images/avatars/avatar-7.jpg"
                                                alt="">
                                    </div>
                                    <div class="drop_text">
                                        <strong> Stella Johnson </strong>
                                        <time>12:43 PM</time>
                                        <p> Alex will explain you how ... </p>
                                    </div>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <a href="#" class="see-all"> See all in Messages</a>
                </div>


                <a href="#" class="">
                    <div class="user_avatar">
                        <span class="icon-material-outline-arrow-drop-down is_icon"></span>
                    </div>
                </a>
                <div uk-drop="mode: hover;offset:5" class="header_dropdown profile_dropdown">
                    <!---<hr>
                    <a href="pages-upgrade.html" class="is-link">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.395 2.553a1 1 0 00-1.45-.385c-.345.23-.614.558-.822.88-.214.33-.403.713-.57 1.116-.334.804-.614 1.768-.84 2.734a31.365 31.365 0 00-.613 3.58 2.64 2.64 0 01-.945-1.067c-.328-.68-.398-1.534-.398-2.654A1 1 0 005.05 6.05 6.981 6.981 0 003 11a7 7 0 1011.95-4.95c-.592-.591-.98-.985-1.348-1.467-.363-.476-.724-1.063-1.207-2.03zM12.12 15.12A3 3 0 017 13s.879.5 2.5.5c0-1 .5-4 1.25-4.5.5 1 .786 1.293 1.371 1.879A2.99 2.99 0 0113 13a2.99 2.99 0 01-.879 2.121z" clip-rule="evenodd"></path></svg>
                        Upgrade To Premium  </span>
                    </a>
                    <hr>--->
                    <a href="<?php echo base_url()?>setting">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z"
                                  clip-rule="evenodd"></path>
                        </svg>
                        Setting
                    </a>
                    <a href="<?php echo base_url()?>my_pages">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd"
                                  d="M3 6a3 3 0 013-3h10a1 1 0 01.8 1.6L14.25 8l2.55 3.4A1 1 0 0116 13H6a1 1 0 00-1 1v3a1 1 0 11-2 0V6z"
                                  clip-rule="evenodd"/>
                        </svg>
                        Manage Pages
                    </a>
                    <!--<a href="<?php echo base_url()?>setting">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z"></path><path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd"></path></svg>
                        My Billing
                    </a>
                    <a href="#" id="night-mode" class="btn-night-mode">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
                        </svg>
                        Night mode
                        <span class="btn-night-mode-switch">
                                    <span class="uk-switch-button"></span>
                                </span>
                    </a>--->
                    <a href="#" onclick="logout('<?= $this->session->userdata('id')?>')">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                        </svg>
                        Log Out
                    </a>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
    </div>
</header>

