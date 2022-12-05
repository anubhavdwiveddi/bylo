<?php echo $layout['meta'];?>

<div id="wrapper">
	<!-- Header -->
	<?php echo $layout['header'];?>
	<!-- sidebar -->
	<?php echo $layout['sidebar'];?>
	<!-- Main Contents -->
	<div class="main_content">
		<div class="mcontainer">
			<nav class="responsive-nav border-b md:m-0 -mx-4">
				<ul uk-switcher="connect: #setting-tab; animation: uk-animation-fade">
					<li class="uk-active"><a class="lg:px-2 active" href="#0"> Profile</a></li>
					<li><a href="#0" class="lg:px-2">Password </a></li>
					<!--<li><a href="#0" class="lg:px-2">Privacy </a></li>
						<li><a href="#0" class="lg:px-2">Notification </a></li>
						<li><a href="#0" class="lg:px-2">Billing </a></li>
					<li><a href="#0" class="lg:px-2">Security </a></li>  -->
					
				</ul>
			</nav>
			<div class="contact-list px-2 uk-switcher" id="setting-tab">
				<div class="p-1">
					<?php
					if(!empty($user_data)) {
			            foreach($user_data as $user) {
						?>
						<form class="grid lg:grid-cols-3 mt-12 gap-8grid lg:grid-cols-3 mt-12 gap-8" method="post"
						id="reg_form">
							<div>
								<h3 class="text-xl mb-2 font-semibold"> Basic</h3>
								<p> Update your Profile </p>
							</div>
							<div class="bg-white rounded-md lg:shadow-md shadow col-span-2 lg:mx-16">
								
								<div class="alert alert-danger msg" role="alert" id="errorModel">
								</div>
								<div class="alert alert-success msg" role="alert" id="success-msg">
								</div>
								<div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
									<div>
										<label for=""> First name</label>
										<input type="text" name="first_name" id="first_name" value="<?= $user->first_name?>"
										placeholder="" class="shadow-none with-border">
									</div>
									<div>
										<label for=""> Last name</label>
										<input type="text" placeholder="" name="last_name" id="last_name"
										value="<?= $user->last_name?>" class="shadow-none with-border">
									</div>
									<div class="col-span-2">
										<label for=""> Email</label>
										<input type="text" placeholder="" name="email" id="email"
										class="shadow-none with-border" value="<?= $user->email?>">
									</div>
									
									<div class="col-span-2 mr-cl">
										<div class="row">
											<div class="col-md-8">
												<label for="">Mobile</label>
												<div class="mobile-code">
													<div class="ct-code">
														<select class="code-select">
															<option value="">Select Country</option>
															<?php foreach($country as $cou){
																$selected = $cou->id == $user->country?'selected':'';
															?>
															<option value="<?php echo $cou->id; ?>"
															<?php echo $selected; ?>><?php echo $cou->phonecode ;?></option>
															<?php } ?>
														</select>
													</div>
													
													
													<div class="mob-no">
														<input type="text" placeholder="" name="mobile" id="mobile"
														class="shadow-none with-border" value="<?= $user->mobile?>">
														<span id="alert_msg"></span>
													</div>
												</div>
												
											</div>
											
											<div class="col-md-4">
												<label for="">Mobile OTP</label>
												<input type="text" readonly placeholder="" name="mobile_otp" id="mobile_otp"
												class="shadow-none with-border">
											</div>
										</div>
									</div>
									
									
									<div>
										<label for="">Gender</label>
										<select class="shadow-none with-border" name="gender" id="gender">
											<option value="">Select Gender</option>
											<option value="1"<?php if($user->gender == 1){echo "selected";}else {"";}?>>Male</option>
											<option value="2">Female</option>
											<option value="3">Other</option>
										</select>
									</div>
									<div>
										<label for=""> DOB</label>
										<input type="date" placeholder="" name="DOB" id="DOB"
										class="shadow-none with-border datepicker" value="<?php if(!empty($user->birthdate)){echo $user->birthdate;}?>">
									</div>
									<div class="col-span-2">
										<label for="about">About me</label>
										<textarea id="about" name="about" rows="3" name="about" id="about"
										class="with-border"> <?= $user->about;?> </textarea>
									</div>
									
									<div>
										<label for=""> Country</label>
										<select id="Country" name="Country" class="shadow-none with-border ">
											<option value="">Select Country</option>
											<?php foreach($country as $cou){
												$selected = $cou->id == $user->country?'selected':'';
											?>
											<option value="<?php echo $cou->id; ?>"
											<?php echo $selected; ?>><?php echo $cou->name ;?></option>
											<?php } ?>
										</select>
									</div>
									
									<div>
										<label for=""> State</label>
										<select id="State" name="State" class="shadow-none with-border">
											<option value="">Select State</option>
											<?php foreach($state as $st){
												$selected = $st->id == $user->state?'selected':'';
											?>
											<option value="<?php echo $st->id; ?>"
											<?php echo $selected; ?>><?php echo $st->name ;?></option>
											<?php } ?>
										</select>
									</div>
									
									<div>
										<label for=""> City</label>
										<select id="City" name="City" class="shadow-none with-border ">
											<option value="">Select City</option>
											<?php
												if(!empty($city)){
												foreach($city as $ca){
												$selected = $ca->id == $user->city?'selected':'';
												?>
											<option value="<?php echo $ca->id; ?>"<?php echo $selected; ?>><?php echo $ca->name ;?></option>
												<?php } } ?>
										</select>
									</div>
									
									<div>
										<label for=""> Pin code </label>
										<input type="text" placeholder="" class="shadow-none with-border"
										value="<?= $user->pin_code;?>" id="pin_code" name="pin_code">
									</div>
									
									<div>
										<label for=""> Working at</label>
										<input value="<?= $user->working;?>" type="text" name="working" id="working"
										placeholder="" class="shadow-none with-border">
									</div>
									<div>
										<label for=""> Relationship </label>
										<select id="relationship" name="relationship" class="shadow-none with-border ">
											<option value="">None</option>
											<?php foreach($relationship as $relation){
												$selected = $relation->id == $user->relationship?'selected':'';
											?>
											<option value="<?php echo $relation->id; ?>"
											<?php echo $selected; ?>><?php echo $relation->name ;?></option>
											<?php } ?>
										</select>
									</div>
									<?php if (!empty($user->partner_name)) { ?>
										<div id="partner">
											<label for="">partner name</label>
											<input type="text" placeholder="Enter your partner name" name="partner_name"
											id="partner_name" class="shadow-none with-border"
											value="<?= $user->partner_name;?>">
										</div>
									<?php } ?>
								</div>
								
								<div class="bg-gray-10 p-6 pt-0 flex justify-end space-x-3">
									<button class="p-2 px-4 rounded bg-gray-50 text-red-500"> Cancel</button>
									<button type="submit" id="update_profile_data" class="button bg-blue-700"> Save</button>
								</div>
								
							</div>
						</form>
						
					<?php } }?>
				</div>
				
				<div class="p-1">
					<div class="grid lg:grid-cols-3  mt-12">
						<div>
							<h3 class="text-xl  font-semibold"> Change Password</h3>
							<p> If you want change your Password then Enter your current password & New password and
							confirm password</p>
						</div>
						<div class="bg-white rounded-md lg:shadow-md shadow col-span-2 lg:mx-16">
							
							<form method="post" id="password_change">
								<div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
									<div>
										<label for="">Old Password</label>
										<input type="password" placeholder="Password" name="old_password"
										id="old_password" class="shadow-none with-border old-pass-show">
										<i class="old-password fa fa-fw fa-eye-slash"></i>
									</div>
									<div>
										<label for="">New Password</label>
										<input type="password" placeholder="Password" name="password" id="password"
										class="shadow-none with-border pass-show">
										<i class="toggle-password fa fa-fw fa-eye-slash"></i>
									</div>
									<div>
										<label for=""> Confirm Password</label>
										<input type="password" placeholder="Confirm Password" name="confirm_password"
										id="confirm_password" class="shadow-none with-border show-pass">
										<i class="c-password fa fa-fw fa-eye-slash"></i>
									</div>
								</div>
								<div class="bg-gray-10 p-6 pt-0 flex justify-center space-x-3">
									<button id="change_password" type="button" class="button bg-blue-700"> Change
										Password
									</button>
								</div>
								<div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
									<div class="col-span-2">
										<label for="">If you Forget your old password
											<button onclick="showhide('show_mobile_field')" type="button"
											style="color: #e8394b;">Click Here
											</button>
										</label>
									</div>
								</div>
							</form>
							
							<form method="post" id="mobile_ver" name="" style=" display:none;">
								<div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
									<div class="col-span-2">
										<label for="">Use your account with Mobile Number
											<?php
												$maskedPhone = substr($user->mobile, 0, 2) . "******" .
												substr($user->mobile, 6, 9);
												print_r($maskedPhone);
											?>
										</label>
									</div>
								</div>
								<div class="row mrg0">
									<div class="col-md-8 pdr">
										<label for="">Mobile Number</label>
										<div class="mobile-code">
											<div class="ct-code">
												<select class="code-select">
													<option value="">Select Country</option>
													<?php foreach($country as $cou){
											            $selected = $cou->id == $user->country?'selected':'';
													?>
													<option value="<?php echo $cou->id; ?>"
													<?php echo $selected; ?>><?php echo $cou->phonecode ;?></option>
													<?php } ?>
												</select>
											</div>
											<div class="mob-no">
												<input type="text" id="mobile_num"
												onkeyup="verifymobile('forget_after')"
												placeholder="Mobile Number" name="mobile_number"
												class="shadow-none with-border">
											</div>
										</div>
										
										
									</div>
									<div class="col-md-4 pdl">
										<label for="">Mobile OTP</label>
										<input type="text" readonly placeholder="Mobile otp" name="Mobile_otp" id="for_otp"
										onkeyup="verifyOTP('profile_mobile_otp')"
										class="shadow-none with-border">
									</div>
								</div>
							</form>
							
							<form method="post" id="mobile_password" style="display:none;" name="chnage_password"
							action="WebCntrl/after_mobile_password">
								<div class="grid grid-cols-2 gap-3 lg:p-6 p-4">
									<div>
										<label for="">New password</label>
										<input type="password" placeholder="New password" name="password"
										class="shadow-none with-border">
										
									</div>
									<div>
										<label for="">Confirm Password</label>
										<input type="password" placeholder="Confirm_password" name="confirm_password"
										class="shadow-none with-border">
									</div>
								</div>
								<div class="bg-gray-10 p-6 pt-0 flex justify-center space-x-3">
									<button id="change_password" type="button" onclick="changepassword('after_mobile')"
									class="button bg-blue-700"> Submit
									</button>
								</div>
							</form>
						</div>
						
					</div>
					
				</div>
				
				
				<div class="p-1 mt-12">
					<div id="Privacy">
						<div>
							<h3 class="text-xl mb-2 font-semibold"> Privacy</h3>
							<p> Lorem ipsum dolor sit amet nibh consectetuer adipiscing elit</p>
						</div>
						<div class="bg-white rounded-md lg:shadow-lg shadow col-span-2 lg:p-6 p-4 lg:mx-16">
							
							<div class="space-y-3">
								<div class="flex justify-between items-center">
									<div>
										<h4> Who can follow me ?</h4>
										<div> Lorem ipsum dolor sit amet, consectetuer adipiscing elit,</div>
									</div>
									<div class="switches-list -mt-8 is-large">
										<div class="switch-container">
											<label class="switch"><input type="checkbox"><span
											class="switch-button"></span> </label>
										</div>
									</div>
								</div>
								<hr>
								<div class="flex justify-between items-center">
									<div>
										<h4> Show my activities ?</h4>
										<div> Lorem ipsum dolor sit amet, consectetuer adipiscing elit,</div>
									</div>
									<div class="switches-list -mt-8 is-large">
										<div class="switch-container">
											<label class="switch"><input type="checkbox" checked><span
											class="switch-button"></span> </label>
										</div>
									</div>
								</div>
								<hr>
								<div class="flex justify-between items-center">
									<div>
										<h4> Search engines?</h4>
										<div> Lorem ipsum dolor sit amet, consectetuer adipiscing elit,</div>
									</div>
									<div class="switches-list -mt-8 is-large">
										<div class="switch-container">
											<label class="switch"><input type="checkbox"><span
											class="switch-button"></span> </label>
										</div>
									</div>
								</div>
								<hr>
								<div class="flex justify-between items-center">
									<div>
										<h4> Allow Commenting?</h4>
										<div> Lorem ipsum dolor sit amet, consectetuer adipiscing elit,</div>
									</div>
									<div class="switches-list -mt-8 is-large">
										<div class="switch-container">
											<label class="switch"><input type="checkbox"><span
											class="switch-button"></span> </label>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="p-1">
					<div class="header_dropdown notfication m-12">
						<div class="note-sec">
							<div class="drop_headline">
								<h4>Notifications </h4>
								<!--<div class="btn_action">
									<a href="#" data-tippy-placement="left" title="Notifications">
									<ion-icon name="settings-outline"></ion-icon>
									</a>
									<a href="#" data-tippy-placement="left" title="Mark as read all">
									<ion-icon name="checkbox-outline"></ion-icon>
									</a>
								</div>-->
							</div>
							<ul>
								<li>
									<a href="#">
										<div class="drop_avatar">
											<img src="assets/images/avatars/avatar-1.jpg" alt="">
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
				</div>
			</div>
		</div>
	</div>
</div>

<?php echo $layout['message']?>
<?php echo $layout['footer']?>
<?php echo $layout['js']?>
<!-- partial -->
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>

<script>
	$('#Country').change(function () {
		var country = $('#Country').val();
		$.ajax({
			type: 'post',
			url: '<?php echo base_url('SettingCntrl/get_State');?>',
			data :{country:country},
			error:function () {
				alert('something Went Wrong');
			},
			success:function (data) {
				var dataObj = JSON.parse(data);
				$('#State').empty();
				$('#State').append('<option>Select State</option>');
				$.each(dataObj, function (i, d) {
					$('#State').append('<option value="' + d.id + '">' + d.name + '</option>');
				});
			}
		});
	});
	
	$('#State').change(function () {
		var state = $('#State').val();
		$.ajax({
			type: 'post',
			url: '<?php echo base_url('SettingCntrl/get_city');?>',
			data:{state:state},
			error:function () {
				alert('something Went Wrong');
			},
			success:function (data) {
				var dataObj = JSON.parse(data);
				$('#City').empty();
				$('#City').append('<option>Select City</option>');
				$.each(dataObj, function (i, d) {
					$('#City').append('<option value="' + d.id + '">' + d.name + '</option>');
				});
			}
		});
	});
	
	$('#reg_form').on('submit', function (e) {
		e.preventDefault();
		var formData = new FormData($('#reg_form')[0]);
		$.ajax({
			type: "POST",
			url: '<?php echo site_url('SettingCntrl/update_user');?>',
			data: formData,
			processData:false,
			contentType:false,
			cache:false,
			async:false,
			success:function (responce) {
				var res = JSON.parse(responce);
				if (res['status'] == 1) {
					document.getElementById('success_msg_subject').innerHTML = res['message'];
					$('#success_msg').delay(3000).hide('slow');
					$('#success_msg').css('display', 'block');
					window.location.reload();
					} else {
					document.getElementById('error_msg_subject').innerHTML = res['message'];
					$('#error_msg').delay(3000).hide('slow');
					$('#error_msg').css('display', 'block');
				}
			}
		});
		return false;
	});
	
	$('#email').keyup(function () {
		var email1 = $('#email').val();
		if (IsEmail(email1) == false) {
			if (email1 != '') {
				$.ajax({
					type: 'post',
					url: '<?php echo base_url('SettingCntrl/check_email')?>',
					data :{email1:email1},
					success:function (response) {
						var res = JSON.parse(response);
						if (res['status'] == 1) {
							document.getElementById('success-msg').innerText = res['message'];
							$('#success-msg').delay(3000).hide('slow');
							$('#success-msg').css('display', 'block');
							
							} else {
							document.getElementById('errorModel').innerText = res['message'];
							$('#errorModel').delay(3000).hide('slow');
							$('#errorModel').css('display', 'block');
						}
					}
				});
			}
		}
	});
	
	$('#mobile').keyup(function () {
		var mobile = $('#mobile').val();
		var pattern = /^[0-9]+$/;
		if (mobile.length == 10) {
			if (mobile != '') {
				$.ajax({
					type: 'post',
					url: '<?php echo base_url('SettingCntrl/check_mobile')?>',
					data:{mobile:mobile},
					success:function (response) {
						var res = JSON.parse(response);
						if (res['status'] == 1) {
							document.getElementById('success-msg').innerText = res['message'];
							$('#success-msg').css('display', 'block');
							$('#update_profile_data').attr('disabled', true);
							$('#mobile_otp').attr('readonly', false);
							$('#mobile_otp').focus();
							} else {
							document.getElementById('errorModel').innerText = res['message'];
							$('#errorModel').css('display', 'block');
						}
					}
				});
				} else if (!pattern.test(mobile)) {
				document.getElementById('errorModel').innerText = 'Only Number are allowed';
				$('#errorModel').css('display', 'block');
			}
		}
	});
	
	$('#mobile_otp').keyup(function () {
		var mobile = $('#mobile').val();
		var mobile_code = $('#mobile_otp').val();
		if (mobile_code.length == 4) {
			$.ajax({
				type: 'post',
				url: '<?php echo base_url('SettingCntrl/verify_mobile_OTP');?>',
				data:{mobile:mobile,mobile_code:mobile_code},
				dataType: "json",
				success:function (response) {
					if (response['status'] == 1) {
						document.getElementById('success-msg').innerText = response['message'];
						$('#success-msg').delay(3000).hide('slow');
						$('#success-msg').css('display', 'block');
						$('#mobile_id').attr('readonly', true);
						$('#update_profile_data').attr('disabled', false);
						} else {
						document.getElementById('success-msg').innerText = response['message'];
						$('#success-msg').css('display', 'none');
						document.getElementById('errorModel').innerText = response['message'];
						$('#errorModel').delay(3000).hide('slow');
						$('#errorModel').css('display', 'block');
					}
				}
			});
		}
	});
	
	
	function IsEmail(email1) {
		var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!regex.test(email1)) {
			return false;
			} else {
			return true;
		}
	}


	

// $("#DOB").click(function(){
//     var UserDate = $("#DOB").val();
//     var ToDate = new Date();
//     console.log(UserDate);
//
//     if (new Date(UserDate).getTime() <= ToDate.getTime()) {
//           alert("The Date must be Bigger or Equal to today date");
//           return false;
//      }
//     return true;
// });
</script>
