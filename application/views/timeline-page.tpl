<?php echo $layout['meta'];?>
<style>
    .wrap {
	float: left;
	margin: 0 20px 0 0;
    }
	
    .content {
	background-color: #444;
	width: 200px;
	height: 250px;
	position: absolute;
	display: none;
    }
	
    .hitter {
	width: 500px;
	height: 500px;
	border: 1px solid #ee0000;
	display: none;
    }
	
    video::-internal-media-controls-download-button {
	display: none;
    }
	
    video::-webkit-media-controls-enclosure {
	overflow: hidden;
    }
	
    video::-webkit-media-controls-panel {
	width: calc(100% + 30px); /* Adjust as needed */
    }
	
    .content {
	border: 0px solid black;
	border-radius: 3px;
	padding: 5px;
	margin: 0 auto;
	width: 50%;
    }
	
    .post {
	border-bottom: 1px solid black;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
    }
	
    .post:last-child {
	border: 0;
    }
	
    .post h1 {
	font-weight: normal;
	font-size: 30px;
    }
	
    .post a.link {
	text-decoration: none;
	color: black;
    }
	
    .post-text {
	letter-spacing: 1px;
	font-size: 15px;
	font-family: serif;
	color: gray;
	text-align: justify;
    }
	
    .post-action {
	margin-top: 15px;
	margin-bottom: 15px;
    }
	
    .like, .unlike {
	border: 0;
	background: none;
	letter-spacing: 1px;
	color: lightseagreen;
    }
	
    .like, .unlike:hover {
	cursor: pointer;
    }
	
	.user-pr-banner ul.nav.nav-tabs.b-tab.border-t.-mb-0\.5.lg\:pl-2.uk-sticky.uk-active.uk-sticky-fixed.uk-sticky-below {
	z-index: 1;
	background: rgb(255, 255, 255);
	position: fixed;
	top: 64px !important;
	width: 571px !important;
    }
	
    .comments-area {
	display: inline-block;
	width: 100%;
    }
	
    .comments-area > ul {
	display: inline-block;
	list-style: outside none none;
	margin-bottom: 0;
	width: 100%;
	padding-left: 0;
    }
	
    .card {
	background: #80808003;
    }
	
    ul, ol {
	margin-top: 0;
    }
	
    .comments-area > ul li {
	display: inline-block;
	margin-top: 20px;
	width: 100%;
    }
	
    .comments-area > ul li .sub_li {
	display: inline-block;
	margin-top: 0px !important;
	width: 100%;
    }
	
	
	
    .comments-area > ul li figure {
	display: inline-block;
	vertical-align: top;
    }
	
    .commenter {
	background: #fff none repeat scroll 0 0;
	border-radius: 6px;
	display: inline-block;
	margin-bottom: 5px;
	margin-left: 4px;
	max-width: 90%;
	padding: 8px 10px;
	vertical-align: top;
	width: 100%;
    }
	
    .commenter > h5 {
	display: inline-block;
	font-size: 12px;
	margin-bottom: 0;
	margin-right: 10px;
    }
	
    h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	color: #3e3f5e;
    }.commenter > span {
	color: #92929e;
	font-size: 11px;
	}.commenter > p {
	display: inline-block;
	font-size: 12px;
	margin-bottom: 0;
	margin-top: 5px;
	width: 100%;
	}
	
    p {
	color: #7d7e9e;
	font-size: 14px;
	line-height: 24px;
	font-family: 'Roboto', sans-serif;
	margin-top: 0;
	font-weight: 300;
    }.commenter > span {
	color: #92929e;
	font-size: 11px;
	}.commenter > a {
	display: inline-block;
	font-size: 12px;
	width: 100%;
	color: #ff7373;
	}
    .sub-ul{
	padding-left: 30px;
    }
    ::before {
	color: #ee4a55;
    }
</style>
<!-- Header -->
<body>
	<?php
		if(!empty($page_detail)){
			foreach($page_detail as $po){
				$blog = explode(",", $po->page_tag);
			?>
			<div id="wrapper">
				<?php echo $layout['header'];?>
				
				<!-- sidebar -->
				<?php echo $layout['sidebar'];?>
				
				<div class="main_content">
					<div class="mcontainer">
						
                        <div class="profile is_page user-pr-banner">
							<div class="uk-margin add-file-page">
								<div class="business-cover profiles_banner center-block">
									<figure>
										<div class="avatar-upload defailt-banner">
											<?php if($this->session->userdata('id') == $po->user_id) { ?>
												<form method="POST" id="reg_form" action="/WebCntrl/update_banner_image"
												enctype="multipart/form-data">
													
													
													<!--banner---->
													
													<div class="profile_action absolute bottom-0 right-0 space-x-1.5 p-3 text-sm z-50 hidden lg:flex">
														<div>
															<a class="flex items-center justify-center h-8 px-3 rounded-md bg-gray-700 bg-opacity-70 text-white space-x-1.5" href="#user_banner_upload" uk-toggle>
																<ion-icon name="create-outline" class="text-xl"></ion-icon>
																<span> Change Cover Photo </span>
																<span></span>
															</a>
														</div>
														
														
														
													</div>
													<!--banner---->
													
												</form>
												
												
											<?php }?>
											<div class="avatar-preview">
												<?php if(!empty($po->cover_image)){ ?>
													<img class="profile-user-img  img-responsive gambar" id="imagePreview"
													src="<?php echo base_url('upload')?>/<?php echo $po->cover_image;?>"
													alt="">
													<?php } else { ?>
													<img class="profile-user-img gambar img-responsive" id="imagePreview"
													src="<?php echo base_url()?>assets/images/group/group-cover-1.jpg"
													alt="User profile picture">
												<?php } ?>
												
											</div>
										</div>
									</figure>
								</div>
							</div>
							
							<div class="profiles_content">
								<div class="profile_avatar-b">
									<div class="profile_avatar_holder">
										
										<div class="business-logo">
											<div class="avatar-upload">
												<div onclick="gepageid('<?= $po->page_id?>')" class="avatar-edit">
													<?php if($this->session->userdata('id') == $po->user_id) { ?>
														<a class="button-ct" href="#user_profile" uk-toggle>  <span
															class="btn-text"><ion-icon name="camera" class="text-xl">
															</ion-icon></span></a>
													<?php } ?>
												</div>
												<div class="profile_avatar">
													<?php if(!empty($po->business_Logo)){ ?>
														<img class="profile-user-img img-responsive"
														src="<?php echo base_url('upload')?>/<?php echo $po->business_Logo;?>"
														alt="">
														<?php } else { ?>
														<img class="profile-user-img img-responsive"
														src="<?php echo base_url().$po->avatar_image?>"
														alt="">
													<?php } ?>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="profile_info">
									<h1 id="page_info"><?php echo $po->page_name;?></h1>
									<p>@<?php echo $po->user_name;?></p>
									<span id="page_id" style="display:none;"><?php echo $po->page_id?></span>
								</div>
								<div class="flex items-center space-x-4">
									
									<div class="share-btn" id="follow">
										<button class="button  button gray h-9 px-2 rounded-md gray-500  space-x-1.5 clipboard "
										data-tippy-placement="top" title="Copy Url">
											<ion-icon name="share-social-outline"></ion-icon>
											Share
										</button>
										<p id="something" class="copy_url"></p>
									</div>
									<?php
										if($po->user_id != $this->session->userdata('id')){
											if(!empty($follow)){
                                                if($follow->status == 1){ ?>
                                                <button type="button" onclick="followfunction('<?php echo $po->page_id?>')"
												class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
													<ion-icon name="thumbs-up"></ion-icon>
													<span> Unfollow </span>
												</button>
                                                <?php } else if($follow->status == 0) { ?>
                                                <button type="button" onclick="followfunction('<?php echo $po->page_id?>')" onclick=""
												class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
													<ion-icon name="thumbs-up"></ion-icon>
													<span> Follow </span>
												</button>
											<?php } } else { ?>
											<button type="button" onclick="followfunction('<?php echo $po->page_id?>')" onclick=""
											class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
												<ion-icon name="thumbs-up"></ion-icon>
												<span> Follow </span>
											</button>
										<?php } } else { ?>
										<button type="button" onclick=""
										class="flex items-center justify-center h-9 px-5 rounded-md bg-blue-600 text-white  space-x-1.5">
											<ion-icon name="thumbs-up"></ion-icon>
											<span> followers </span>
										</button>
									<?php } ?>
								</div>
								
							</div>
							
							<!--- Main Tabs -->
							<ul class="nav nav-tabs nav-tabs b-tab border-t -mb-0.5 lg:pl-2 uk-sticky uk-active bylo-nav uk-sticky-fixed" uk-sticky="offset:65">
								<li class="nav-item"><a class="nav-link nav-li active" href="#home">Home</a> </li>
								<li class="nav-item"><a class="nav-link nav-li" href="#photos">Photos</a> </li>
								<li class="nav-item"><a class="nav-link nav-li" href="#videos">Videos</a> </li>
								<li class="nav-item"><a class="nav-link nav-li" href="#reviews">Reviews</a> </li>
								
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
									aria-haspopup="true"
									aria-expanded="false">More</a>
									<div class="dropdown-menu">
										<a class="dropdown-item nav-li" href="#about">About</a>
										<a class="dropdown-item nav-li" href="#community">Community</a>
										<a class="dropdown-item nav-li" href="#blog">Blog</a>
										<!--<a class="dropdown-item nav-li" href="#jobs">Jobs</a>-->
										<!--<a class="dropdown-item" href="<//?php echo base_url()?>events">Events</a>
											<a class="dropdown-item" href="<//?php echo base_url()?>offers">Offers</a>
										<a class="dropdown-item" href="<//?php echo base_url()?>products">Products</a>-->
										
									</div>
								</li>
							</ul>
						</div>
						
						
                        <!---------user banner crop  -->
						
                        <div class="user-pr-banner">
							<div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
							aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
											aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">
											</h4>
										</div>
										<div class="modal-body">
											<div id="upload-demo" class="center-block"></div>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button onclick="page_image_id('<?= $this->session->userdata('id')?>', '<?= $po->page_id?>')" type="button" id="cropImageBtn" class="btn btn-primary">Save </button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
                        <div class="page-tab">
							<!-- Tab Content -->
							<div class="tab-content  mt-4">
								<div class="tab-pane active in" id="home">
									<!-- Timeline -->
									<div class="md:flex md:space-x-6 lg:mx-0">
										<div class="space-y-5 flex-shrink-0 md:w-7/12">
											<!-- create post  -->
											<?php echo $layout['post']; ?>
											<?php
												if(!empty($page_post_data)){
													foreach($page_post_data as $page_data) {
													?>
													<div class="card lg:mx-0 uk-animation-slide-bottom-small">
														<div class="flex justify-between items-center lg:p-4 p-2.5">
															<div class="flex flex-1 items-center space-x-4">
																<a href="#">
																	<?php if(!empty($page_data->business_Logo)) { ?>
																		<img src="<?php echo base_url('upload/').$page_data->business_Logo?>"
																		class="bg-gray-200 border border-white rounded-full w-10 h-10">
																		<?php } else { ?>
																		<img src="<?php echo base_url('').$page_data->avatar_image?>"
																		class="bg-gray-200 border border-white rounded-full w-10 h-10">
																	<?php } ?>
																</a>
																<div class="flex-1 font-semibold capitalize">
																	<a href="#" class="text-black dark:text-gray-100"> <?= $page_data->user_page_name?> </a>
																	<div class="text-gray-700 flex items-center space-x-2"> <?= time_ago($page_data->datetime);?><span> </span>
																	</div>
																	
																</div>
															</div>
															<?php
															if($page_data->user_id == $this->session->userdata('id')){ ?>
															<div>
																<a href="#">
																	<i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
																</a>
																<div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
																uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
																	
																	<ul class="space-y-1">
																		<!--<li>
																			<a href="#" uk-toggle="target: #create-post-modal" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
																				<i class="uil-share-alt mr-1"></i> Share
																			</a>
																		</li>-->

																			<li>
																				<a href="#" uk-toggle="target: #create-post-modal" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
																					<i class="uil-edit-alt mr-1"></i> Edit Post
																				</a>
																			</li>
																			<li>
																				<hr class="-mx-2 my-2 dark:border-gray-800">
																			</li>
																			<li>
																				<a href="#"
																				class="flex items-center px-3 py-2 text-red-500 hover:bg-red-100 hover:text-red-500 rounded-md dark:hover:bg-red-600">
																					<i class="uil-trash-alt mr-1"></i> Delete
																				</a>
																			</li>
																	</ul>

																</div>
															</div>
															<?php } ?>
														</div>


														<div class="pt-0 pb-3 pl-3 pr-3 py-0 border-b dark:border-gray-700">
															<span> <?= $page_data->content?></span>
														</div>
														
														<img src="<?php echo base_url('upload/').$page_data->image?>" alt="" class="max-h-96 w-full object-cover">
														<div class="p-2">
															<div class="flex">
																<div class="">
																	<div class="p-2" style="cursor:pointer;">
																		<?php
																			foreach ($page_data->post_like as $like) {
																				if($like->user_id == $this->session->userdata('id')){
																				?>
																				<img style="width:20px" onclick="unlikepost('<?= $page_data->id?>','<?= $like->id?>','<?= $page_data->user_id?>');" src="<?php echo base_url('assets/images/web_icon/unLike.svg')?>" alt=""
																				class="max-h-96 w-full object-cover">
																				<?php } else { ?>
																				<img style="width:20px" data="85" src="<?php echo base_url('assets/images/web_icon/heart01.svg')?>" onclick="likepost('<?= $page_data->id?>','<?= $page_data->user_id?>')" alt=""
																				class="max-h-96 w-full object-cover">
																			<?php } } ?>
																	</div>
																</div>
																<div class="flex" onclick="hide_comment_area('<?php echo $page_data->id?>')">
																	<div class="p-2 " style="cursor:pointer;">
																		<img style="width:20px" src="<?php echo base_url('assets/images/web_icon/comment.svg')?>">
																	</div>
																</div>
																<div class="flex">
																	<div class="p-2 " style="cursor:pointer;">
																		<img style="width:20px" src="<?php echo base_url('assets/images/web_icon/share.svg')?>">
																	</div>
																</div>
																
																<div class="flex items-center space-x-2 flex-1 justify-end">
																	<div class="dark:text-gray-100">
																		Liked <strong> Johnson</strong> and <strong> 209 Others </strong>
																	</div>
																</div>
															</div>
															<div class="bg-gray-100 relative h-20" id="newpost_<?= $page_data->id?>" style="display:none" >
																<input type="text" onkeydown="search(this, '<?= $page_data->id?>','<?= $page_data->page_name?>', '<?= $page_data->user_id?>')"  id="comment_filed_<?= $page_data->id?>" placeholder="Add your Comment.."
																class="bg-transparent max-h-10 py-3 shadow-none px-3" />
																<div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
																	<a href="#">
																		<ion-icon name="image-outline"
																		class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
																	</a>
																</div>
															</div>
															<div class="comment_area_<?php echo $page_data->id?>">
																<?php
																	if(!empty($page_data->user_comment)) {
																		foreach($page_data->user_comment as $comment) { ?>
																		<div class="comments-area">
																			<ul>
																				<li>
																					<figure><img alt="" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900" src="<?= base_url('upload').$comment->profile_image;?>"></figure>
																					<div class="commenter" style="max-width: 93%; width:100%">
																						<h5><a title="" href="#"><?= $comment->first_name .'  '. $comment->last_name?></a></h5>
																						<!--<span>2 hours ago</span>-->
																						<p> <?= $comment->comment?> </p>
																					</div>
																					<div class="flex justify-end" >
																						<div class="p-2 " style="cursor:pointer; position:relative;">
																							<img style="width:20px" onclick="hide_reply_comment_area('<?= $comment->id?>')" src="<?php echo base_url('assets/images/web_icon/share.svg')?>">
																						</div>
																					</div>
																					<div class="bg-gray-100 relative h-20" id="replypost_<?= $comment->id?>" style="display:none">
																						<input type="text" onkeydown="replycomment(this, '<?= $page_data->id?>','<?= $comment->id?>', '<?= $page_data->user_id?>')"  id="comment_filed_<?= $page_data->id?>" placeholder="Comment Reply...."
																						class="bg-transparent max-h-10 py-3 shadow-none px-3" />
																						<div class="-m-0.5 absolute bottom-0 flex items-center right-3 text-xl">
																							<a href="#">
																								<ion-icon name="image-outline"
																								class="hover:bg-gray-200 p-1.5 rounded-full"></ion-icon>
																							</a>
																						</div>
																					</div>
																					<ul class="sub-ul">
																						<?php
																							if(!empty($comment->post_child_comment)){
																								foreach($comment->post_child_comment as $child_comment){ ?>
																								<li class="sub_li">
																									<figure>
																										<img alt="" src="<?= base_url('upload').$child_comment->profile_image?>" class="w-6 h-6 rounded-full border-2 border-white dark:border-gray-900">
																									</figure>
																									<div class="commenter">
																										<h5><a title="" href="#"><?= $child_comment->first_name .' '. $child_comment->last_name?></a></h5>
																										<!--<span>2 hours ago</span>-->
																										<p><?= $child_comment->comment?></p>
																									</div>
																									<!--<a title="Like" href="#"><i class="icofont-heart"></i></a>
																									<a title="Reply" href="#" class="reply-coment"><i class="icofont-reply"></i></a>-->
																								</li>
																							<?php } } ?>
																					</ul>
																				</li>
																			</ul>
																		</div>
																	<?php } } ?>
															</div>
														</div>
														
													</div>
													<div class="page_post_id" id="<?php echo $page_data->id?>">
													</div>
												<?php } }?>
										</div>
										<div class="w-full flex-shirink-0">
											<!----  page About sidebar --->
											<div class="card p-5 mb-4">
												<h1 class="block text-lg font-bold"> About </h1>
												
												<div class="space-y-4 mt-3 pl-2">
													<div class="flex items-center space-x-3">
														<ion-icon name="thumbs-up"
														class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
														<div class="flex-1">
															<div class="font-semibold"><?= $po->page_name;?></div>
														</div>
													</div>
													<!--<div class="flex items-center space-x-3">
														<ion-icon name="alert-circle"
														class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
														<div class="flex-1">
														<div> We Plan ,We Desing, We Estimate for Approval to Build..</div>
														</div>
													</div>-->
													<?php if(!empty($po->website_link)) { ?>
														<div class="flex items-center space-x-3">
															<ion-icon name="globe"
															class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
															<div class="flex-1">
																<div><a href="<?= $po->website_link?>" class="text-blue-500"><?= $po->
																website_link?></a></div>
															</div>
														</div>
													<?php } ?>
													
													<?php if(!empty($po->business_email)) { ?>
														<div class="flex items-center space-x-3">
															<ion-icon name="mail-open"
															class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
															<div class="flex-1">
																<div><?= $po->business_email?>
																</div>
															</div>
														</div>
													<?php } ?>
													<div class="flex items-center space-x-3">
														<ion-icon name="albums"
														class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
														<div class="flex-1">
															<div><?= $po->category;?></div>
														</div>
													</div>
													<?php if(!empty($po->page_description)) { ?>
														<div class="flex items-center space-x-3">
															<ion-icon name="albums"
															class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
															<div class="flex-1">
																<div><?= $po->page_description?>
																</div>
															</div>
														</div>
													<?php } ?>
												</div>
											</div>
											<!----  page phots sidebar --->
											<div class="" uk-sticky="offset:80">
												<div class="widget card p-5 mt-2 mb-4 border-t">
													<div class="flex items-center justify-between mb-4">
														<div>
															<h4 class="text-lg font-semibold"> Photos </h4>
														</div>
														<ul class="nav nav-tabs">
															<li>
																<a href="#photos" class="text-blue-600 ">See all Photos</a>
															</li>
														</ul>
														
													</div>
													<div class="grid grid-cols-3 gap-3 text-gray-600 font-semibold">
														<?php if(!empty($photos_grid)){
															foreach($photos_grid as $photo) { ?>
															<a href="<?php echo base_url()?><?= $po->user_name?>/photos/<?= $photo->photos_id?>">
																<div class="avatar relative rounded-md overflow-hidden w-full h-24 mb-2">
																	<img src="<?php echo base_url('upload')?><?= $photo->image_address?>"
																	alt="" class="w-full h-full object-cover absolute">
																</div>
															</a>
														<?php } } ?>
													</div>
												</div>
												<!----  page Review sidebar --->
												<?php if(!empty($this->session->userdata('id'))) { ?>
												<div class="widget card p-5 border-t">
													<div class="flex items-center justify-between mb-2">
														<div>
															<h4 class="text-lg font-semibold"> Review </h4>
														</div>
														<ul class="nav nav-tabs">
															<li>
																<a class="text-blue-600 " href="#reviews">See all Review</a>
															</li>
														</ul>
													</div>
													<div>

														<div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
															<a href="#review-modal-page" uk-toggle
															class="flex items-center justify-center h-8 px-3 rounded-md text-sm border font-semibold bg-blue-500 text-white">
																Write a Review
															</a>
														</div>

													</div>
												</div>
												<?php } ?>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tab-pane fade" id="photos">
									<!-- Photos  -->
									<div class="card md:p-6 mx-auto">
										
										<div class="flex justify-between items-start relative md:mb-4 mb-3">
											<div class="flex-1">
												<div class="row">
													<div class="col-lg-6">
														<h2 class="text-xl font-bold"> Photos </h2>
													</div>
													<?php
														if($po->user_id == $this->session->userdata('id')) {
														?>
														<div class="col-lg-6">
															<div onclick="page_image_id('<?= $po->page_id?>', 'page_id')"
															class="right-ct">
																<a href="#add-image-modal" uk-toggle
																class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
																title="Add Photos" data="">
																	<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
																	xmlns="http://www.w3.org/2000/svg">
																		<path fill-rule="evenodd"
																		d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
																		clip-rule="evenodd"></path>
																	</svg>
																</a>
															</div>
														</div>
													<?php }?>
												</div>
												<!--<nav class="responsive-nav border-b extanded mb-2 -mt-2 sidechat_tabs">
													<ul uk-switcher="connect: #chats-tab; animation: uk-animation-fade">
													<li><a class="active" href="#0"> Photos of you </a></li>
													<li><a href="#0">Recently added </a></li>
													<li><a href="#0">Family </a></li>
													<li><a href="#0">University </a></li>
													<li><a href="#0">Albums </a></li>
													</ul>
												</nav>-->
												
												<div class="contact-list px-2 uk-switcher" id="chats-tab">
													
													<div class="p-1">
														
														<div class="grid md:grid-cols-4 sm:grid-cols-3 grid-cols-2 gap-3 mt-4">
															<?php
																if(!empty($photos)){
																	foreach($photos as $phot) {
																	?>
																	<div>
																		<div class="bg-gray-200 max-w-full lg:h-44 h-36 rounded-lg relative  shadow uk-transition-toggle">
																			<?php if(!empty($phot->image_address)) { ?>
																				<a href="<?php echo base_url()?><?= $po->user_name?>/photos/<?= $phot->photos_id?>">
																					<img class="w-full h-full absolute object-cover inset-0"
																					src="<?php echo base_url('upload');?><?php echo $phot->image_address?>">
																				</a>
																			<?php }?>
																			<!-- overly-->
																			<?php
																				if($po->user_id == $this->session->userdata('id')) {
																				?>
																				<div class="top-2 right-2 absolute">
																					<button class="del-btn-photo" type="button"><span
																					class="icon-feather-edit"></span></button>
																				</div>
																				<!------ edit photo model ---->
																				<div class="uk-width-small photo-edit" uk-drop="mode: click">
																					<div class="card p-3">
																						<div class="uk-drop-grid" uk-grid>
																							<button id="education_<?php echo $phot->id?>"
																							value="tr02_photos_data"
																							onclick="deletedata('<?php echo $phot->id?>')"
																							type="button">
																								Remove
																							</button>
																							
																						</div>
																					</div>
																				</div>
																			<?php } ?>
																			
																		</div>
																	</div>
																<?php } }?>
														</div>
													</div>
													
												</div>
												
											</div>
											
										</div>
										
									</div>
								</div>
								
								<div class="tab-pane fade" id="videos">
									<!-- Videos -->
									<div class="card md:p-6 mx-auto">
										<div class="row">
											<div class="col-lg-6">
												<h2 class="text-xl font-bold"> Videos </h2>
											</div>
											<?php
												if($po->user_id == $this->session->userdata('id')){
												?>
												<div class="col-lg-6">
													<div class="right-ct">
														<a onclick="page_video_id('<?= $po->page_id?>', 'page_id')"
														href="#add-video-modal" uk-toggle
														class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
														title="Add Photos">
															<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
															xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd"
																d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
																clip-rule="evenodd"></path>
															</svg>
														</a>
													</div>
												</div>
											<?php } ?>
										</div>
										<!--<nav class="responsive-nav border-b extanded mb-2 -mt-2 sidechat_tabs">
											<ul uk-switcher="connect: #friend-tab; animation: uk-animation-fade">
											<li><a href="#0">My Videos </a></li>
											</ul>
										</nav>-->
										<div>
											
											<div class="p-1">
												
												<div class="grid md:grid-cols-3 grid-cols-2  gap-x-2 gap-y-4 mt-3">
													<?php
														if(!empty($video)){
															foreach($video as $vid){
															?>
															<div class="relative">
																<a href="<?php echo base_url()?>video_watch/<?php echo $vid->Video_id?>"
																class="w-full h-36  rounded-lg relative block">
																	<video class="w-full h-full absolute inset-0 object-cover">
																		<source src="<?php echo base_url('video_upload')?><?php echo $vid->video_address?>">
																	</video>
																	<span class="absolute bg-black bg-opacity-60 bottom-1 font-semibold px-1.5 py-0.5 right-1 rounded text-white text-xs"> 12:21</span>
																	<img src="<?php echo base_url();?>assets/images/icon-play.svg"
																	class="w-12 h-12 uk-position-center" alt="">
																</a>
																<?php
																	if($po->user_id == $this->session->userdata('id')) {
																	?>
																	<div class="top-2 right-2 absolute">
																		<button class="del-btn-photo" type="button"><span
																		class="icon-feather-edit"></span></button>
																	</div>
																	<!------ edit video model ---->
																	<div class="uk-width-small photo-edit" uk-drop="mode: click">
																		<div class="card p-3">
																			<div class="uk-drop-grid" uk-grid>
																				<button type="button">
																					Remove
																				</button>
																				
																			</div>
																		</div>
																	</div>
																<?php }?>
															</div>
														<?php } } ?>
														<!--<div class="flex justify-center mt-6">
															<a href="#"
															class="bg-white font-semibold my-3 px-6 py-2 rounded-full shadow-md dark:bg-gray-800 dark:text-white">
															</a>
														</div>-->
														
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tab-pane fade" id="reviews">
									<!-- Reviews  -->
									<div class="card md:p-6 max-w-3xl mx-auto">
										<div class="flex justify-between items-start relative md:mb-4 mb-3">
											<div class="flex-1">
												<div class="review-page">
													<!-- page Reviews -->
													
													<h3 class="mb-8 mt-20 font-semibold text-2xl"> Reviews (<?php foreach ($page_review_count as $count){ echo "$count->review"; } ?>) </h3>
													
													<?php if(!empty($review_total)){ ?>
														<div class="flex space-x-5 my-8" id="reviews">
															<div class="lg:w-1/4 w-full">
																<div class="bg-blue-100 p-4 rounded-md border border-blue-200 text-center shadow-xs">
																	<h1 class="leading-none text-3xl">
																		<?php
																			$avarge =  $review_total->rating/$review_total->no_of_user;
																		print_r(number_format(floor($avarge*100)/100,2, '.', ''));?>
																	</h1>
																	<div class="flex justify-center">
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5 text-gray-400">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																	</div>
																	<h5 class="text-base mb-0 mt-1 text-gray-800"> Page Rating</h5>
																</div>
															</div>
															
															<div class="w-2/4 hidden lg:flex flex-col justify-center">
																
																<div class="space-y-4">
																	<?php
																		foreach($review_result as $result){
																			$rating = $result->no_of_user/$review_total->no_of_user*100;
																		?>
																		<div class="w-full h-3 rounded-lg bg-gray-300 shadow-xs relative">
																			<div class="w-<?php echo $rating?> h-3 rounded-lg bg-gray-800"
																			style="'<?php echo $rating?>'%"></div>
																		</div>
																	<?php } ?>
																</div>
																
															</div>
															
															<div class="w-1/4 hidden lg:flex flex-col justify-center">
																
																<div class="space-y-1">
																	<?php
																		foreach($review_result as $result){ ?>
																		<div class="flex">
																			<span class="ml-2"></span>
																			<?php for($i=0; $i<$result->star; $i++){ ?>
																				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																				fill="currentColor" class="w-5 h-5 text-orange-400">
																					<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																				</svg>
																			<?php } ?>
																			<span class="ml-2">
																				<?php
																					$rating = $result->no_of_user/$review_total->no_of_user*100;
																				print_r(intval(number_format(floor($rating*100)/100,2, '.', '')));?> % </span>
																		</div>
																	<?php } ?>
																</div>
																
															</div>
															
															
														</div>
													<?php } ?>
													
													<?php
														foreach($page_review as $review) {
														?>
														<div class="flex gap-x-4 mb-5 relative">
															<img src="<?php echo base_url('upload');?><?= $review->profile_image?>"
															alt=""
															class="rounded-full shadow w-12 h-12">
															<div>
																<h4 class="text-base m-0"> <?= $review->first_name .' '.
																$review->last_name?></h4>
																<!--<span class="text-gray-700 text-sm"> Student </span>-->
																<p class="mt-3">
																	<?= $review->comment?>
																</p>
																<div class="flex justify-center items-center absolute right-0 top-0">
																	<?php
																		for ($i=0; $i <$review->rating; $i++){
																		?>
																		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
																		fill="currentColor" class="w-5 h-5 text-orange-400">
																			<path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
																		</svg>
																	<?php }?>
																</div>
																
															</div>
														</div>
													<?php }?>
												</div>
											</div>
											
										</div>
									</div>
								</div>
								
								
								<!----- Community tab  ---->
								<div class="tab-pane fade" id="community">
									<div class="card md:p-6 max-w-3xl mx-auto community-cl">
										<h2 class="text-xl font-semibold">Community</h2>
										<div class="like-follow">
											<p><i class="icon-feather-plus-square"> </i> <span> 2220 total follows </span></p>
										</div>
									</div>
								</div>
								<!----- job tab  ---->
								<div class="tab-pane fade" id="jobs">
									<div class="card md:p-6 max-w-1xl mx-auto jobs-cl">
										<div id="job_content">
											<div class=" md:mb-4 mb-3">
												<div class="row">
													<div class="col-lg-6">
														<h2 class="text-2xl font-semibold"> Jobs </h2>
													</div>
													<?php if($this->session->userdata('id') == $po->user_id){ ?>
														<div class="col-lg-6">
															<div class="right-ct">
																<div class="add-job">
																	<button class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
																	id="show_job_add_btn" href="#">
																		<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
																		xmlns="http://www.w3.org/2000/svg">
																			<path fill-rule="evenodd"
																			d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
																			clip-rule="evenodd"></path>
																		</svg>
																	</button>
																</div>
															</div>
														</div>
													<?php } ?>
												</div>
											</div>
											
											<!--- job list --->
											<div class="jobs-list">
												<nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
													<ul uk-switcher="connect: #jobs-list-tab; animation: uk-animation-fade">
														<li class="uk-active"><a class="active" href="#0"> Jobs </a></li>
														<?php if($this->session->userdata('id') == $po->user_id){ ?>
															<li><a href="#0"> Candidates </a></li>
														<?php } ?>
													</ul>
												</nav>
												<div class=" px-2 uk-switcher" id="jobs-list-tab">
													<!------- job tab  ---->
													<div class="p-1">
														<div class="job-inner-tab">
															<nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
																<ul uk-switcher="connect: #job-status-tab; animation: uk-animation-fade">
																	<li class="uk-active"><a class="active" href="#0"> Open and
																		paused
																	jobs <span> </a></li>
																	<?php if($this->session->userdata('id') == $po->user_id){ ?>
																		<li><a href="#0">Close</a></li>
																	<?php }?>
																	</ul>
																</nav>
																<div class=" uk-switcher" id="job-status-tab">
																	<div class="p-1">
																		<div class="table-responsive">
																			<table class="table">
																				<?php
																					foreach ($open_job_posting as $jobs) {
																						if($jobs->job_status == 1){
																						?>
																						<tbody>
																							<tr>
																								<td class="table_data">
																									<table class="table">
																										<tbody>
																											<tr>
																												<td>
																													<div class="checkbox">
																														<label class="p-0">
																															<p class="data_listing m-0">
																																<a href="<?php echo base_url('jobs/').str_replace(' ', '-', $jobs->city).'/'.str_replace(' ', '-', $jobs->job_title).'/'.$jobs->create_job_id?>"
																																class="title_text text-info"><?= $jobs->
																																job_title?></a>
																																<span><?= $jobs->address  .','. $jobs->city .','. $jobs->state .','. $jobs->country .'-'. $jobs->pin_code?></span>
																																<span>Created: <?php echo $newdate = date("l, d M Y", strtotime($jobs->
																																date));?></span>
																															</p>
																														</label>
																													</div>
																												</td>
																												<td>
																													<div class="btn_badge">
																														<p class="data_listing">
																															<span>3</span>
																															<span class="">Applied Person</span>
																														</p>
																														<p class="data_listing">
																															<span>0</span>
																															<span class="">Hired</span>
																														</p>
																														<p class="data_listing">
																															<span>0</span>
																															<span class="">Rejected Person</span>
																														</p>
																													</div>
																												</td>
																												<td>
																													<p class="data_listing">
																														<span class="text-info">
																															<b class="text-dark">Job Status: </b><?php if ($jobs->
																															status == 1){ echo "Open";}?></span>
																													</p>
																												</td>
																												<td>
																													<select id="status"
																													onchange="status_change(32)"
																													class="form-control status-job table_control mb-0">
																														<option selected="" value="1">
																															Open
																														</option>
																														<option value="2"> Pending
																														</option>
																														<option value="0"> Close
																														</option>
																													</select>
																												</td>
																												<td>
																													<button class="button mr-btn"
																													type="button"><span
																														class="icon-feather-more-horizontal">
																														</span>
																													</button>
																													<div class="" uk-drop="mode: click">
																														<div class="card p-5">
																															<div class="uk-drop-grid"
																															uk-grid>
																																<div>
																																	<ul class="right_menu">
																																		<li>
																																			<span href="#"
																																			id="show_job_edit_btn">Edit
																																			job</span>
																																		</li>
																																		<li>
																																			<a href="#modal-overflow"
																																			uk-toggle>View
																																				job
																																			details</a>
																																			
																																			<!---- view job model popup ---->
																																			<div id="modal-overflow"
																																			uk-modal>
																																				<div class="uk-modal-dialog">
																																					
																																					<button class="uk-modal-close-default m-3"
																																					type="button"
																																					uk-close></button>
																																					
																																					<div class="uk-modal-header">
																																						<h4 class="uk-modal-title">
																																							Web
																																						Designer</h4>
																																					</div>
																																					
																																					<div class="uk-modal-body"
																																					uk-overflow-auto>
																																						<div class="job-view-body">
																																							<div class="card">
																																								<div class="h-44 md:h-60 overflow-hidden relative rounded-t-lg w-full">
																																									<img src="<?php echo base_url()?>assets/images/blog/img-5.jpg"
																																									alt=""
																																									class="w-full h-full absolute inset-0 object-cover">
																																								</div>
																																								
																																								<div class="p-4 pt-0 divide-y divide-gray-100">
																																									
																																									<div class="md:py-8 py-3">
																																										<div class="row">
																																											<div class="col-lg-12 m-0">
																																												<h2 class="text-2xl font-bold">
																																													Web
																																												developer </h2>
																																												<p class="font-medium mt-1 text-base">
																																													Front
																																													end
																																												developer </p>
																																											</div>
																																											
																																										</div>
																																									</div>
																																									
																																									<div class="md:py-8 py-3">
																																										<h1 class="block text-xl font-bold mb-9">
																																											Job
																																										details </h1>
																																										<div class="md:">
																																											<div class="md:w-3/3 space-y-4 -mt-2">
																																												<div class="flex items-center space-x-3">
																																													<ion-icon
																																													name="mail-open"
																																													class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
																																													<div class="flex-1">
																																														<div>
																																															Full-time,
																																															Contractual
																																															/
																																															Temporary
																																														</div>
																																													</div>
																																												</div>
																																												<div class="flex items-center space-x-3">
																																													<ion-icon
																																													"
																																													class="bg-gray-100
																																													p-1.5
																																													rounded-full
																																													icon-material-outline-room"></ion-icon>
																																													<div class="flex-1">
																																														<div>
																																															501,
																																															Scheme
																																															No
																																															55,
																																															NRK
																																															Bizpark,
																																															Scheme
																																															54
																																															PU4,
																																															Indore,
																																															Madhya
																																															Pradesh
																																															452010
																																														</div>
																																													</div>
																																												</div>
																																												<div class="flex items-center space-x-3">
																																													<ion-icon
																																													name="mail-open"
																																													class="bg-gray-100 p-1.5 rounded-full  "></ion-icon>
																																													<div class="flex-1">
																																														<div>
																																															Posted
																																															21
																																															hours
																																															ago
																																														</div>
																																													</div>
																																												</div>
																																												<div class="flex items-center space-x-3">
																																													<ion-icon
																																													class="bg-gray-100 p-1.5 rounded-full text-xl icon-feather-phone"></ion-icon>
																																													<div class="flex-1">
																																														<div>
																																															<a href="#"
																																															class="text-blue-500">
																																															9617145789 </a>
																																														</div>
																																													</div>
																																												</div>
																																												<div class="flex items-center space-x-3">
																																													<ion-icon
																																													name="albums"
																																													class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
																																													<div class="flex-1">
																																														<div>
																																															Graduate
																																														</div>
																																													</div>
																																												</div>
																																												
																																											</div>
																																											
																																											<div class="space-y-4 mt-6 text-sm font-medium">
																																												<div>
																																													<div class="font-semibold mb-2">
																																														Schedule
																																													</div>
																																													<div class="text-gray-400">
																																														Morning
																																														shift
																																													</div>
																																												</div>
																																												<div>
																																													<div class="font-semibold mb-2">
																																														Job
																																														Location
																																													</div>
																																													<div class="text-gray-400">
																																														Indore
																																													</div>
																																												</div>
																																												<div>
																																													<div class="font-semibold mb-2">
																																														Supplemental
																																														Pay:
																																													</div>
																																													<div class="text-gray-400">
																																														Performance
																																														bonus
																																													</div>
																																												</div>
																																												<div>
																																													<div class="font-semibold mb-2">
																																														COVID-19
																																														considerations
																																													</div>
																																													<div class="text-gray-400">
																																														Complete
																																														Vaccination
																																														certificate
																																														required
																																													</div>
																																												</div>
																																												<div>
																																													<div class="font-semibold mb-2">
																																														Start
																																														Date
																																													</div>
																																													<div class="text-gray-400">
																																														1/2/2022
																																													</div>
																																												</div>
																																												<div>
																																													<div class="font-semibold mb-2">
																																														End
																																														date
																																													</div>
																																													<div class="text-gray-400">
																																														15/2/2022
																																													</div>
																																												</div>
																																											</div>
																																										</div>
																																									</div>
																																									
																																									<div class="md:py-8 py-3">
																																										<h1 class="block text-2xl font-bold mb-6">
																																											Job
																																										Description </h1>
																																										<div class="space-y-3">
																																											<p>
																																												Lorem
																																												ipsum
																																												dolor
																																												sit
																																												amet,
																																												consectetuer
																																												adipiscing
																																												elit,
																																												sed
																																												diam
																																												nonummy
																																												nibh
																																												euismod
																																												tincidunt
																																												ut
																																												laoreet
																																												dolore
																																												magna
																																												aliquam
																																												erat
																																												volutpat.
																																												Ut
																																												wisi
																																												enim
																																												ad
																																												minim
																																												veniam,
																																												quis
																																												nostrud
																																												exerci
																																												tation
																																												ullamcorper
																																												suscipit
																																												lobortis
																																												nisl
																																												ut
																																												aliquip
																																												ex
																																												ea
																																												commodo
																																												consequat.
																																											</p>
																																											<p>
																																												Lorem
																																												ipsum
																																												dolor
																																												sit
																																												amet,
																																												consectetuer
																																												adipiscing
																																												elit,
																																												sed
																																												diam
																																												nonummy
																																												nibh
																																												euismod
																																												tincidunt
																																												ut
																																												laoreet
																																												dolore
																																												magna
																																												aliquam
																																												erat
																																												volutpat.
																																												Ut
																																												wisi
																																												enim
																																												ad
																																												minim
																																												veniam,
																																												quis
																																												nostrud
																																												exerci
																																												tation
																																												ullamcorper
																																												suscipit
																																												lobortis
																																												nisl
																																												ut
																																												aliquip
																																												ex
																																												ea
																																												commodo
																																												consequat.
																																											</p>
																																											<p>
																																												Lorem
																																												ipsum
																																												dolor
																																												sit
																																												amet,
																																												consectetuer
																																												adipiscing
																																												elit,
																																												sed
																																												diam
																																												nonummy
																																												nibh
																																												euismod
																																												tincidunt
																																												ut
																																												laoreet
																																												dolore
																																												magna
																																												aliquam
																																												erat
																																												volutpat.
																																												Ut
																																												wisi
																																												enim
																																												ad
																																												minim
																																												veniam,
																																												quis
																																												nostrud
																																												exerci
																																												tation
																																												ullamcorper
																																												suscipit
																																												lobortis
																																												nisl
																																												ut
																																												aliquip
																																												ex
																																												ea
																																												commodo
																																												consequat.
																																												Nam
																																												liber
																																												tempor
																																												cum
																																												soluta
																																												nobis
																																												eleifend
																																												option
																																												congue
																																												nihil
																																												imperdiet
																																												doming
																																												id
																																												quod
																																												mazim
																																												placerat
																																												facer
																																												possim
																																												assum.
																																												Lorem
																																												ipsum
																																												dolor
																																												sit
																																												amet,
																																												consectetuer
																																												adipiscing
																																												elit,
																																											</p>
																																											<p>
																																												Consectetuer
																																												adipiscing
																																												elit,
																																												sed
																																												diam
																																												nonummy
																																												nibh
																																												euismod
																																												tincidunt
																																												ut
																																												laoreet
																																												dolore
																																												magna
																																												aliquam
																																												erat
																																												volutpat.
																																												Ut
																																												wisi
																																												enim
																																												ad
																																												minim
																																												veniam,
																																												quis
																																												nostrud
																																												exerci
																																												tation
																																												ullamcorper
																																												suscipit
																																												lobortis
																																												nisl
																																												ut
																																												aliquip
																																												ex
																																												ea
																																												commodo
																																												consequat.
																																											</p>
																																										</div>
																																									</div>
																																									
																																								</div>
																																								
																																							</div>
																																						</div>
																																					</div>
																																					<div class="uk-modal-footer text-right">
																																						<button class="button gray uk-modal-close"
																																						type="button">
																																							Cancel
																																						</button>
																																					</div>
																																					
																																				</div>
																																			</div>
																																			
																																			<!---- view job model popup end ---->
																																		</li>
																																	</ul>
																																</div>
																															</div>
																														</div>
																													</div>
																												</td>
																											</tr>
																										</tbody>
																									</table>
																								</td>
																							</tr>
																							
																						</tbody>
																					<?php } } ?>
																			</table>
																		</div>
																	</div>
																	
																	<!---Status 0 means Jobs are Close--->
																	
																	<div class="p-1">
																		<div class="table-responsive">
																			<table class="table">
																				<?php
																					foreach ($open_job_posting as $close_jobs) {
																						if($close_jobs->job_status == 0) {
																						?>
																						<tbody>
																							<tr>
																								<td class="table_data">
																									<table class="table">
																										<tbody>
																											<tr>
																												<td>
																													<div class="checkbox">
																														<label class="p-0">
																															<p class="data_listing m-0">
																																<a href="<?php echo base_url('jobs/').str_replace(' ', '-', $close_jobs->city).'/'.str_replace(' ', '-', $close_jobs->job_title).'/'.$close_jobs->create_job_id?>"
																																class="title_text text-info"><?= $close_jobs->
																																job_title?></a>
																																<span><?= $close_jobs->
																																address  .', '.  $close_jobs->city .', '.  $close_jobs->state   .', '.  $close_jobs->country .' - '.  $close_jobs->pin_code?></span>
																																<span>Created: <?php echo $newdate = date("l, d M Y", strtotime($close_jobs->
																																date));?></span>
																															</p>
																														</label>
																													</div>
																												</td>
																												<td>
																													<div class="btn_badge">
																														<p class="data_listing">
																															<span>3</span>
																															<span class="">Applied Person</span>
																														</p>
																														<p class="data_listing">
																															<span>0</span>
																															<span class="">Hired</span>
																														</p>
																														<p class="data_listing">
																															<span>0</span>
																															<span class="">Rejected Person</span>
																														</p>
																													</div>
																												</td>
																												<td>
																													<p class="data_listing">
																														<span class="text-info">
																															<b class="text-dark">Job Status: </b>
																														Close</span>
																													</p>
																												</td>
																											</tr>
																										</tbody>
																									</table>
																								</td>
																							</tr>
																						</tbody>
																					<?php } } ?>
																			</table>
																		</div>
																	</div>
																	
																</div>
															</div>
														</div>
														<!------- candidates tab  ---->
														<div class="p-1">
															<nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
																<ul uk-switcher="connect: #candidates-tab; animation: uk-animation-fade">
																	<li class="uk-active"><a class="active" href="#0">Applied Jobs<span></a>
																	</li>
																	<li><a href="#1">Hired Jobs </a></li>
																	<li><a href="#2">Reject Jobs</a></li>
																	</ul>
																</nav>
																<div class=" px-2 uk-switcher" id="candidates-tab">
																	<!------- job tab  ---->
																	<div class="p-1">
																		<div class="table-responsive candidate-table">
																			<table class="table">
																				<thead>
																					<tr>
																						<th scope="col">Candidate</th>
																						<th scope="col">Applied Role</th>
																						<th scope="col">Action</th>
																					</tr>
																				</thead>
																				<?php if(!empty($apply_job)) {
																					foreach($apply_job as $job_apply) {
																						if($job_apply->status == 1) {
																						?>
																						<tbody>
																							<tr>
																								<td scope="row">
																									<div class="checkbox">
																										<label class="p-0">
																											<p class="data_listing m-0">
																												<a href="<?php echo base_url()?><?= $job_apply->user_code?>"
																												class="title_text text-info"><?= $job_apply->
																													first_name .' '.
																												$job_apply->last_name?></a>
																												<span>Applied on <?= date("l d F Y", strtotime($job_apply->
																												datetime)); ?></span>
																												<span>Awaiting Status: &nbsp; <span
																													style="color: green;font-weight:800;"><?php if ($job_apply->
																													status == 1) {echo "Applied"; }?></span></span>
																											</p>
																										</label>
																									</div>
																								</td>
																								
																								<td>
																									<p class="data_listing"><span
																										class="text-info"> <?= $job_apply->
																										job_title?> </span></p>
																								</td>
																								<td>
																									<button class="button mr-btn" type="button">
																										<span class="icon-feather-more-horizontal">
																										</span>
																									</button>
																									<div class="" uk-drop="mode: click">
																										<div class="card p-5">
																											<div class="uk-drop-grid" uk-grid>
																												<div>
																													<ul class="right_menu">
																														<li><a href="#">Edit job</a>
																														</li>
																														<li><a href="#">View job
																														details</a></li>
																														<li><a href="#">View public job
																														page</a></li>
																													</ul>
																												</div>
																											</div>
																										</div>
																									</div>
																								</td>
																							</tr>
																						</tbody>
																					<?php } } } ?>
																			</table>
																		</div>
																	</div>
																	<div class="p-1">
																		<div class="table-responsive candidate-table">
																			<table class="table">
																				<thead>
																					<tr>
																						<th scope="col">Candidate</th>
																						<th scope="col">Applied Role</th>
																						<th scope="col">Action</th>
																					</tr>
																				</thead>
																				<?php if($apply_job) {
																					foreach($apply_job as $job_apply) {
																						if($job_apply->status == 2) {
																						?>
																						<tbody>
																							<tr>
																								<td scope="row">
																									<div class="checkbox">
																										<label class="p-0">
																											<p class="data_listing m-0">
																												<a href="<?php echo base_url()?><?= $job_apply->user_code?>"
																												class="title_text text-info"><?= $job_apply->
																													first_name .' '.
																												$job_apply->last_name?></a>
																												<span>Applied on <?= date("l d F Y", strtotime($job_apply->
																												datetime)); ?></span>
																												<span>Awaiting Status: &nbsp; <span
																													style="color: green;font-weight:800;"><?php if ($job_apply->
																													status == 2) {echo "Hired"; }?></span></span>
																											</p>
																										</label>
																									</div>
																								</td>
																								
																								<td>
																									<p class="data_listing"><span
																										class="text-info"> <?= $job_apply->
																										job_title?> </span></p>
																								</td>
																								<td>
																									<button class="button mr-btn" type="button">
																										<span class="icon-feather-more-horizontal">
																										</span>
																									</button>
																									<div class="" uk-drop="mode: click">
																										<div class="card p-5">
																											<div class="uk-drop-grid" uk-grid>
																												<div>
																													<ul class="right_menu">
																														<li>
																															<a href="#">Edit job</a>
																														</li>
																														<!--li>
																															<a href="#">Post job in multiple locations</a>
																															</li>
																															<li>
																															<a href="#">Sponsor your job</a>
																														</li-->
																														<li>
																															<a href="#">View job
																															details</a>
																														</li>
																														<li>
																															<a href="#">View public job
																															page</a>
																														</li>
																													</ul>
																												</div>
																											</div>
																										</div>
																									</div>
																								</td>
																							</tr>
																						</tbody>
																					<?php } } }?>
																			</table>
																		</div>
																	</div>
																	<div class="p-1">
																		<div class="table-responsive candidate-table">
																			<table class="table">
																				<thead>
																					<tr>
																						<th scope="col">Candidate</th>
																						<th scope="col">Applied Role</th>
																						<th scope="col">Action</th>
																					</tr>
																				</thead>
																				<?php if($apply_job) {
																					foreach($apply_job as $job_apply) {
																						if($job_apply->status == 0) {
																						?>
																						<tbody>
																							<tr>
																								<td scope="row">
																									<div class="checkbox">
																										<label class="p-0">
																											<p class="data_listing m-0">
																												<a href="<?php echo base_url()?><?= $job_apply->user_code?>"
																												class="title_text text-info"><?= $job_apply->
																													first_name .' '.
																												$job_apply->last_name?></a>
																												<span>Applied on <?= date("l d F Y", strtotime($job_apply->
																												datetime)); ?></span>
																												<span>Awaiting Status: &nbsp; <span
																													style="color: green;font-weight:800;"><?php if ($job_apply->
																													status == 0) {echo "Reject"; }?></span></span>
																											</p>
																										</label>
																									</div>
																								</td>
																								
																								<td>
																									<p class="data_listing"><span
																										class="text-info"> <?= $job_apply->
																										job_title?> </span></p>
																								</td>
																								<td>
																									<button class="button mr-btn" type="button"><span
																										class="icon-feather-more-horizontal">
																											
																										</span>
																									</button>
																									<div class="" uk-drop="mode: click">
																										<div class="card p-5">
																											<div class="uk-drop-grid" uk-grid>
																												<div>
																													<ul class="right_menu">
																														<li>
																															<a href="#"
																															id="show_job_edit_btn">Edit
																															job</a>
																														</li>
																														<!--li>
																															<a href="#">Post job in multiple locations</a>
																															</li>
																															<li>
																															<a href="#">Sponsor your job</a>
																														</li-->
																														<li>
																															<a href="#">View job
																															details</a>
																														</li>
																														<li>
																															<a href="#">View public job
																															page</a>
																														</li>
																													</ul>
																												</div>
																											</div>
																										</div>
																									</div>
																								</td>
																							</tr>
																						</tbody>
																					<?php } } }?>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!---  add job form ---->
												<div id="show_job_form" style="display:none;">
													<div class="job-step-container">
														<div class="row">
															<div class="col-lg-6">
																<h4 class="text-2xl font-semibold">Add Jobs </h4>
															</div>
															<div class="col-lg-6">
																<div class="right-ct">
																	<button class="button" id="show_job_back_btn" href="#">Back</button>
																</div>
															</div>
														</div>
														<form action="<?php echo base_url()?>/JobCntrl/insert_job" mathod="post"
														id="create_job" name="create_job">
															<div class="row">
																<!--<div class="col-md-6">
																	<div class="form-group ">
																	<label>Select Page</label>
																	<div class="form-group">
																	<select id="select-bs-page" Name="page_id">
																	<option value="">Select Page</option>
																	<?php
																		if(!empty($user_page)){
																			foreach($user_page as $page){
																			?>
																			<option value="<?= $page->id;?>"><?= $page->page_name;?></option>
																		<?php } }?>
																		</select>
																		</div>
																		</div>
																</div>-->
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Job Title *</label>
																		<input class="form-control" type="text" name="job_title"
																		placeholder="Job Title">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Company name for this job *</label>
																		<input class="form-control" type="text" name="company_name"
																		placeholder="Company name">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Your role in this hiring process</label>
																		<div class="form-group">
																			<select name="job_role" class="select-role form-control">
																				<option value="1">Option 1</option>
																				<option value="2">Option 2</option>
																				<option value="3">Option 3</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>What Category does this job fall under? *</label>
																		<div class="form-group">
																			<select name="job_category" class="select-role form-control">
																				<option value="1">Front End Developers</option>
																				<option value="2">Healthcare</option>
																				<option value="3">Back End Developers</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Where will in employee report to work? *</label>
																		<div class="form-group">
																			<select class="select-role form-control" name="report_location">
																				<option value="1">Employees report to a specific location
																				</option>
																				<option value="2">Employees will not report to a specific
																					location
																				</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Education</label>
																		<input class="form-control" type="text" name="education"
																		placeholder="Education">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Address</label>
																		<input class="form-control" type="text" name="address"
																		placeholder="Address">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Country </label>
																		<div class="form-group">
																			<select id="get_country" class="select-role form-control"
																			name="country">
																				<option value="">Select your country name</option>
																				<?php
																					if(!empty($country)) {
																						foreach($country as $cou) {
																						?>
																						<option value="<?= $cou->id?>"><?= $cou->name?></option>
																					<?php } }?>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>State </label>
																		<div class="form-group">
																			<select class="select-role form-control" name="state"
																			id="state">
																				<option value="">Select your State</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>City </label>
																		<div class="form-group">
																			<select class="select-role form-control" id="city" name="city">
																				<option value="">Select your city</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Pin Code </label>
																		<div class="form-group">
																			<input type="text" class="select-role form-control"
																			name="pin_code">
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<label>How many hires? * </label>
																	<div class="form-group no-job">
																		<div class="input-group">
																			<input type="button" value="-" name="number_hire"
																			class="button-minus" data-field="quantity">
																			<input type="number" step="0" max="" value="1" name="quantity"
																			class="quantity-field">
																			<input type="button" value="+" class="button-plus ct-btn"
																			data-field="quantity">
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<label>What Contract type is it? Multiple select</label>
																	<select class="form-control select2" name="contract[]"
																	autocomplete="none" multiple>
																		<option value="1">Temporary</option>
																		<option value="2">Contract</option>
																		<option value="3">Internship</option>
																	</select>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>what is the schedule for this job</label>
																		<div class="form-group">
																			<select class="mul-select" Name="schedule_job[]"
																			multiple="true">
																				<option value="1">Morning Shift</option>
																				<option value="2">Day Shift</option>
																			</select>
																		</div>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Salary & Benefits</label>
																		<input class="form-control" type="text" name="salary"
																		placeholder="Salary & Benefits">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Are there any forms supplimental pay offered?</label>
																		<div class="form-group">
																			<select id="pay-offered" Name="supplimental[]" multiple="true">
																				<option value="1">Commissionn Pay</option>
																				<option value="2">Overtime Pay</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Are any of the following benefits offered</label>
																		<div class="form-group">
																			<select id="benefits-offered" Name="benefits[]" multiple="true">
																				<option value="1">Food Allowance</option>
																				<option value="2">Health Insurance</option>
																				<option value="3">Health Form home</option>
																				<option value="4">Other</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Let Applicant call you directly </label>
																		<input class="form-control" type="text" name="number"
																		placeholder="Enter Phone No. ">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> How do you want to receive Applications </label>
																		<input class="form-control" type="email" name="received_mail"
																		placeholder="Enter Email">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Daily update about this job and candidates will be sent
																		to: </label>
																		<input class="form-control" type="email" name="sent_mail"
																		placeholder="Enter Email">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Is there a planned start date for this job?</label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input type="radio" id="chkYes" value="1" name="chkPinNo"/>
																				<label for="chkYes"><span class="radio-label"></span>
																				Yes</label>
																			</div>
																			<br>
																			<div class="radio">
																				<input type="radio" id="chkNo" value="0" name="chkPinNo"/>
																				<label for="chkNo"><span class="radio-label"></span>
																				No</label>
																			</div>
																			<hr>
																			<div id="dvPinNo" style="display: none">
																				Select Date
																				<input type="date" class="form-control" name="star_date"
																				id="txtPinNo"/>
																			</div>
																		</div>
																		
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Is there an application deadline?</label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input type="radio" id="chkYes1" value="1"
																				name="chkPinNo1"/>
																				<label for="chkYes1"><span class="radio-label"></span>
																				Yes</label>
																			</div>
																			<br>
																			<div class="radio">
																				<input type="radio" id="chkNo1" value="0" name="chkPinNo1"/>
																				<label for="chkNo1"><span class="radio-label"></span>
																				No</label>
																			</div>
																			<hr>
																			<div id="dvPinNo1" style="display: none">
																				Select Date
																				<input type="date" class="form-control" id="txtPinNo1"
																				name="end_date"/>
																			</div>
																		</div>
																		
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Do you want applicant to submit resume </label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input id="radio-1" name="resume" value="1" type="radio">
																				<label for="radio-1"><span class="radio-label"></span> Yes
																				</label>
																			</div>
																			
																			<br>
																			
																			<div class="radio">
																				<input id="radio-2" name="resume" value="0" type="radio">
																				<label for="radio-2"><span class="radio-label"></span> No
																				</label>
																			</div>
																			
																			<br>
																			
																			<div class="radio">
																				<input id="radio-3" name="resume" value="2" type="radio">
																				<label for="radio-3"><span class="radio-label"></span>
																				Optional </label>
																			</div>
																		</div>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Are you taking any additional covid-19 </label>
																		<textarea name="covid" class="form-control" rows="3" c> </textarea>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label> How do you want to receive Applications </label>
																		<input class="form-control" type="file" name="image">
																	</div>
																</div>
																
																
																<div class="col-md-12">
																	<div class="form-group">
																		<label> Job Description </label>
																		<textarea name="description" class="form-control"
																		rows="5"> </textarea>
																	</div>
																</div>
																
																<div class="col-md-12">
																	<div class="form-group">
																		<button type="button" class="job-btn"
																		onclick="MyFunction('<?php echo $po->page_id?>','create_job')">
																			Submit
																		</button>
																	</div>
																</div>
																
															</div>
														</form>
													</div>
												</div>
												
												<!---- end job  add form -->
												
												<!--- Edit job form ---->
												<div id="show_job_edit_form" style="display:none;">
													<div class="job-step-container">
														<div class="row">
															<div class="col-lg-6">
																<h4 class="text-2xl font-semibold">Edit Jobs </h4>
															</div>
															<div class="col-lg-6">
																<div class="right-ct">
																	<button class="button" id="show_job_back_edit_btn" href="#">Back
																	</button>
																</div>
															</div>
														</div>
														
														<form action="JobCntrl/insert_job" mathod="post" id="reg_form" name="create_job">
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Select Page</label>
																		<div class="form-group">
																			<select id="select-bs-page-job" Name="page_id">
																				<option value="">Select Page</option>
																				<?php
																					if(!empty($user_page)){
																						foreach($user_page as $page){
																						?>
																						<option value="<?= $page->id;?>"><?= $page->page_name;?>
																						</option>
																					<?php } }?>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Job Title *</label>
																		<input class="form-control" type="text" name="job_title"
																		placeholder="Job Title">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Company name for this job *</label>
																		<input class="form-control" type="text" name="company_name"
																		placeholder="Company name">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Your role in this hiring process</label>
																		<div class="form-group">
																			<select name="job_role" class="select-role form-control">
																				<option value="1">Option 1</option>
																				<option value="2">Option 2</option>
																				<option value="3">Option 3</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>What Category does this job fall under? *</label>
																		<div class="form-group">
																			<select name="job_category" class="select-role form-control">
																				<option value="1">Front End Developers</option>
																				<option value="2">Healthcare</option>
																				<option value="3">Back End Developers</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Where will in employee report to work? *</label>
																		<div class="form-group">
																			<select class="select-role form-control" name="report_location">
																				<option value="1">Employees report to a specific location
																				</option>
																				<option value="2">Employees will not report to a specific
																					location
																				</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Education</label>
																		<input class="form-control" type="text" name="education"
																		placeholder="Education">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Address</label>
																		<input class="form-control" type="text" name="address"
																		placeholder="Address">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Country </label>
																		<div class="form-group">
																			<select class="select-role form-control" name="country">
																				<option value="1">India</option>
																				<option value="2">Uk</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>State </label>
																		<div class="form-group">
																			<select class="select-role form-control" name="state">
																				<option value="1">MP</option>
																				<option value="2">UP</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>City </label>
																		<div class="form-group">
																			<select class="select-role form-control" name="city">
																				<option value="1">Indore</option>
																				<option value="2">Bhopal</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Pin Code </label>
																		<div class="form-group">
																			<input type="text" class="select-role form-control"
																			name="pin_code">
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<label>How many hires? * </label>
																	<div class="form-group no-job">
																		<div class="input-group">
																			<input type="button" value="-" name="number_hire"
																			class="button-minus" data-field="quantity">
																			<input type="number" step="0" max="" value="1" name="quantity"
																			class="quantity-field">
																			<input type="button" value="+" class="button-plus ct-btn"
																			data-field="quantity">
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<label>What Contract type is it? Multiple select</label>
																	<select class="form-control select2" name="contract[]"
																	autocomplete="none" multiple>
																		<option value="1">Temporary</option>
																		<option value="2">Contract</option>
																		<option value="3">Internship</option>
																	</select>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>what is the schedule for this job</label>
																		<div class="form-group">
																			<select class="mul-select" Name="schedule_job[]"
																			multiple="true">
																				<option value="1">Morning Shift</option>
																				<option value="2">Day Shift</option>
																			</select>
																		</div>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label>Salary & Benefits</label>
																		<input class="form-control" type="text" name="salary"
																		placeholder="Salary & Benefits">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Are there any forms supplimental pay offered?</label>
																		<div class="form-group">
																			<select id="pay-offered" Name="supplimental[]" multiple="true">
																				<option value="1">Commissionn Pay</option>
																				<option value="2">Overtime Pay</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group ">
																		<label>Are any of the following benefits offered</label>
																		<div class="form-group">
																			<select id="benefits-offered" Name="benefits[]" multiple="true">
																				<option value="1">Food Allowance</option>
																				<option value="2">Health Insurance</option>
																				<option value="3">Health Form home</option>
																				<option value="4">Other</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Let Applicant call you directly </label>
																		<input class="form-control" type="text" name="number"
																		placeholder="Enter Phone No. ">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> How do you want to receive Applications </label>
																		<input class="form-control" type="email" name="received_mail"
																		placeholder="Enter Email">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Daily update about this job and candidates will be sent
																		to: </label>
																		<input class="form-control" type="email" name="sent_mail"
																		placeholder="Enter Email">
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Is there a planned start date for this job?</label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input type="radio" id="chkYes" value="1" name="chkPinNo"/>
																				<label for="chkYes"><span class="radio-label"></span>
																				Yes</label>
																			</div>
																			<br>
																			<div class="radio">
																				<input type="radio" id="chkNo" value="0" name="chkPinNo"/>
																				<label for="chkNo"><span class="radio-label"></span>
																				No</label>
																			</div>
																			<hr>
																			<div id="dvPinNo" style="display: none">
																				Select Date
																				<input type="date" class="form-control" name="star_date"
																				id="txtPinNo"/>
																			</div>
																		</div>
																		
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Is there an application deadline?</label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input type="radio" id="chkYes1" value="1"
																				name="chkPinNo1"/>
																				<label for="chkYes1"><span class="radio-label"></span>
																				Yes</label>
																			</div>
																			<br>
																			<div class="radio">
																				<input type="radio" id="chkNo1" value="0" name="chkPinNo1"/>
																				<label for="chkNo1"><span class="radio-label"></span>
																				No</label>
																			</div>
																			<hr>
																			<div id="dvPinNo1" style="display: none">
																				Select Date
																				<input type="date" class="form-control" id="txtPinNo1"
																				name="end_date"/>
																			</div>
																		</div>
																		
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Do you want applicant to submit resume </label>
																		<div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
																			<div class="radio">
																				<input id="radio-1" name="resume" value="1" type="radio">
																				<label for="radio-1"><span class="radio-label"></span> Yes
																				</label>
																			</div>
																			
																			<br>
																			
																			<div class="radio">
																				<input id="radio-2" name="resume" value="0" type="radio">
																				<label for="radio-2"><span class="radio-label"></span> No
																				</label>
																			</div>
																			
																			<br>
																			
																			<div class="radio">
																				<input id="radio-3" name="resume" value="2" type="radio">
																				<label for="radio-3"><span class="radio-label"></span>
																				Optional </label>
																			</div>
																		</div>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label> Are you taking any additional covid-19 </label>
																		<textarea name="covid" class="form-control" rows="3" c> </textarea>
																	</div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label> How do you want to receive Applications </label>
																		<input class="form-control" type="file" name="image">
																	</div>
																</div>
																
																
																<div class="col-md-12">
																	<div class="form-group">
																		<label> Job Description </label>
																		<textarea name="description" class="form-control"
																		rows="5"> </textarea>
																	</div>
																</div>
																
																<div class="col-md-12">
																	<div class="form-group">
																		<button type="button" class="job-btn"
																		onclick="MyFunction('create_job')">Update
																		</button>
																	</div>
																</div>
																
															</div>
														</form>
													</div>
												</div>
												
												<!--- end edit job form ---->
												
											</div>
										</div>
										
                                        <!----- blog tab ---->
										
                                        <div class="tab-pane fade" id="blog">
											<div class="card md:p-6 mx-auto blog-cl  divide-y divide-gray-100 px-4">
												<div id="blog_content">
													<div class=" justify-between items-center  mb-3">
														<div class="row">
															<div class="col-lg-6">
																<h2 class="text-xl font-bold"> Blog </h2>
															</div>
															<?php if($this->session->userdata('id') == $po->user_id) { ?>
																<div class="col-lg-6">
																	<div class="edit-blog">
																		<button class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
																		id="show_blog_add" href="#">
																			<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
																			xmlns="http://www.w3.org/2000/svg">
																				<path fill-rule="evenodd"
																				d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
																				clip-rule="evenodd"></path>
																			</svg>
																		</button>
																		<!------ edit page modal ---->
																	</div>
																</div>
															<?php } ?>
														</div>
													</div>
													<div class="card-blog">
														<div class="space-y-4 mt-3">
															<div class="table-responsive">
																<table class="table">
																	<tbody>
																		<?php
																			if(!empty($user_blog)){
																				foreach($user_blog as $blog) {
																				?>
																				<tr>
																					<td class="table_data">
																						<table class="table" id="blog-table-set">
																							<tbody>
																								<tr>
																									<td>
																										<div class="blog-img-post">
																											<?php if(!empty($blog_image)){ ?>
																												<img src="<?php echo base_url(); ?>assets/images/blog/img-4.jpg"
																												alt=""
																												class="bg-gray-200 border border-white rounded-full w-20 h-20">
																												<?php } else { ?>
																												<img src="<?php echo base_url('upload'); ?><?= $blog->blog_image?>"
																												alt=""
																												class="bg-gray-200 border border-white rounded-full w-20 h-20">
																											<?php } ?>
																										</div>
																									</td>
																									<td>
																										<div class="checkbox">
																											<label class="p-0">
																												<p class="data_listing m-0">
																													<a href="<?php echo base_url()?>blog/<?= $po->user_name?>/<?= $blog->blog_url?>"
																													class="title_text text-info">
																													<?= $blog->blog_title?></a>
																													<span><?= $blog->
																													blog_short_description?></span>
																												</p>
																											</label>
																										</div>
																									</td>
																									<td>
																										<p class="data_listing">
																											<span class="text-info">
																												<b class="text-dark">Blog Status: <br> </b>
																												<?php if($blog->status = 2) { ?>
																													Under Review
																													<?php } else if($blog->status = 1) { ?>
																													Posted
																												<?php } ?>
																											</span>
																										</p>
																									</td>
																									<td>
																										<a href="#blog-view"
																										class="button bl-view-btn view_blog"
																										aria-expanded="false"
																										onclick="viewblog('<?php echo $blog->id?>')"
																										uk-toggle>
																											<span class="icon-material-outline-visibility">
																											</span>
																										</a>
																									</td>
																									<?php if($this->session->userdata('id') == $po->user_id)
																										{ ?>
																										<td>
																											<button id="education_<?php echo $blog->id?>"
																											value="tr08_user_blog"
																											onclick="deletedata('<?php echo $blog->id?>')"
																											class="button mr-btn" type="button"
																											aria-expanded="false"><span
																												class="icon-feather-trash-2"></span>
																											</button>
																										</td>
																										<td>
																											<button id="show_blog_edit_<?= $blog->id?>"
																											onclick="show_blog('<?= $blog->id?>')"
																											value="tr08_user_blog"
																											class="button mr-btn show_blog_edit"
																											type="button"
																											aria-expanded="false"><span
																												class="icon-feather-edit"></span>
																											</button>
																										</td>
																									<?php } ?>
																								</tr>
																							</tbody>
																						</table>
																					</td>
																				</tr>
																			<?php } } ?>
																	</tbody>
																	
																</table>
															</div>
														</div>
													</div>
												</div>
												
												
												<!------ add  blog  form --->
												<div class="add-blog" id="add_blog_form" style="display: none;">
													<div class="row">
														<div class="col-lg-6">
															
														</div>
														<?php if($this->session->userdata('id') == $po->user_id) { ?>
															<div class="col-lg-6">
																<div class="float-right">
																	<button class="button" id="bach_btn_add_blog" href="#">Back</button>
																</div>
																
															</div>
														<?php } ?>
													</div>
													
													<div class="bg-white col-span-2 ">
														<!-- create page-->
														<div id="add_blog" class="max-w-2xl m-auto shadow rounded-md bg-white lg:mt-20">
															<form method="post" id="reg_form1" action="BlogCntrl/insert_blog"
															enctype="multipart/form-data">
																<!-- form header -->
																<div class="text-center border-b border-gray-100 py-6">
																	<h3 class="font-bold text-xl"> A New Blog </h3>
																</div>
																
																<!-- form body -->
																<div class="p-10 space-y-7">
																	
																	<div class="line1">
																		<label for="username" class="line__placeholder1"> Blog
																		Tittle </label>
																		<input class="form-control with-border" id="blog_title"
																		placeholder="Blog Tittle" name="blog_title"
																		type="text" value="" autocomplete="off">
																		
																	</div>
																	<!--<div class="flex items-center">
																		<div class="-mr-1 bg-gray-100 border px-3 py-3 rounded-l-md"> <?php echo base_url()?></div>
																		<input type="text" class="with-border" placeholder="">
																	</div>-->
																	<div class="select-blog-cate">
																		<label for=""> Blog Category </label>
																		<select id="blog_category" onchange="getcategorytag()"
																		name="blog_category"
																		class="shadow-none  with-border ">
																			<option value="">Select Page Category</option>
																			<?php if(!empty($category)) {
																				foreach($category as $cat) {
																				?>
																				<option value="<?= $cat->id;?>"
																				data="<?= $cat->name;?>"><?= $cat->name;?>
																				</option>
																			<?php } }?>
																		</select>
																	</div>
																	<div class="add-tag">
																		<label for=""> Blog Tags </label>
																		<div class="form-group">
																			<select name="blog_tag[]" id="blog_tag"
																			class="form-control select2 select2-hidden-accessible"
																			style="width: 100%;" tabindex="-1" aria-hidden="true"
																			multiple="">
																				<option value="" disabled>Select Blog tag</option>
																			</select></div>
																	</div>
																	
																	
																	<div class="add-feature-img">
																		<label for=""> Add Featured Image </label>
																		<div class="line">
																			<input class="line__input" id="blog-img" name="blog_img"
																			type="file">
																		</div>
																	</div>
																	<div class="line h-32">
																		<textarea class="line__input h-32" maxlength="169"
																		id="blog_short_description" name="blog_short_description"
																		type="text"
																		onkeyup="this.setAttribute('value', this.value);" value=""
																		autocomplete="off"></textarea>
																		<span for="username"
																		class="line__placeholder"> Short description </span>
																	</div>
																	<div class="line h-32">
																		<textarea class="line__input h-32" id="blog_description"
																		minlength="500" name="blog_description" type="text"
																		onkeyup="this.setAttribute('value', this.value);" value=""
																		autocomplete="off"></textarea>
																		<span for="username"
																		class="line__placeholder"> Blog description </span>
																	</div>
																</div>
																<!-- form footer -->
																<div class="border-t flex justify-between lg:space-x-10 p-7 bg-gray-50 rounded-b-md">
																	<p class="text-sm leading-6"></p>
																	<button onclick="insert_blog('<?php echo $po->page_id?>')" type="button"
																	class="button lg:w-1/2">
																		Create Now
																	</button>
																</div>
															</div>
														</form>
													</div>
												</div>
												<!------- add blog form end ----->
												
												<!------ edit  blog  form --->
												<div class="edit-blog" id="edit_blog" style="display: none;">
													<div class="row">
														<div class="col-lg-6">
														</div>
														<?php if($this->session->userdata('id') == $po->user_id) { ?>
															<div class="col-lg-6">
																<div class="edit-blog">
																	<button class="button" id="bach_btn_blog" href="#">Back</button>
																	<!------ edit page modal ---->
																</div>
															</div>
														<?php } ?>
													</div>
													
													<div class="bg-white col-span-2 ">
														<div id="edit_blog_details" class="max-w-2xl m-auto shadow rounded-md bg-white lg:mt-20">
															
															<!-- create page-->
														</div>
													</div>
													<!------- edit form end ----->
													
												</div>
												
											</div>
										</div>
										
										
                                        <div class="tab-pane fade" id="about">
											<!-- about  -->
											<div class="card md:p-6 max-w-3xl mx-auto">
												<div class="flex justify-between items-start relative md:mb-4 mb-3">
													<div class="flex-1">
														<div id="page_about">
															<div class="row">
																<div class="col-lg-6">
																	<h2 class="text-xl font-bold"> About </h2>
																</div>
																
																<div class="col-lg-6">
																	<div class="edit-page">
																		<?php
																			if($po->user_id == $this->session->userdata('id')){
																			?>
																			<button class="button" id="showmenu" href="#">Edit Page Info
																			</button>
																			<!------ edit page modal ---->
																		</div>
																	<?php } ?>
																</div>
															</div>
															
															
															<div class="card-about">
																<div class="space-y-4 mt-3">
																	<div class="flex items-center space-x-3">
																		<ion-icon name="people"
																		class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																		role="img" aria-label="people"></ion-icon>
																		<div class="flex-1">
																			<div class="font-semibold"><?= $po->page_name;?></div>
																		</div>
																	</div>
																	<div class="flex items-center space-x-3">
																		<ion-icon name="alert-circle"
																		class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																		role="img" aria-label="alert circle"></ion-icon>
																		<div class="flex-1">
																			<div><span class="font-semibold"> Category :- </span> <span
																				class=""><?= $po->
																				category;?> </span>
																			</div>
																		</div>
																	</div>
																	<div class="flex items-center space-x-3">
																		<ion-icon name="globe"
																		class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																		role="img" aria-label="globe"></ion-icon>
																		<div class="flex-1">
																			<div>
																				<span class="font-semibold"> Business Email :- </span> <?= $po->
																					business_email;?><span class="">
																				</span></div>
																		</div>
																	</div>
																	<div class="flex items-center space-x-3">
																		<ion-icon name="mail-open"
																		class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																		role="img" aria-label="mail open"></ion-icon>
																		<div class="flex-1">
																			<div>
																				<span class="font-semibold"> Business Address :- </span> <?= $po->
																					address;?> <?= $po->
																				city;?>, <?= $po->state;?> <?= $po->pin_code;?>
																			</div>
																		</div>
																	</div>
																	<div class="flex items-center space-x-3">
																		<ion-icon name="albums"
																		class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																		role="img" aria-label="albums"></ion-icon>
																		<div class="flex-1">
																			<div><span class="font-semibold"> Page Description :- </span>
																			</div>
																		</div>
																	</div>
																	
																	<div class="line-clamp-3" id="more-text">
																		<?= $po->page_description?>
																	</div>
																	<a href="#" id="more-text"
																	uk-toggle="target: #more-text ; cls: line-clamp-3">
																	See more </a>
																	
																</div>
																
																<div class="flex items-center space-x-3">
																	<ion-icon name="mail-open"
																	class="bg-gray-100 p-1.5 rounded-full text-xl md hydrated"
																	role="img" aria-label="mail open"></ion-icon>
																	<div class="flex-1">
																		<div>Page Id :- <span class="view_data"><?= $po->page;?></span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="edit-about" id="edit_about" style="display: none;">
															<button class="button" id="bach_btn" href="#">Back</button>
															<div class="bg-white rounded-md lg:shadow-md shadow col-span-2 ">
																<form method="post" name="edit_page_details" id="about_form"
																action="<?= base_url('/PageCntrl/update_about_page')?>">
																	<div class="grid grid-cols-1 gap-3 lg:p-6 p-4">
																		<div class="col-span-2">
																			<div class="cate-multiple">
																				<input class="shadow-none with-border" type="hidden"
																				value="<?= $po->page;?>" name="page_id">
																				<label for=""> Business Category </label>
																				<select id="business_category" name="business_category"
																				class="shadow-none  with-border ">
																					<option value="">Select Business Category</option>
																					<?php
																						if(!empty($category)) {
																							foreach($category as $cat) {
																								$selected = $cat->id ==
																								$po->Business_category?'selected':'';
																							?>
																							<option value="<?= $cat->id?>"
																							<?php echo $selected; ?>><?= $cat->name?></option>
																						<?php } }?>
																				</select>
																			</div>
																		</div>
																		
																		
																		<div class="col-span-2">
																			<label for=""> Business Email</label>
																			<input type="email" placeholder="Business Email"
																			value="<?= $po->business_email?>" name="business_email"
																			class="shadow-none with-border">
																		</div>
																		
																		<div class="col-span-2">
																			<label for=""> Business Address</label>
																			<input name="business_address" placeholder="Business Address"
																			value="<?= $po->address?>"
																			class="shadow-none with-border" type="text">
																		</div>
																		
																		<div class="col-span-2">
																			<label for=""> Website Link</label>
																			<input name="website" type="text" placeholder="Website Link"
																			value="<?= $po->website_link?>"
																			class="shadow-none with-border">
																		</div>
																		
																		<div class="col-span-2">
																			
																			<div class="cate-multiple">
																				<label for=""> Select
																				Country</label>
																				<select id="get_country" name="get_country"
																				class="shadow-none with-border">
																					<option value="">Select Country Name</option>
																					<?php
																						if(!empty($country)) {
																							foreach($country as $coun) {
																								$selected = $coun->id ==
																								$po->country_location?'selected':'';
																							?>
																							<option value="<?= $coun->id;?>"
																							<?php echo $selected; ?>><?= $coun->name;?></option>
																						<?php } } ?>
																				</select>
																			</div>
																		</div>
																		<div class="col-span-2">
																			<div class="cate-multiple">
																				<label for=""> Select State</label>
																				<select id="state" name="state_list"
																				class="shadow-none with-border">
																					<option value="<?php echo $po->state_id; ?>"><?php echo $po->
																					state;?>
																					</option>
																				</select>
																			</div>
																		</div>
																		<div class="col-span-2">
																			<div class="cate-multiple">
																				<label for=""> Select CIty</label>
																				<select id="city" name="city_list"
																				class="shadow-none  with-border ">
																					<option value="<?php echo $po->city_id; ?>"><?php echo $po->
																					city;?>
																					</option>
																				</select>
																			</div>
																			
																		</div>
																		
																		<div class="col-span-2">
																			<div class="cate-multiple">
																				<label for=""> Pin Code</label>
																				<input name="pin_code" placeholder="Business pin code"
																				value="<?= $po->pin_code?>"
																				class="shadow-none with-border" type="text">
																			</div>
																			
																		</div>
																		
																		<div class="col-span-2">
																			<label for="about">Page
																			Description</label>
																			<textarea id="about" name="about" rows="3"
																			class="with-border"><?php echo $po->page_description; ?></textarea>
																		</div>
																	</div>
																	
																	<div class="bg-gray-10 p-6 pt-0 text-center space-x-3">
																		<button type="button"
																		onclick="update_data('<?php echo $po->page_id?>')"
																		class="button bg-blue-700"> Update
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
							</div>
						</div>
						
					</div>
				<?php } }?>
				
				<?php echo $layout['message']?>
				
				<?php echo $layout['footer'];?>
				<?php echo $layout['js'];?>
				
				
				<!-------- blog view model  ----->
				<div id="blog-view" uk-modal>
					<div class="uk-modal-dialog">
						
						<button class="uk-modal-close-default m-3" type="button" uk-close></button>
						<div id="blog_details">
							
							
						</div>
					</div>
				</div>
				
				
				<!----- reviews model ---->
				<div id="review-modal-page" uk-modal>
					<div class="uk-modal-dialog">
						<button class="uk-modal-close-default m-3" type="button" uk-close></button>
						<div class="uk-modal-header">
							<h2 class="uk-modal-title"><?php echo $po->page_name;?></h2>
						</div>
						
						<form method="post" action="<?= base_url('PageCntrl/page_review');?>" id="review_page">
							<div class="uk-modal-body">
                                <div class="pad-32">
									<div class="container-comment-area align-center">
										<div class="card-reviews animated post">
											<h4 class="font-semibold mb-3">Rate this Page </h4>
											<div class="post-text" id="full-stars-example-two">
												<div class="rating-group post-action">
													<select class='rating' id='rating' name="rating">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											
											<div class="comment-area">
												<textarea class="form-control" rows="2" name="comment" placeholder="Share details of your own experience at this place" id="comment"></textarea>
											</div>
										</div>
									</div>
								</div>
                                <div class="uk-modal-footer text-right">
									<button class="button gray uk-modal-close" type="button">Cancel</button>
									<button class="button" onclick="insert_data('<?= $po->page_id?>', 'review_page');"
									type="button">Post
									</button>
								</div>
							</div>
						</form>
					</div>
					
					<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css'>
					
					<div id="user_banner_upload" uk-modal>
						<div class="uk-modal-dialog">
							<button class="uk-modal-close-default m-3" type="button" uk-close></button>
							<div class="uk-modal-header">
								<h2 class="uk-modal-title">Page Banner Update</h2>
							</div>
							
							<!------  profile update popup  ------->
							<form method="post" id="banner_image_form" enctype="multipart/form-data">
								<div class="uk-modal-body profile_popup">
									<div class="profile-update">
										<div class="avatar-upload">
											<div class="avatar-edit pr-update">
												<input type='file' id="image_Upload_page_banner" name="imageUpload" accept=".png, .jpg, .jpeg"/>
												<label for="image_Upload_page_banner">
													<span class="btn-text">
														<span class="icon-feather-plus"></span>
														Upload Page Banner  
													</span>
												</label>
											</div>
											<div class="avatar-preview">
												<img class="profile-user-img img-responsive" id="image_Preview_page_banner"
												src="<?php echo base_url()?>assets/images/group/group-3.jpg"
												alt="User profile picture">
											</div>
										</div>
									</div>
								</div>
								
								<div class=" flex items-center w-full justify-between border-t p-3   text-right">
									<select name="user_visibility" class="pr-pub-select mt-2 story">
										<option value="2">Public</option>
										<option value="1">Only me</option>
									</select>
									
									<div class="uk-modal-footer text-right" id="upload_profile_image_page">
										<button class="button" type="button" onclick="updatebanner('<?php echo $this->session->userdata('id')?>', '<?= $po->page_id?>')">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<script>
						$("ul.nav-tabs a.nav-li").click(function (e) {
                            e.preventDefault();
                            $(this).tab("show");
						});
					
					$('#success-msg').css('display', 'block');
					
					
					</script>
					
					
					<script>
					$(window).on('load', function () {
					setTimeout(function () { // allowing 3 secs to fade out loader
					$('.page-loader').fadeOut('slow');
					}, 3500);
					});
					
					$(function () {
					$('.mdi-star').click(function () {
					var clickedId = $(this).data('star');
					$('.mdi-star').removeClass('selected animated tada');
					$('.mdi-star').each(function () {
					if ($(this).data('star') <= clickedId) {
					var star = $(this);
					setTimeout(function () {
					star.addClass('selected animated tada');
					}, 75 * parseInt($(this).data('star')));
					}
					});
					$('.btn').removeClass('disabled');
					});
					
					$('.btn').click(function (e) {
					e.preventDefault();
					$(this)
					.unbind('click')
					.removeClass('bg-teal bounceInUp')
					.addClass('bg-light-blue wobble')
					.attr('href', 'https://twitter.com/petjato')
					.attr('target', '_blank')
					.find('.pad-5')
					.html('Follow @petjato');
					});
					});
					
					
					$(window).scroll(function() {
					if($(window).scrollTop() + $(window).height() >= $(document).height()) {
					var last_id = $(".page_post_id:last").attr("id");
					loadMore(last_id);
					}
					});
					
					function loadMore(last_id){
					$.ajax({
					url: '<?php echo base_url('MasterCntrl/get_page_feed_data')?>?last_id=' + last_id,
					type: "get",
					beforeSend: function(){
					$('#page_loader').show();
					},
					success: function(response){
					$('#page_loader').hide();
					var dataObj = JSON.parse(response);
					if(dataObj !=''){
                    $.each(dataObj, function (i, d) {
					$('#page_data').append('<li class="page_id" id="' + d["id"] + '">' +
					'<div class="flex items-start space-x-5 p-7">' +
					(d['business_Logo'] == '' ? '<img src="https://www.byloapp.in/' + d["avatar_image"] + '" alt="" class="w-12 h-12 rounded-full">': '<img src="https://www.byloapp.in/upload/' + d["business_Logo"] + '" alt="" class="w-12 h-12 rounded-full">') +
					'<div class="flex-1">' +
					'<a href="https://www.byloapp.in/page/' + d["city"]+'/'+ d["business_Logo"]+'" class="text-lg font-semibold line-clamp-1 mb-1">' + d["page_name"] + '</a>' +
					'<p class="text-sm text-gray-400 mb-2">' +
					'<span data-href="%40tag-dev.html">· 0 likes ·</span> 0 follows</span> </p>' +
					'</div>' +
					'</div>' +
					'</li>');
                    });
					}else {
                    $('#page_loader').show();
					}
					}
					});
					}
					
					</script>					