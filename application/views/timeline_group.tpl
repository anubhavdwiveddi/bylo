<?php echo $layout['meta'];?>
<body>
   <div id="wrapper">
      <!-- Header -->
      <?php echo $layout['header'];?>
      <!-- sidebar -->
      <?php echo $layout['sidebar'];?>
      <!-- Main Contents -->
      <!-- Main Contents -->
      <div class="main_content">
         <div class="mcontainer">
            <div class="profile is_group">
               <div class="profiles_banner">
                  <div class="uk-margin add-file-page">
                     <div class="business-cover profiles_banner">
                        <div class="avatar-upload">
                           <?php echo $layout['banner_image']?>
                           <div class="avatar-preview">
                              <?php if(!empty($user->banner_image)) { ?>
                              <img class="profile-user-img img-responsive" id="imagePreview"
                                 src="<?php echo base_url('upload/')?><?= $user->banner_image;?>"
                                 alt="User profile picture">
                              <?php } else { ?>
                              <img class="profile-user-img img-responsive" id="imagePreview"
                                 src="<?php echo base_url()?>assets/images/group/group-cover-1.jpg"
                                 alt="User profile picture">
                              <?php } ?>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="profiles_content">
                  <div class="profile_info">
                     <h1> Friends For Ever </h1>
                     <p> Public group ·  12k members</p>
                  </div>
                  <div class="flex items-center space-x-4">
                    
					 <a href="#" class="flex items-center justify-center  button gray h-9 px-2 rounded-md gray-500  space-x-1.5">
					     <ion-icon name="people-outline"></ion-icon>
                        <span> Join </span>
                     </a>
                       <a href="#leave_group"  class="flex items-center justify-center  button gray h-9 px-2 rounded-md gray-500  space-x-1.5" uk-toggle>
					   <ion-icon name="exit-outline"></ion-icon>
                        <span> Leave Group </span>
                     </a>
                      <div class="share-btn">
					     <button class="button  button gray h-9 px-2 rounded-md gray-500  space-x-1.5 clipboard " data-tippy-placement="top" title="Copy Url"> <ion-icon name="share-social-outline"></ion-icon>  Share </button>   <p id="something" class="copy_url"> </p>
					  </div>
					 
                    
                     <a href="#invite-friend-model" class="flex items-center justify-center h-9 px-2 rounded-md bg-blue-600 text-white  space-x-1.5" uk-toggle>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5">
                           <path fill-rule="evenodd"
                              d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z"
                              clip-rule="evenodd"></path>
                        </svg>
                        <span> Invite Friends </span>
                     </a>
					 
					 
					<!---------- invite friend model ---------->
						 <div id="invite-friend-model"  uk-modal>
							 <div class="uk-modal-dialog ">
								 <button class="uk-modal-close-default m-3" type="button" uk-close></button>
								 <div class="uk-modal-header">
									 <h2 class="uk-modal-title">Invite friends to this group</h2>
								 </div>
								 <div class="uk-modal-body group-invite-friend invt-model">
								     <!-- search icon for mobile -->
										<div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox"> </div>
										<div class="header_search"><i class="uil-search-alt"></i> 
											<input value="" type="text" class="form-control" placeholder="Search for Friends , Videos and more.." autocomplete="off">
											<div uk-drop="mode: click" class="header_search_dropdown">
												   
												<h4 class="search_title"> Recently </h4>
												<ul>
													<li> 
														<a href="#">  
															<img src="assets/images/avatars/avatar-1.jpg" alt="" class="list-avatar">
															<div class="list-name">  Erica Jones </div>
														</a> 
													</li> 
													<li> 
														<a href="#">  
															<img src="assets/images/avatars/avatar-2.jpg" alt="" class="list-avatar">
															<div class="list-name">  Coffee  Addicts </div>
														</a> 
													</li>
													<li> 
														<a href="#">  
															<img src="assets/images/avatars/avatar-3.jpg" alt="" class="list-avatar">
															<div class="list-name"> Mountain Riders </div>
														</a> 
													</li>
													<li> 
														<a href="#">  
															<img src="assets/images/avatars/avatar-4.jpg" alt="" class="list-avatar">
															<div class="list-name"> Property Rent And Sale  </div>
														</a> 
													</li>
													<li> 
														<a href="#">  
															<img src="assets/images/avatars/avatar-5.jpg" alt="" class="list-avatar">
															<div class="list-name">  Erica Jones </div>
														</a> 
													</li>
												</ul>
						
											</div>
										</div>
										<div class="invite-friend-list">
										   <div class="flex items-center space-x-4 py-2 hover:bg-gray-100 rounded-md  px-2">
												<div class="w-10 h-10 flex-shrink-0 rounded-circle relative"> 
													<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
												</div>
												<div class="flex-1">
													<a href="timeline-group.html"  class="text-md font-semibold capitalize"> G.V. Jeevankumar </a>
												</div>
												<div class="checkbox">
													<input type="checkbox" id="chekcbox1" >
													<label for="chekcbox1"><span class="checkbox-icon"></span>  </label>
												</div>
											</div>
											
											<div class="flex items-center space-x-4 py-2 hover:bg-gray-100 rounded-md  px-2">
												<div class="w-10 h-10 flex-shrink-0 rounded-circle relative"> 
													<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
												</div>
												<div class="flex-1">
													<a href="timeline-group.html"  class="text-md font-semibold capitalize"> G.V. Jeevankumar </a>
												</div>
												<div class="checkbox">
													<input type="checkbox" id="chekcbox2" >
													<label for="chekcbox2"><span class="checkbox-icon"></span>  </label>
												</div>
											</div>
											<div class="flex items-center space-x-4 py-2 hover:bg-gray-100 rounded-md  px-2">
												<div class="w-10 h-10 flex-shrink-0 rounded-circle relative"> 
													<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
												</div>
												<div class="flex-1">
													<a href="timeline-group.html"  class="text-md font-semibold capitalize"> G.V. Jeevankumar </a>
												</div>
												<div class="checkbox">
													<input type="checkbox" id="chekcbox3" >
													<label for="chekcbox3"><span class="checkbox-icon"></span>  </label>
												</div>
											</div>

										</div>
								 </div>
								 <div class="uk-modal-footer text-right">
									 <button class="button gray uk-modal-close" type="button">Cancel</button>
									 <button class="button" type="button">Send invitations</button>
								 </div>
							 </div>
						 </div> 
								 
					 
                  </div>
               </div>
               <nav class="responsive-nav border-b -mt-2 lg:pl-3.5 group_tabs">
                  <ul uk-switcher="connect: #group-tab; animation: uk-animation-fade">
                     <li class="uk-active"><a class="active" href="#0"> Home </a></li>
                     <li><a href="#0">About</a></li>
                     <li><a href="#0">Members </a></li>
                     <li><a href="#0">Discussion </a></li>
					 <li><a href="#0">Photo </a></li>
                     <li><a href="#0">Videos </a></li>
                  </ul>
               </nav>
               <!-- search icon -->
               <a href="#" class="flex items-center justify-center h-10 w-10 rounded-md bg-gray-100 z-10 absolute bottom-2 right-3" uk-toggle="target: #profile-search;animation: uk-animation-slide-top-small">
                  <ion-icon name="search" class="text-xl"></ion-icon>
               </a>
               <div class="absolute bg-white border bottom-2 right-3 rounded-md z-20" id="profile-search" hidden>
                  <input type="text" placeholder="Search.." class="max-h-11">
                  <ion-icon name="close-outline" class="text-2xl hover:bg-gray-100 p-1 rounded-full cursor-pointer absolute right-2 bottom-1.5" uk-toggle="target: #profile-search;animation: uk-animation-slide-top-small"></ion-icon>
               </div>
            </div>
            <div class="px-2 uk-switcher" id="group-tab">
               <!---- tab 1 ---->
               <div class="p-1">
                  <div class="md:flex md:space-x-6 lg:mx-16">
                     <div class="space-y-5 flex-shrink-0 md:w-7/12">
                        <!-- create post  -->
                        <div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal">
                           <div class="flex space-x-3">
                              <img src="assets/images/avatars/avatar-2.jpg" class="w-10 h-10 rounded-full">
                              <input placeholder="What's Your Mind ? Hamse!" class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full"> 
                           </div>
                           <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                              <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                 <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block" data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                 </svg>
                                 Photo/Video 
                              </div>
                              <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                 <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block" uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" title="" aria-expanded="false">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                                 </svg>
                                 Tag Friend 
                              </div>
                              <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                 <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                 </svg>
                                 Fealing /Activity 
                              </div>
                           </div>
                        </div>
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                           <!-- post header-->
                           <div class="flex justify-between items-center lg:p-4 p-2.5">
                              <div class="flex flex-1 items-center space-x-4">
                                 <a href="#">
                                 <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                 </a>
                                 <div class="flex-1 font-semibold capitalize">
                                    <a href="#" class="text-black dark:text-gray-100"> Johnson smith </a>
                                    <div class="text-gray-700 flex items-center space-x-2">
                                       5 <span> hrs </span> 
                                       <ion-icon name="people"></ion-icon>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                 <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                    <ul class="space-y-1">
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                       </li>
                                       <li>
                                          <hr class="-mx-2 my-2 dark:border-gray-800">
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                          <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div uk-lightbox>
                              <a href="assets/images/avatars/avatar-lg-3.jpg">  
                              <img src="assets/images/avatars/avatar-lg-4.jpg" alt="" class="max-h-96 w-full object-cover">
                              </a>
                           </div>
                           <div class="p-4 space-y-3">
                              <div class="flex space-x-4 lg:font-bold">
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                       </svg>
                                    </div>
                                    <div> Like</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                       </svg>
                                    </div>
                                    <div> Comment</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                       </svg>
                                    </div>
                                    <div> Share</div>
                                 </a>
                              </div>
                              <div class="flex items-center space-x-3 pt-2">
                                 <div class="flex items-center">
                                    <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                    <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                 </div>
                                 <div class="dark:text-gray-100">
                                    Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                 </div>
                              </div>
                              <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                 <div class="flex">
                                    <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12  dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6">
                                             In ut odio libero vulputate 
                                             <urna class="i uil-heart"></urna>
                                             <i
                                                class="uil-grin-tongue-wink"> </i> 
                                          </p>
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
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12  dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
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
                              <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                              <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                 <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                 <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                    <a href="#">
                                       <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                           <!-- post header-->
                           <div class="flex justify-between items-center lg:p-4 p-2.5">
                              <div class="flex flex-1 items-center space-x-4">
                                 <a href="#">
                                 <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                 </a>
                                 <div class="flex-1 font-semibold capitalize">
                                    <a href="#" class="text-black dark:text-gray-100"> Johnson smith </a>
                                    <div class="text-gray-700 flex items-center space-x-2">
                                       5 <span> hrs </span> 
                                       <ion-icon name="people"></ion-icon>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                 <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                    <ul class="space-y-1">
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                       </li>
                                       <li>
                                          <hr class="-mx-2 my-2 dark:border-gray-800">
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                          <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div uk-lightbox>
                              <div class="grid grid-cols-2 gap-2 px-5">
                                 <a href="assets/images/post/img-4.jpg" class="col-span-2">  
                                 <img src="assets/images/post/img-4.jpg" alt="" class="rounded-md w-full lg:h-76 object-cover">
                                 </a>
                                 <a href="assets/images/post/img-4.jpg">  
                                 <img src="assets/images/post/img-2.jpg" alt="" class="rounded-md w-full h-full">
                                 </a>
                                 <a href="assets/images/post/img-4.jpg" class="relative">
                                    <img src="assets/images/post/img-3.jpg" alt="" class="rounded-md w-full h-full">
                                    <div class="absolute bg-gray-900 bg-opacity-30 flex justify-center items-center text-white rounded-md inset-0 text-2xl"> + 15 more </div>
                                 </a>
                              </div>
                           </div>
                           <div class="p-4 space-y-3">
                              <div class="flex space-x-4 lg:font-bold">
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                       </svg>
                                    </div>
                                    <div> Like</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                       </svg>
                                    </div>
                                    <div> Comment</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                       </svg>
                                    </div>
                                    <div> Share</div>
                                 </a>
                              </div>
                              <div class="flex items-center space-x-3 pt-2">
                                 <div class="flex items-center">
                                    <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                    <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                 </div>
                                 <div class="dark:text-gray-100">
                                    Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                 </div>
                              </div>
                              <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                 <div class="flex">
                                    <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6">
                                             In ut odio libero vulputate 
                                             <urna class="i uil-heart"></urna>
                                             <i
                                                class="uil-grin-tongue-wink"> </i> 
                                          </p>
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
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
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
                              <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                              <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                 <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                 <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                    <a href="#">
                                       <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                           <!-- post header-->
                           <div class="flex justify-between items-center lg:p-4 p-2.5">
                              <div class="flex flex-1 items-center space-x-4">
                                 <a href="#">
                                 <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                 </a>
                                 <div class="flex-1 font-semibold capitalize">
                                    <a href="#" class="text-black dark:text-gray-100"> Johnson smith </a>
                                    <div class="text-gray-700 flex items-center space-x-2">
                                       5 <span> hrs </span> 
                                       <ion-icon name="people"></ion-icon>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                 <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                    <ul class="space-y-1">
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                       </li>
                                       <li>
                                          <hr class="-mx-2 my-2 dark:border-gray-800">
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                          <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div class="p-5 pt-0 border-b dark:border-gray-700">
                              Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim laoreet dolore magna aliquam erat volutpat
                           </div>
                           <div class="p-4 space-y-3">
                              <div class="flex space-x-4 lg:font-bold">
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600 ">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                       </svg>
                                    </div>
                                    <div> Like</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                       </svg>
                                    </div>
                                    <div> Comment</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                       </svg>
                                    </div>
                                    <div> Share</div>
                                 </a>
                              </div>
                              <div class="flex items-center space-x-3 pt-2">
                                 <div class="flex items-center">
                                    <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                    <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                 </div>
                                 <div class="dark:text-gray-100">
                                    Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                 </div>
                              </div>
                              <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                 <div class="flex">
                                    <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6">
                                             In ut odio libero vulputate 
                                             <urna class="i uil-heart"></urna>
                                             <i
                                                class="uil-grin-tongue-wink"> </i> 
                                          </p>
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
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
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
                              <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                              <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                 <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                 <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                    <a href="#">
                                       <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card lg:mx-0 uk-animation-slide-bottom-small">
                           <!-- post header-->
                           <div class="flex justify-between items-center lg:p-4 p-2.5">
                              <div class="flex flex-1 items-center space-x-4">
                                 <a href="#">
                                 <img src="assets/images/avatars/avatar-2.jpg" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                                 </a>
                                 <div class="flex-1 font-semibold capitalize">
                                    <a href="#" class="text-black dark:text-gray-100"> Johnson smith </a>
                                    <div class="text-gray-700 flex items-center space-x-2">
                                       5 <span> hrs </span> 
                                       <ion-icon name="people"></ion-icon>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <a href="#"> <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i> </a>
                                 <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700" 
                                    uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                    <ul class="space-y-1">
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-share-alt mr-1"></i> Share
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-edit-alt mr-1"></i>  Edit Post 
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-comment-slash mr-1"></i>   Disable comments
                                          </a> 
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                          <i class="uil-favorite mr-1"></i>  Add favorites 
                                          </a> 
                                       </li>
                                       <li>
                                          <hr class="-mx-2 my-2 dark:border-gray-800">
                                       </li>
                                       <li> 
                                          <a href="#" class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
                                          <i class="uil-trash-alt mr-1"></i>  Delete
                                          </a> 
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                           <div class="w-full h-full">
                              <iframe src="https://www.youtube.com/embed/pQN-pnXPaVg" frameborder="0"
                                 uk-video="automute: true" allowfullscreen uk-responsive class="w-full lg:h-64 h-40"></iframe>
                           </div>
                           <div class="p-4 space-y-3">
                              <div class="flex space-x-4 lg:font-bold">
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
                                       </svg>
                                    </div>
                                    <div> Like</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
                                       </svg>
                                    </div>
                                    <div> Comment</div>
                                 </a>
                                 <a href="#" class="flex items-center space-x-2 flex-1 justify-end">
                                    <div class="p-2 rounded-full  text-black lg:bg-gray-100 dark:bg-gray-600">
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
                                          <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                                       </svg>
                                    </div>
                                    <div> Share</div>
                                 </a>
                              </div>
                              <div class="flex items-center space-x-3 pt-2">
                                 <div class="flex items-center">
                                    <img src="assets/images/avatars/avatar-1.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
                                    <img src="assets/images/avatars/avatar-4.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                    <img src="assets/images/avatars/avatar-2.jpg" alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900 -ml-2">
                                 </div>
                                 <div class="dark:text-gray-100">
                                    Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
                                 </div>
                              </div>
                              <div class="border-t py-4 space-y-4 dark:border-gray-600">
                                 <div class="flex">
                                    <div class="w-10 h-10 rounded-full relative flex-shrink-0">
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6">
                                             In ut odio libero vulputate 
                                             <urna class="i uil-heart"></urna>
                                             <i
                                                class="uil-grin-tongue-wink"> </i> 
                                          </p>
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
                                       <img src="assets/images/avatars/avatar-1.jpg" alt="" class="absolute h-full rounded-full w-full">
                                    </div>
                                    <div>
                                       <div class="text-gray-700 py-2 px-3 rounded-md bg-gray-100 relative lg:ml-5 ml-2 lg:mr-12 dark:bg-gray-800 dark:text-gray-100">
                                          <p class="leading-6"> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. David !<i class="uil-grin-tongue-wink-alt"></i> </p>
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
                              <a href="#" class="hover:text-blue-600 hover:underline">  Veiw 8 more Comments </a>
                              <div class="bg-gray-100 rounded-full relative dark:bg-gray-800 border-t">
                                 <input placeholder="Add your Comment.." class="bg-transparent max-h-10 shadow-none px-5">
                                 <div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
                                    <a href="#">
                                       <ion-icon name="happy-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="image-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                    <a href="#">
                                       <ion-icon name="link-outline" class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
                                    </a>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="flex justify-center mt-6">
                           <a href="#" class="bg-white dark:bg-gray-900 font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
                           Load more ..</a>
                        </div>
                     </div>
                     <div class="w-full flex-shirink-0">
                        <div class="card p-4 mb-5">
                           <h1 class="block text-lg font-bold"> About  </h1>
                           <div class="space-y-4 mt-3">
                              <div class="flex items-center space-x-3">
                                 <ion-icon name="people" class="bg-gray-100 p-2 rounded-full text-2xl" role="img" aria-label="people"></ion-icon>
                                 <div class="flex-1">
                                    <div class="font-semibold">  12 Members </div>
                                 </div>
                              </div>
                              <div class="flex items-start space-x-3">
                                 <ion-icon name="globe-outline" class="bg-gray-100 p-2 rounded-full text-2xl" role="img" aria-label="people"></ion-icon>
                                 <div class="flex-1">
                                    <div class="font-bold"> Public </div>
                                    <div> Anyone can see who's in the group and what they post. </div>
                                 </div>
                              </div>
                              <div class="flex items-center space-x-3">
                                 <ion-icon name="unlink" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                 <div class="flex-1">
                                    <div  class="font-bold">  Visible </div>
                                    <div> Anyone can find this group. </div>
                                 </div>
                              </div>
                              <div class="flex items-center space-x-3">
                                 <ion-icon name="mail-open" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                 <div class="flex-1">
                                    <div class="font-bold">  General</div>
                                 </div>
                              </div>
                              <div class="flex items-center space-x-3">
                                 <ion-icon name="albums" class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                 <div class="flex-1">
                                    <div>  <a href="#" class="text-blue-500">Product/service</a> </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="widget card p-5 border-t">
                           <div class="flex items-center justify-between mb-2">
                              <div>
                                 <h4 class="text-lg font-semibold"> Related  groups </h4>
                              </div>
                              <a href="#" class="text-blue-600 "> See all</a>
                           </div>
                           <div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                 <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                 <img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 " alt="">
                                 </a>
                                 <div class="flex-1">
                                    <a href="timeline-page.html" class="text-base font-semibold capitalize"> Graphic Design  </a>
                                    <div class="text-sm text-gray-500 mt-0.5"> 345K  Following</div>
                                 </div>
                                 <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                 Join
                                 </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                 <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                 <img src="assets/images/group/group-4.jpg" class="absolute w-full h-full inset-0 " alt="">
                                 </a>
                                 <div class="flex-1">
                                    <a href="timeline-page.html" class="text-base font-semibold capitalize"> Mountain Riders </a>
                                    <div class="text-sm text-gray-500 mt-0.5"> 452k Following </div>
                                 </div>
                                 <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                 Join
                                 </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                 <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                 <img src="assets/images/group/group-2.jpg" class="absolute w-full h-full inset-0" alt="">
                                 </a>
                                 <div class="flex-1">
                                    <a href="timeline-page.html" class="text-base font-semibold capitalize">  Coffee Addicts  </a>
                                    <div class="text-sm text-gray-500 mt-0.5"> 845K Following</div>
                                 </div>
                                 <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                 Join
                                 </a>
                              </div>
                              <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                                 <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                 <img src="assets/images/group/group-1.jpg" class="absolute w-full h-full inset-0" alt="">
                                 </a>
                                 <div class="flex-1">
                                    <a href="timeline-page.html" class="text-base font-semibold capitalize"> Architecture    </a>
                                    <div class="text-sm text-gray-500 mt-0.5"> 237K Following</div>
                                 </div>
                                 <a href="timeline-page.html" class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
                                 Join
                                 </a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!---- tab 2 ---->
               <div class="p-1">
                  <div class="card md:p-6 max-w-3xl mx-auto">
                     <div class="flex justify-between items-start relative md:mb-4 mb-3">
                        <div class="flex-1">
						  <!----- group about---->
						    <div id="group_about">
							     <div class="row">
									<div class="col-lg-6">
										 <h3 class="text-xl font-bold">  About this group </h3>
									  </div>
									  <div class="col-lg-6">
										 <div class="right-ct">
											<button class="button" id="groupmenu" >Edit Group Info
                                                    </button>
										 </div>
									  </div>
								   </div>
								   <hr>
								   <div class="about-group">
									  <div class="card-about">
										 <div class="space-y-4 mt-3">
											<div class="flex space-x-3">
											   <ion-icon name="globe-outline" class="bg-gray-100 p-2 rounded-full text-2x0" role="img" aria-label="people"></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Group Name</div>
												  <div>Apna Indore </div>
											   </div>
											</div>
										 </div>
										 <div class="space-y-4 mt-3">
											<div class="flex space-x-3">
												<ion-icon name="albums" class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated" role="img" aria-label="albums"></ion-icon>
												<div class="flex-1">
													<div class="font-semibold"> Group Description</div>
													 <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type </div>
												</div>
											</div>
										 </div>
										 <div class="space-y-4 mt-3">
											<div class="flex items-center space-x-3">
											   <ion-icon name="globe-outline" class="bg-gray-100 p-2 rounded-full text-2x0" role="img" aria-label="people"></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Public</div>
												  <div> Anyone can see who's in the group and what they post. </div>
											   </div>
											</div>
										 </div>
										 <div class="space-y-4 mt-3">
											<div class="flex  space-x-3">
											   <ion-icon class="bg-gray-100 p-2 rounded-full text-2x0 md hydrated icon-material-outline-visibility"  ></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Visible</div>
												  <div> Anyone can find this group. </div>
											   </div>
											</div>
										 </div>
										
										 
										 <div class="space-y-4 mt-3">
											<div class="flex space-x-3">
											   <ion-icon name="unlink" class="bg-gray-100 p-2 rounded-full text-2x0 " aria-label="unlink"  ></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Web address</div>
												  <div>https://byloapp.in/timeline_group/apnaaindore/  </div>
											   </div>
											</div>
										 </div>
										  <div class="space-y-4 mt-3">
											<div class="flex  space-x-3">
											   <ion-icon class="bg-gray-100 p-2 rounded-full text-2x0 md hydrated icon-material-outline-visibility"  ></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Approve all member posts</div>
												  <div> Off </div>
											   </div>
											</div>
										 </div>
										  <div class="space-y-4 mt-3">
											<div class="flex  space-x-3">
											   <ion-icon name="edit" class="bg-gray-100 p-2 rounded-full text-2x0 icon-feather-edit" aria-label="edit"  ></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">Who can post</div>
												  <div>Anyone in the group </div>
											   </div>
											</div>
										 </div>
										  <div class="space-y-4 mt-3">
											<div class="flex  space-x-3">
											   <ion-icon  class="bg-gray-100 p-2 rounded-full text-2x0 icon-material-outline-access-time"  ></ion-icon>
											   <div class="flex-1">
												  <div class="font-semibold">History</div>
												  <div> Group created on 18 November 2018. Name last changed on 21 December 2020.  </div>
											   </div>
											</div>
										 </div>
										 <div class="space-y-4 mt-3">
											<div class="flex  space-x-3">
											 <ion-icon name="people" class="bg-gray-100 p-2 rounded-full text-2x0 " aria-label="unlink"  ></ion-icon>
												<div class="flex-1">
												  <div class="pt-2 community-grp">
													 <div class="font-semibold">Community</div>
													<div class="like-follow">
														<p><i class="icon-material-outline-thumb-up"> </i> <span>  9990 total likes </span></p>
														<p><i class="icon-feather-plus-square"> </i> <span> 220 total Members </span></p>
													</div>
												</div>
											   </div>
											   
											</div>
										 </div>
									  </div>
								   </div>
							</div>
							
							<!----- edit about group ------->
						    <div id="edit_about_group" style="display:none;">
							     <div class="row">
									<div class="col-lg-12">
										<button class="button" id="group_bach_btn" >Back</button>
									  </div>
								   </div>
								   <hr>
								   <div class="about-group">
									  <div class="card-about">
 										 <div class="bg-white rounded-md lg:shadow-md shadow col-span-2 ">
										   <form method="post" name="edit_page_details" id="reg_form" action="PageCntrl/update_page">
											  <div class="grid grid-cols-1 gap-3 lg:p-6 p-4">

												 <div class="col-span-2">
													<label for=""> Group Name</label>
													<input type="text" placeholder="Group Name" value="" name="group_name" class="shadow-none with-border">
												 </div>
												  <div class="col-span-2">
													<label for=""> Web address</label>
													<input type="text" placeholder="apnaaindore" value="" name="group_url" class="shadow-none with-border">
												 </div>
												 <div class="col-span-2">
													<label for="group_about">Group
													Description</label>
													<textarea id="group_about" name="group_about" rows="3" class="with-border"></textarea>
												 </div>
												
												 <div class="col-span-2 pt-2">
													<div class="bg-white rounded-md shadow py-4 px-6">
													<label for=""> Anyone can see who's in the group and what they post.</label> <br>
															<div class="radio">
																<input id="radio-1" name="radio" type="radio" checked>
																<label for="radio-1"><span class="radio-label"> </span>  <span class="sp-label"> Public </span> </label>
															</div>
															<br>
															<div class="radio">
																<input id="radio-2" name="radio" type="radio" >
																<label for="radio-2"><span class="radio-label"> </span>  <span class="sp-label"> Private </span>	 </label>
															</div>
															 <hr>
													</div>
												 </div>
												
												 <div class="col-span-2 pt-2">
													<div class="bg-white rounded-md shadow py-4 px-6 ">
													<label for="">Group Visibility</label> <br>
															<div class="radio">
																<input id="radio-3" name="Visibility" type="radio" checked>
																<label for="radio-3"> <span class="radio-label"></span>  <span class="sp-label">  Visible </span> <span>  Anyone can find this group. </span> </label>
															</div>
															<br>
															<div class="radio">
																<input id="radio-4" name="Visibility" type="radio" >
																<label for="radio-4"> <span class="radio-label"></span>  <span class="sp-label">   Hidden  </sapn>	<span>   Only members can find this group. </span>  </label>
															</div>
															  <hr>
													</div>
												 </div>
												  
												
												 
												 <div class="col-span-2 pt-2">
													<div class="bg-white rounded-md shadow py-4 px-6 ">
													<label for="">Approve all member posts</label> <br>
															<div class="radio">
																<input id="radio-5" name="approve_post" type="radio" checked>
																<label for="radio-5"> <span class="radio-label"></span>  <span class="sp-label">  Off </span>   </label>
															</div>
															<br>
															<div class="radio">
																<input id="radio-6" name="approve_post" type="radio" >
																<label for="radio-6"> <span class="radio-label"></span>  <span class="sp-label">   On  </sapn>   </label>
															</div>
															  <hr>
													</div>
												 </div>
												 
												 <div class="col-span-2 pt-2">
													<div class="bg-white rounded-md shadow py-4 px-6 ">
													<label for="">Approve all member posts</label> <br>
															<div class="radio">
																<input id="radio-7" name="whh_can_post" type="radio" checked>
																<label for="radio-7"> <span class="radio-label"></span>  <span class="sp-label">  Anyone in the group </span>   </label>
															</div>
															<br>
															<div class="radio">
																<input id="radio-8" name="whh_can_post" type="radio" >
																<label for="radio-8"> <span class="radio-label"></span>  <span class="sp-label">   Admin Only  </sapn>   </label>
															</div>
															  <hr>
													</div>
												 </div>
												 

											  </div>
											  <div class="bg-gray-10 p-6 pt-0 text-center space-x-3">
												 <button type="button" id="update_pages" class="button bg-blue-700" onclick="MyFunction('Edit_page')"> Update
												 </button>
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
               <!---- tab 3 ---->
               <div class="p-1">
                   <div class="card md:p-6 max-w-3xl mx-auto">
                     <div class="flex justify-between items-start relative md:mb-4 mb-3">
                        <div class="flex-1">
                           <div class="row">
                              <div class="col-lg-12">
                                 <h3 class="text-xl font-semi-bold">   Members </h3>
                              </div>
                           </div>
                           <hr>
                           <div class="about-group">
                               <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
									<div class="w-14 h-14 flex-shrink-0 rounded-circle relative"> 
										<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
									</div>
									<div class="flex-1">
										<a href="timeline-group.html"  class="text-lg font-semibold capitalize"> G.V. Jeevankumar </a>
											<div class="text-sm text-gray-500 mt-0.5"> Anantapur, Andhra Pradesh</div>
									</div>
									<a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold"> 
									   <ion-icon name="person-add"></ion-icon> Connect
								   </a>
							    </div>
								<div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
									<div class="w-14 h-14 flex-shrink-0 rounded-circle relative"> 
										<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
									</div>
									<div class="flex-1">
										<a href="timeline-group.html"  class="text-lg font-semibold capitalize"> G.V. Jeevankumar </a>
											<div class="text-sm text-gray-500 mt-0.5"> Anantapur, Andhra Pradesh</div>
									</div>
									<a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold"> 
									   <ion-icon name="person-add"></ion-icon> Connect
								   </a>
							    </div>
								
							</div>
							
							<!---  add group admin --->
							<div class="about-group">
									<div class="row">
									  <div class="col-lg-12">
										 <h3 class="text-xl font-semi-bold">   Members  · 1 </h3>
									  </div>
								   </div>
								   <hr>
                                 <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
									<div class="w-14 h-14 flex-shrink-0 rounded-circle relative"> 
										<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
									</div>
									<div class="flex-1">
										<a href="timeline-group.html"  class="text-lg font-semibold capitalize"> G.V. Jeevankumar </a>
											<div class="text-sm text-gray-500 mt-0.5"> Anantapur, Andhra Pradesh</div>
									</div>
									<button class="button gray" type="button">  <span class="icon-feather-more-horizontal"></button>
									<div class="uk-width-medium" uk-drop="mode: click">
											<div class="card p-5">
												<div class="uk-drop-grid uk-child-width-1-1@m" uk-grid>
													<div>
														 <ul class="list-item"> 
														    <li> <a href="#add_group_expert" uk-toggle> <ion-icon name="person-add-outline"></ion-icon> Add as group expert  </a> </li>
														    <li> <a href="#leave_group" uk-toggle><ion-icon name="exit-outline"></ion-icon> Leave group  </a> </li>
														 </ul>
													</div>
												</div>
											</div>
										</div>
										
										<!---- add group admin and leave group model popup --->
										
											 <div id="add_group_expert" uk-modal>
												 <div class="uk-modal-dialog">
													 <button class="uk-modal-close-default m-3" type="button" uk-close></button>
													 <div class="uk-modal-header">
														 <h3 class="uk-modal-title">Add yourself as a group expert?</h3>
													 </div>
													 <div class="uk-modal-body">
														 <p>You'll receive a badge next to your name in group discussions.</p>
													 </div>
													 <div class="uk-modal-footer text-right">
														 <button class="button gray uk-modal-close" type="button">Cancel</button>
														 <button class="button" type="button">Confirm</button>
													 </div>
												 </div>
											 </div> 
											 
											 
											 <div id="leave_group" uk-modal>
												 <div class="uk-modal-dialog">
													 <button class="uk-modal-close-default m-3" type="button" uk-close></button>
													 <div class="uk-modal-header">
														 <h3 class="uk-modal-title">Leave group?</h3>
													 </div>
													 <div class="uk-modal-body">
														 <p>Are you sure that you want to leave CA Made Easy School of Online Education?</p>
													 </div>
													 <div class="uk-modal-footer text-right">
														 <button class="button gray uk-modal-close" type="button">Cancel</button>
														 <button class="button" type="button">Leave group</button>
													 </div>
												 </div>
											 </div> 
											 
											 
											 <!--------------->
								 
								 
							    </div>
								<div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
									<div class="w-14 h-14 flex-shrink-0 rounded-circle relative"> 
										<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
									</div>
									<div class="flex-1">
										<a href="timeline-group.html"  class="text-lg font-semibold capitalize"> G.V. Jeevankumar </a>
											<div class="text-sm text-gray-500 mt-0.5"> Anantapur, Andhra Pradesh</div>
									</div>
									<button class="button gray" type="button">  <span class="icon-feather-more-horizontal"></button>
									
										<div class="uk-width-medium" uk-drop="mode: click">
											<div class="card p-5">
												<div class="uk-drop-grid uk-child-width-1-1@m" uk-grid>
													<div>
														 <ul class="list-item"> 
														    <li> <a href="#add_group_expert" uk-toggle> <ion-icon name="person-add-outline"></ion-icon> Add as group expert  </a> </li>
														    <li> <a href="#leave_group" uk-toggle><ion-icon name="exit-outline"></ion-icon> Leave group  </a> </li>
														 </ul>
													</div>
												</div>
											</div>
										</div>

							    </div>
								<hr>
								
								<div class="create-group-admin">
						
									  <div class="row">
									   <div class="col-lg-12">
										 <h5 class="text-xl font-semi-bold">   Group experts </h5>
										 <p>New people and Pages that join this group will appear here. </p>
									  </div>
									  
										  <div class="col-lg-12">
											  <div class="invite-friend-group">
											     <p class="text-center"> You are the only admin of Apna Indore. Invite new admins to help maintain this group. </p>
											        <div class="text-center">
													     <a class="button gray" href="#invite-group-admin" uk-toggle>Invite new admin</a>
													</div>
												   
												 <!---------- create admin -=--->
												 
												 <div id="invite-group-admin" uk-modal>
													 <div class="uk-modal-dialog">
														 <button class="uk-modal-close-default m-3" type="button" uk-close></button>
														 <div class="uk-modal-header">
															 <h3 class="uk-modal-title">Invite new admin</h3>
														 </div>
														 <div class="uk-modal-body invt-model">
														 <p> You are the last admin of Apna Indore. Invite new admins to maintain this group after you've left.  </p>
															<!-- search icon for mobile -->
																<div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox"> </div>
																<div class="header_search"><i class="uil-search-alt"></i> 
																	<input value="" type="text" class="form-control" placeholder="Search for Friends" autocomplete="off">
																	<div uk-drop="mode: click" class="header_search_dropdown">
																		<ul>
																			<li> 
																				<a href="#">  
																					<img src="assets/images/avatars/avatar-1.jpg" alt="" class="list-avatar">
																					<div class="list-name">  Erica Jones </div>
																				</a> 
																			</li> 
																			<li> 
																				<a href="#">  
																					<img src="assets/images/avatars/avatar-2.jpg" alt="" class="list-avatar">
																					<div class="list-name">  Coffee  Addicts </div>
																				</a> 
																			</li>
																			<li> 
																				<a href="#">  
																					<img src="assets/images/avatars/avatar-3.jpg" alt="" class="list-avatar">
																					<div class="list-name"> Mountain Riders </div>
																				</a> 
																			</li>
																			<li> 
																				<a href="#">  
																					<img src="assets/images/avatars/avatar-4.jpg" alt="" class="list-avatar">
																					<div class="list-name"> Property Rent And Sale  </div>
																				</a> 
																			</li>
																			<li> 
																				<a href="#">  
																					<img src="assets/images/avatars/avatar-5.jpg" alt="" class="list-avatar">
																					<div class="list-name">  Erica Jones </div>
																				</a> 
																			</li>
																		</ul>
												
																	</div>
																</div>
																
																<div class="invires-frd">
																   <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
																		<div class="w-14 h-14 flex-shrink-0 rounded-circle relative"> 
																			<img src="assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 rounded-circle object-cover" alt="">
																		</div>
																		<div class="flex-1">
																			<a href="timeline-group.html"  class="text-lg font-semibold capitalize"> G.V. Jeevankumar </a>
																				<div class="text-sm text-gray-500 mt-0.5"> Anantapur, Andhra Pradesh</div>
																		</div>
																		<a href="#" class="flex items-center justify-center h-9 px-4 rounded-md bg-gray-200 font-semibold"> 
																		   <ion-icon name="person-add"></ion-icon> Add
																	   </a>
																	</div>
																</div>
														 </div>
														 <div class="uk-modal-footer text-right">
															 <button class="button gray uk-modal-close" type="button">Cancel</button>
															 <button class="button" type="button">Next</button>
														 </div>
													 </div>
												 </div> 
												 
												 <div id="invite-group-admin" uk-modal>
													 <div class="uk-modal-dialog">
														 <button class="uk-modal-close-default m-3" type="button" uk-close></button>
														 <div class="uk-modal-header">
															 <h3 class="uk-modal-title">Leave group?</h3>
														 </div>
														 <div class="uk-modal-body">
															 <p>Are you sure that you want to leave CA Made Easy School of Online Education?</p>
														 </div>
														 <div class="uk-modal-footer text-right">
															 <button class="button gray uk-modal-close" type="button">Cancel</button>
															 <button class="button" type="button">Leave group</button>
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
                     </div>
                  </div>
               <!---- tab 4 ---->
               <div class="p-1">
                  <h2> Tab1  </h2>
               </div>
               <!---- tab 5 ---->
               <div class="p-1">
			   <div class="card md:p-6 max-w-3xl mx-auto">
                     <div class="flex justify-between items-start relative md:mb-4 mb-3">
                        <div class="flex-1">
						   <div class="grid md:grid-cols-4 sm:grid-cols-3 grid-cols-2 gap-3 mt-5">
								<div>
									<div class="bg-gray-200 max-w-full lg:h-44 h-36 rounded-lg relative overflow-hidden shadow uk-transition-toggle">
										<img src="<?php echo base_url();?>/assets/images/post/img-2.jpg"
											 class="w-full h-full absolute object-cover inset-0">
										<!-- overly-->
										<div class="-bottom-12 absolute bg-gradient-to-b from-transparent h-1/2 to-gray-800 uk-transition-slide-bottom-small w-full"></div>
										<div class="absolute bottom-0 w-full p-3 text-white uk-transition-slide-bottom-small">
											<div class="text-base"> Image description</div>
											<div class="flex justify-between text-xs">
												<a href="#"> Like</a>
												<a href="#"> Comment </a>
												<a href="#"> Share </a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="flex justify-center mt-6">
								<a href="#"
								   class="bg-white dark:bg-gray-900 font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
									Load more ..</a>
							</div>
							</div>
					   </div>
				   </div>
			    </div>
               <!---- tab 6 ---->
               <div class="p-1">
                   <div class="card md:p-6 max-w-3xl mx-auto">
                     <div class="flex justify-between items-start relative md:mb-4 mb-3">
                        <div class="flex-1">
						    <div class="grid md:grid-cols-3 grid-cols-2  gap-x-2 gap-y-4 mt-3">
								<div>
									<a href="video-watch.html"
									   class="w-full h-36 overflow-hidden rounded-lg relative block">
										<img src="<?php echo base_url();?>/assets/images/video/img-4.png" alt=""
											 class="w-full h-full absolute inset-0 object-cover">
										<span class="absolute bg-black bg-opacity-60 bottom-1 font-semibold px-1.5 py-0.5 right-1 rounded text-white text-xs"> 12:21</span>
										<img src="<?php echo base_url();?>/assets/images/icon-play.svg"
											 class="w-12 h-12 uk-position-center" alt="">
									</a>
								</div>
							</div>

							<div class="flex justify-center mt-6">
								<a href="#"
								   class="bg-white font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
									Load more ..</a>
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
                           <ion-icon name="checkbox-outline" class="pr-2 text-xl"></ion-icon>
                           Mark all as read
                        </a>
                     </li>
                     <li>
                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                           <ion-icon name="settings-outline" class="pr-2 text-xl"></ion-icon>
                           Chat setting 
                        </a>
                     </li>
                     <li>
                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                           <ion-icon name="notifications-off-outline" class="pr-2 text-lg"></ion-icon>
                           Disable notifications
                        </a>
                     </li>
                     <li>
                        <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-100 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                           <ion-icon name="star-outline"  class="pr-2 text-xl"></ion-icon>
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
                  <div class="contact-username">Adrian Mohani </div>
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
                  <div class="contact-username">Adrian Mohani </div>
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
   <!-- Craete post modal -->
   <div id="create-post-modal" class="create-post" uk-modal>
      <div
         class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">
         <div class="text-center py-4 border-b">
            <h3 class="text-lg font-semibold"> Create Post </h3>
            <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 m-1 right-2" type="button" uk-close uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
         </div>
         <div class="flex flex-1 items-start space-x-4 p-5">
            <img src="assets/images/avatars/avatar-2.jpg"
               class="bg-gray-200 border border-white rounded-full w-11 h-11">
            <div class="flex-1 pt-2">
               <textarea class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none" rows="5"
                  placeholder="What's Your Mind ? Stella!"></textarea>
            </div>
         </div>
         <div class="bsolute bottom-0 p-4 space-x-4 w-full">
            <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-3 shadow-sm items-center">
               <div class="lg:block hidden"> Add to your post </div>
               <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                  <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                  </svg>
                  <svg class="text-red-600 h-9 p-1.5 rounded-full bg-red-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z"> </path>
                  </svg>
                  <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                  </svg>
                  <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"> </path>
                  </svg>
                  <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"> </path>
                  </svg>
                  <svg class="text-pink-600 h-9 p-1.5 rounded-full bg-pink-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"  d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                  </svg>
                  <svg class="text-purple-600 h-9 p-1.5 rounded-full bg-purple-100 w-9 cursor-pointer" id="veiw-more" hidden fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19V6l12-3v13M9 19c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zm12-3c0 1.105-1.343 2-3 2s-3-.895-3-2 1.343-2 3-2 3 .895 3 2zM9 10l12-3"></path>
                  </svg>
                  <!-- view more -->
                  <svg class="hover:bg-gray-200 h-9 p-1.5 rounded-full w-9 cursor-pointer" id="veiw-more" uk-toggle="target: #veiw-more; animation: uk-animation-fade" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"> </path>
                  </svg>
               </div>
            </div>
         </div>
         <div class="flex items-center w-full justify-between p-3 border-t">
            <select class="selectpicker mt-2 col-4 story">
               <option>Only me</option>
               <option>Every one</option>
               <option>People I Follow </option>
               <optionion>People Follow Me</optionion>
            </select>
            <div class="flex space-x-2">
               <a href="#" class="bg-red-100 flex font-medium h-9 items-center justify-center px-5 rounded-md text-red-600 text-sm">
                  <svg class="h-5 pr-1 rounded-full text-red-500 w-6 fill-current" id="veiw-more" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="false" style="">
                     <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                  </svg>
                  Live 
               </a>
               <a href="#" class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium">
               Share </a>    
            </div>
            <a href="#" hidden
               class="bg-blue-600 flex h-9 items-center justify-center rounded-lg text-white px-12 font-semibold">
            Share </a>
         </div>
      </div>
   </div>
   <?php echo $layout['js'];?>
   
</body>
</html>