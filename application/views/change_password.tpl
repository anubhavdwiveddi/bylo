<?php echo $layout['meta']; ?>
<style>
    body {
        color: black;
    }

    .split {
        height: 100%;
        width: 50%;
        position: fixed;
        z-index: 1;
        top: 0;
        overflow-x: hidden;
        padding-top: 20px;
    }

    .left {
        left: 0;
        background-image: url('assets/images/login/Home-Banner.jpg');
        background-color: #ffff;
        background-size: cover;
        background-position: 50% 50%;
    }

    .right {
        right: 0;
        background-color: #e5e7eb;
    }

    .centered {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
    }

    .centered img {
        width: 150px;
        border-radius: 50%;
    }
	.toggle-password, .c-password {
		float: right;
		cursor: pointer;
		margin-right: 10px;
		margin-top: -25px !important;
	}
</style>

<body>
<div class="lg:flex max-w-5xl min-h-screen mx-auto p-6 py-10">
    <div class="flex flex-col items-center lg: lg:flex-row lg:space-x-10">

        <div class="split lg-txt left">
            <div class="centered">
                <div class="lg:mb-12 flex-1 lg:text-left ">
                    <p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-3/4 text-xl"> Create, connect, shop and
                        discover with people.</p>
                    <p class="font-medium lg:mx-0 md:text-2xl mt-6 mx-auto sm:w-3/4 text-xl"> India's 1st Marketplace
                        Community</p>
                </div>
            </div>
        </div>

        <div class="split right">
            <div class="centered">
			    <div class="form-login-content"> 
				   <a href="https://byloapp.in/" > <img src="<?php echo base_url();?>/assets/images/bylo-logo.png" > </a> 
				  <h5> Change your password? </h5>
				  <p class="forget-msg"> Please enter your new password.</p>
				   <form class="p-6 space-y-4 relative bg-white shadow-lg rounded-lg" method="post">
                       <div class="alert alert-danger msg" role="alert" id="errorModel_msg">
                       </div>
                       <div class="alert alert-success msg" role="alert" id="success_msg">
                       </div>

                    <input type="email" placeholder="Email" name="email" id="email" hidden readonly  value="<?= $_GET['key']?>" class="with-border">
                    <input type="password" placeholder="New Password" name="password" id="password" class="with-border pass-show" >
					  <i class="toggle-password fa fa-fw fa-eye-slash"></i>
					 <input type="password" name="confirm_password" placeholder="Confirm Password" id="confirm_password"  class="with-border show-pass">
				       <i class="c-password fa fa-fw fa-eye-slash"></i>
                   
                    <button type="button"
                            class="bylo-red-600 font-semibold p-3 rounded-md text-center text-white w-full" id="submit_password"> Submit
                    </button>
                    <a href="https://byloapp.in/" class="bylo-text-red text-center block">  Back to sign in </a>
                    <hr class="pb-3.5">
                </form>
				</div>
               

            </div>
        </div>
    </div>
</div>
<?php echo $layout['js'];?>
<script>
    $('#submit_password').click(function(){
        var password = $('#password').val();
        var confirm_password = $('#confirm_password').val();
        var email = $('#email').val();
        var regex = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()+=-\?;,./{}|\":<>\[\]\\\' ~_]).{8,}/;

        if(password == ''){
            document.getElementById('errorModel_msg').innerText = 'Password are not blank.';
            $('#errorModel_msg').delay(3000).hide('slow');
            $('#errorModel_msg').css('display', 'block');
        }else if(confirm_password == ''){
            document.getElementById('errorModel_msg').innerText = 'confirm Password are not blank.';
            $('#errorModel_msg').delay(3000).hide('slow');
            $('#errorModel_msg').css('display', 'block');
        }else if(!regex.test(password)){
            document.getElementById('errorModel_msg').innerText = 'password must be a minimum of 8 characters including number, Upper, Lower And \n' +
                '       one special character';
            $('#errorModel_msg').delay(3000).hide('slow');
            $('#errorModel_msg').css('display', 'block');
        }else if(password != confirm_password){
            document.getElementById('errorModel_msg').innerText = 'Password and Confirm Password are not match.';
            $('#errorModel_msg').delay(3000).hide('slow');
            $('#errorModel_msg').css('display', 'block');
        }else {
            $.ajax({
                type:'post',
                url:'<?php echo base_url('SettingCntrl/submit_forget_password')?>',
                data:{password:password, confirm_password:confirm_password, email:email},
                dataType:'json',
                success:function(response){
                    if(response['status'] == 1){
                        document.getElementById('success_msg').innerText = response['message'];
                        $('#success_msg').delay(3000).hide('slow');
                        $('#success_msg').css('display', 'block');
                    }else {
                        document.getElementById('errorModel_msg').innerText = response['message'];
                        $('#errorModel_msg').delay(3000).hide('slow');
                        $('#errorModel_msg').css('display', 'block');
                    }
                }
            });
        }
    });
</script>
