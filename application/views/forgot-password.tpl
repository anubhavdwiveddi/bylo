<?php echo $layout['meta']; ?>
<style>
  

    .left {
        left: 0;
        background-image: url('assets/images/login/Home-Banner.jpg');
        background-color: #ffff;
        background-size: cover;
        background-position: 50% 50%;
    }

 
</style>
<body>
<div class="login-bylo-page">	
<div class="lg:flex max-w-5xl min-h-screen mx-auto">
    <div class="flex flex-col items-center lg: lg:flex-row lg:space-x-10">

        <div class="split lg-txt left">
            <div class="centered">
                <div class="lg:mb-12 flex-1 lg:text-left">
                    <p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-3/4 text-xl"> Create, connect, shop and
                        discover with people.</p>
                    <p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-3/4 text-xl"> India's 1st Marketplace
                        Community</p>
                </div>
            </div>
        </div>

        <div class="split right  p-6 py-10" id="for">
            <div class="centered">
			    <div class="form-login-content"> 
				   <a href="https://byloapp.in/" > <img src="<?php echo base_url();?>assets/images/bylo-logo.jpg" > </a> 
				  <h5> Forgot your password? </h5>
				  <p class="forget-msg"> Please enter your email address. You will receive an email with instructions on how to reset your password.</p>

				   <form class="p-6 space-y-4 relative bg-white shadow-lg rounded-lg" method="POST">
                    <input type="email" placeholder="Email" class="with-border" name="email" id="email">
                       <div class="rd-timer" id="resend" style="display:none;"> Time left = <span id="timer"></span></div>
                           <!--<button type="button" id="resend_link" onclick="resendlink('forget_password')" style="float: right;" class="bylo-text-red rounded-md">
                               Resend Link
                           </button>--->

                    <button type="button" id="forget_password"
                            class="bylo-red-600 font-semibold p-3 rounded-md text-center text-white w-full">
                       Request reset link
                    </button>
                    <a href="<?php echo base_url();?>/login" class="bylo-text-red text-center block">  Back to sign in </a>
                    <hr class="pb-3.5">
                </form>
				</div>
            </div>
        </div>
        <div class="split right" id="success_msg" style="display: none;">
            <div class="centered">
                <div class="form-login-content">
                    <a href="<?php echo base_url();?>" > <img src="<?php echo base_url();?>/assets/images/bylo-logo.jpg" > </a>
                    <h5> Forgot your link sent Successfully your Email address </h5>
                    <p class="forget-msg" id="success"></p>

                </div>


            </div>
        </div>
    </div>
</div>

<?php echo $layout['footer'];?>
</div>
<?php echo $layout['js'];?>
