<?php echo $layout['meta']; ?>
<style>
 

  .login-bylo-page .left {
        background-image: url('assets/images/login/Home-Banner.jpg');
    }
	

</style>
<body>
<div class="login-bylo-page">
	<div class="lg:flex max-w-5xl min-h-screen mx-auto">
			<div class="flex flex-col items-center lg: lg:flex-row lg:space-x-10">
					<div class="split lg-txt left">
							<div class="centered">
									<div class="lg:mb-12 flex-1 lg:text-left">
											<p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-4/4 text-xl login-first-para"> Create,
													connect,<br> shop and
													discover <br> with people.</p>
											<p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-4/4 text-xl left-login-font-set">
													India's 1st Marketplace
													Community</p>
									</div>
							</div>
					</div>

					<div class="split right">
							<div class="centered">
									<div class="form-login-content">
											<a href="https://byloapp.in/"> <img src="<?php echo base_url();?>/assets/images/bylo-logo.jpg"> </a>
											<h2 class="hello-txt"> Hello Again </h2>
									</div>
									<div class="social-login">
											<p> Login With
													<button style="background: #2a41e8; padding: 14px 12px 5px 16px;" class="fb-login social-login">
															<span class="icon-brand-facebook-f" style="color: white;"></span>
													</button>
													<button onclick="google_login('u')" class="google-login social-login" style="background: #e83749; padding: 10px;">
															<span class="icon-brand-google" style="color: white;"></span>
													</button>
											</p>
									</div>


									<form class="pr-6 pl-6 space-y-4 relative login-form rounded-lg card-body" method="post" id="login_form">
											<md-divider class="login-divider ">
													<span>OR</span>
											</md-divider>
											<div class="row mt-0">
													<div class="col-md-12 mt-0">
															<input type="email" id="user_email" name="user_email" placeholder="Email or Phone Number"
																   class="with-border">
															<span id="txt_alert_email"></span>
													</div>
											</div>
											<div class="row">
													<div class="col-md-12 mt-0">
															<input type="password" id="user_password" name="user_password" placeholder="Password"
																   class="with-border pass-show">
															<i class="toggle-password fa fa-fw fa-eye-slash"></i>
															<span id="txt_alert_password"></span>
													</div>
											</div>

											<button type="button" id="user_login" onclick="user_login('user_login', 'tr01_user')"
													class="bylo-red-600 ft-12 pd-user-login rounded-md text-center text-white w-full">
													LOGIN NOW
											</button>

											<div class="row">
													<div class="col-md-6 mt-0">
															<div class="checkbox">
																	<input type="checkbox" id="chekcbox1" checked="">
																	<label for="chekcbox1"><span class="checkbox-icon "></span> <span class="pl-2">  Remember Me </span>
																	</label>
															</div>
													</div>
													<div class="col-md-6 pl-0  mt-0">
															<a href="<?= base_url('forget-password')?>" class="text-blue-500 text-right block forgot-txt"> Forgot
																	Password? </a>
													</div>
											</div>

											<hr class="pb-3.5">
											<div class="flex mt-0">
													<a href="#register" type="button"
													   class="bg-green-600 hover:bg-green-500 hover:text-white ft-12 pd-user-login px-5 rounded-md text-center text-white mx-auto"
													   uk-toggle>
															Create New Account
													</a>
											</div>
											<div class="privacy-policy">
													<p><a href="#modal-terms" uk-toggle> Terms Of Use </a> and <a href="#modal-policy" uk-toggle>
																	Privacy Policy </a></p>
											</div>
									</form>

							</div>
					</div>
			</div>
	</div>


<?php echo $layout['footer'];?>
</div>
<?php echo $layout['js'];?>
<div id="modal-terms" uk-modal>
        <div class="uk-modal-dialog">

                <button class="uk-modal-close-default m-3" type="button" uk-close></button>

                <div class="uk-modal-header">
                        <h2 class="uk-modal-title">Terms Of Use</h2>
                </div>

                <div class="uk-modal-body" uk-overflow-auto>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                                deserunt mollit anim id est laborum.</p>

                </div>
                <div class="uk-modal-footer text-right">

                </div>

        </div>
</div>

<div id="modal-policy" uk-modal>
        <div class="uk-modal-dialog">
                <button class="uk-modal-close-default m-3" type="button" uk-close></button>
                <div class="uk-modal-header">
                        <h2 class="uk-modal-title">Privacy Policy</h2>
                </div>
                <div class="uk-modal-body" uk-overflow-auto>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                                deserunt mollit anim id est laborum.</p>

                </div>
                <div class="uk-modal-footer text-right">
                </div>
        </div>
</div>


<script>
          function google_login(u){
                    var value = u;
                    $.ajax({
                              type:'post',
                              url: '<?php echo base_url('Google_login/login')?>',
                            data:{value:value},
                    success:function(){
                              alert('');
                    }
                    });
          }
</script>
