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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
<script src="<?php echo base_url()?>/assets/js/uikit.js"></script>
<script src="<?php echo base_url()?>/assets/js/tippy.all.min.js"></script>
<script src="<?php echo base_url()?>/assets/js/simplebar.js"></script>
<script src="<?php echo base_url()?>/assets/js/custom.js"></script>	
<script src="<?php echo base_url()?>/assets/js/script.js"></script>
<script src="<?php echo base_url()?>/assets/js/firebase-messaging-sw.js"></script>
<script src="<?php echo base_url()?>/assets/js/bootstrap-select.min.js"></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

<link href="<?php echo base_url()?>/assets/css/select2.min.css" rel="stylesheet" />
<script src="<?php echo base_url()?>/assets/js/select2.min.js"></script>


<!------------crop  js ---------->
<script src='https://foliotek.github.io/Croppie/croppie.js'></script>
 <script src="<?php echo base_url()?>/assets/js/custom-script.js"></script>

<!--- data table link --->

<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://admin.byloapp.in/assets/css/summernote/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!----- emoji js --->
<script src="<?php echo base_url()?>/assets/js/meteorEmoji.js"></script>
  <script>
    (() => {
      new MeteorEmoji()
    })()
  </script>
<script type="text/javascript">
        $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>

<script type="text/javascript">

 /************* image upload js ********/

 $(document).ready(function(){

  $("#imageUpload").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#imagePreview').attr('src', evt.target.result);
    $('#imagePreview').hide();
    $('#imagePreview').fadeIn(650);
    $('#save_crop').css('display', 'block');
    $('#Edit_crop_hide').css('display', 'none');
   }

  });


  $('#cancel_crop').click(function(data) {
   var imageFile = data.target.files[0];
   console.log(imageFile);
   document.getElementById("imageUpload").src == "";

  });


 });

 function IsEmail(email2) {
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if(!regex.test(email2)) {
   return false;
  }else{
   return true;
  }
 }

 /************* image upload js ********/

 $(document).ready(function(){

  $("#imageUpload1").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#imagePreview1').attr('src', evt.target.result);
    $('#imagePreview1').hide();
    $('#imagePreview1').fadeIn(650);
   }

  });

 });

/************user banner upload ************/

 $(document).ready(function(){

  $("#imageUploadbanner").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#imagePreviewbanner1').attr('src', evt.target.result);
    $('#imagePreviewbanner1').hide();
    $('#imagePreviewbanner1').fadeIn(650);
   }

  });

 });

/************page banner upload ************/

 $(document).ready(function(){

  $("#image_Upload_page_banner").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#image_Preview_page_banner').attr('src', evt.target.result);
    $('#image_Preview_page_banner').hide();
    $(image_Preview_page_banner).fadeIn(650);
   }

  });

 });

 /************* image upload js ********/

 $(document).ready(function(){

  $("#imageUpload3").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#imagePreview3').attr('src', evt.target.result);
    $('#imagePreview3').hide();
    $('#imagePreview3').fadeIn(650);
    $('.profile-update').css('display', 'block');
   }

  });



 });


 /****************feed image uplaod ************/

 $(document).ready(function(){

  $("#postimg").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#imgPreview').attr('src', evt.target.result);
    $('#imgPreview').hide();
    $('#imgPreview').fadeIn(650);
	 $('#imgPreview-remove').show();
	 $(".all-post-content").addClass("two_file_upload");
	  $(".post-image-row").css('display', 'block');
   }

  });

 });

 $("#imgPreview-remove").click(function(e) {
  e.preventDefault();
  $("#imag3").val("");
  $("#imgPreview").attr("src", "");
  $('#imgPreview-remove').hide('imgPreview-remove');
    $(".post-image-row").css('display', 'none');
 });
 
 /************* image upload js ********/

 $(document).ready(function(){

  $("#file-input").change(function(data){

   var imageFile = data.target.files[0];
   var reader = new FileReader();
   reader.readAsDataURL(imageFile);

   reader.onload = function(evt){
    $('#video').attr('src', evt.target.result);
    $('#video').hide();
    $('#video').fadeIn(650);
   }

  });

 });

 /******* add video js *************/
 // const input = document.getElementById('file-input');
 // const video = document.getElementById('video');
 // const videoSource = document.createElement('source');
 //
 // input.addEventListener('change', function() {
 //  const files = this.files || [];
 //
 //  if (!files.length) return;
 //
 //  const reader = new FileReader();
 //
 //  reader.onload = function (e) {
 //   videoSource.setAttribute('src', e.target.result);
 //   video.appendChild(videoSource);
 //   video.load();
 //   video.play();
 //  };
 //
 //  reader.onprogress = function (e) {
 //   console.log('progress: ', Math.round((e.loaded * 100) / e.total));
 //  };
 //
 //  reader.readAsDataURL(files[0]);
 // });


</script>

<script type="text/javascript">


 /***********hide show about **********/


 $(document).ready(function(){
  $("#showmenu").click(function(){
   $("#edit_about").css('display', 'block');
   $("#page_about").css('display', 'none');
  });

  $("#bach_btn").click(function(){
   $("#edit_about").css('display', 'none');
   $("#page_about").css('display', 'block');
  });


 });
 

 /***********hide show Blog add **********/

 $(document).ready(function(){
  $("#show_blog_add").click(function(){
   $("#add_blog_form").css('display', 'block');
   $("#blog_content").css('display', 'none');
  });

  $("#bach_btn_add_blog").click(function(){
   $("#add_blog_form").css('display', 'none');
   $("#blog_content").css('display', 'block');
  });
 });
 
 
 
  /***********hide show Blog edit **********/

 $(document).ready(function(){
  $(".show_blog_edit").click(function(){
   $("#edit_blog").css('display', 'block');
   $("#blog_content").css('display', 'none');
  });

  $("#bach_btn_blog").click(function(){
   $("#edit_blog").css('display', 'none');
   $("#blog_content").css('display', 'block');
  });

 });
 
 
  /***********hide show job add **********/

 $(document).ready(function(){
  $("#show_job_add_btn").click(function(){
   $("#show_job_form").css('display', 'block');
   $("#job_content").css('display', 'none');
  });

  $("#show_job_back_btn").click(function(){
   $("#show_job_form").css('display', 'none');
   $("#job_content").css('display', 'block');
  });
 });
 
 
   /***********hide show job edit**********/

	 $(document).ready(function(){
	  $("#show_job_edit_btn").click(function(){
	   $("#show_job_edit_form").css('display', 'block');
	   $("#job_content").css('display', 'none');
	  });

	  $("#show_job_back_edit_btn").click(function(){
	   $("#show_job_edit_form").css('display', 'none');
	   $("#job_content").css('display', 'block');
	  });
	 });
	 

	 
	 
       /***********hide show Blog add **********/

		 $(document).ready(function(){
		  $("#show_blog_add").click(function(){
		   $("#add_blog_form").css('display', 'block');
		   $("#blog_content").css('display', 'none');
		  });
		 });
		 
 
    $(document).ready(function() {
		$('.select2').select2({
		closeOnSelect: false
		});
		});

</script>

<script>
 $('.select2').select2();
</script>


<script>
 $(function(){
  $('#myselect').change(function(){
   var selected = $(this).find('option:selected');
   $('#text').html(selected.text());
  }).change();
 });
</script>

 

<script>
 $(document).ready(function(){
  $(".mul-select").select2({
   placeholder: "Select schedule", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $(".myselect").select2({
   placeholder: "Search Friends", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $("#contract").select2({
   placeholder: "Select Contract ", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $("#pay-offered").select2({
   placeholder: "Pay Offered", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $("#benefits-offered").select2({
   placeholder: "benefits offered", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $("#select-bs-page").select2({
   placeholder: "Select Page", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })
 
 
  $(document).ready(function(){
  $("#select-bs-page-job").select2({
   placeholder: "Select Page", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(document).ready(function(){
  $("#invite_friend").select2({
   placeholder: "Invite Friends", //placeholder
   tags: true,
   tokenSeparators: ['/',',',';'," "]
  });
 })

 $(function() {
  $("input[name='chkPinNo']").click(function() {
   if ($("#chkYes").is(":checked")) {
    $("#dvPinNo").show();
   } else {
    $("#dvPinNo").hide();
   }
  });
 });

</script>
<script>

 $(function() {
  $("input[name='chkPinNo1']").click(function() {
   if ($("#chkYes1").is(":checked")) {
    $("#dvPinNo1").show();
   } else {
    $("#dvPinNo1").hide();
   }
  });
 });


</script>

 
<script>
 /***************  no of job js **************/

 function incrementValue(e) {
  e.preventDefault();
  var fieldName = $(e.target).data('field');
  var parent = $(e.target).closest('div');
  var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

  if (!isNaN(currentVal)) {
   parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
  } else {
   parent.find('input[name=' + fieldName + ']').val(0);
  }
 }

 function decrementValue(e) {
  e.preventDefault();
  var fieldName = $(e.target).data('field');
  var parent = $(e.target).closest('div');
  var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

  if (!isNaN(currentVal) && currentVal > 0) {
   parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
  } else {
   parent.find('input[name=' + fieldName + ']').val(0);
  }
 }

 $('.input-group').on('click', '.button-plus', function(e) {
  incrementValue(e);
 });

 $('.input-group').on('click', '.button-minus', function(e) {
  decrementValue(e);
 });

 function Mystory(value){
  var name = value;

  if (name == 'Image_story'){
   $('.story-post').css('display', 'block');
   $('.upload_img').css('display', 'block');
   $('#upload_image').css('display', 'none');
   $('.feed_content').css('display', 'none');

  } else {
   $('.story-post').css('display', 'block');
   $('.hide_text').css('display', 'none');
   $('#upload_image').css('display', 'none');
  }
 }


</script>


<script>
 /***** live text ************/
 $(document).ready(function () {
  $('#desc').keyup(function(){
   $('#live-preview').html($(this).val());
  });

 });
</script>

<script>
 /************live text ***********/
 $(document).ready(function () {
  $('#story').keyup(function(){
   $('#live-preview-text').html($(this).val());
  });

 });
</script>

<script>

 /***********hide show Group **********/

 $(document).ready(function(){
  $("#groupmenu").click(function(){
   $("#edit_about_group").css('display', 'block');
   $("#group_about").css('display', 'none');
  });

  $("#group_bach_btn").click(function(){
   $("#edit_about_group").css('display', 'none');
   $("#group_about").css('display', 'block');
  });


 });


</script>

<script>

 var $temp = $("<input>");
 var $url = $(location).attr('href');

 $('.clipboard').on('click', function() {
  $("body").append($temp);
  $temp.val($url).select();
  document.execCommand("copy");
  $temp.remove();
  $(".copy_url").text("Copied!");
 })




</script>


<!---- page nav tab url js--->
<script type="text/javascript">
 $(function(){
  var hash = window.location.hash;
  hash && $('ul.nav a[href="' + hash + '"]').tab('show');

  $('.nav-tabs a').click(function (e) {
   $(this).tab('show');
   var scrollmem = $('body').scrollTop();
   window.location.hash = this.hash;
   $('html,body').scrollTop(scrollmem);
  });
 });

</script>

<script>
 $('.nav-link').click(function(e) {
  return false;
 });
</script>

<script>
 // $(function() {
 //  window.emojiPicker = new EmojiPicker({
 //   emojiable_selector: '[data-emojiable=true]',
 //   assetsPath: 'http://onesignal.github.io/emoji-picker/lib/img/',
 //   popupButtonClasses: 'fa fa-smile-o'
 //  });
 //  window.emojiPicker.discover();
 // });
</script>


<!--******* post comment image js ************ -->
<script>
 function readURL(input, imgControlName) {
  if (input.files && input.files[0]) {
   var reader = new FileReader();
   reader.onload = function(e) {
    $(imgControlName).attr('src', e.target.result);
   }
   reader.readAsDataURL(input.files[0]);
  }
 }

 $("#imag").change(function() {
  // add your logic to decide which image control you'll use
  var imgControlName = "#Imgview";
  readURL(this, imgControlName);
  $('.preview1').addClass('it');
  $('.btn-rmv1').addClass('rmv');
  $('.preview1').addClass('img-d');
 });

 $("#imag2").change(function() {
  // add your logic to decide which image control you'll use
  var imgControlName = "#Imgview2";
  readURL(this, imgControlName);
  $('.preview2').addClass('it');
  $('.btn-rmv2').addClass('rmv');
  $('.preview2').addClass('img-d2');
 });

 $("#imag3").change(function() {
  // add your logic to decide which image control you'll use
  var imgControlName = "#Imgview3";
  readURL(this, imgControlName);
  $('.preview3').addClass('it');
  $('.btn-rmv3').addClass('rmv');
  $('.preview3').addClass('img-d3');
 });

 $("#removeImage1").click(function(e) {
  e.preventDefault();
  $("#imag").val("");
  $("#Imgview").attr("src", "");
  $('.preview1').removeClass('it');
  $('.btn-rmv1').removeClass('rmv');
  $('.preview1').removeClass('img-d');
 });

 $("#removeImage2").click(function(e) {
  e.preventDefault();
  $("#imag2").val("");
  $("#Imgview2").attr("src", "");
  $('.preview2').removeClass('it');
  $('.btn-rmv2').removeClass('rmv');
  $('.preview2').removeClass('img-d2');
 });

 $("#removeImage3").click(function(e) {
  e.preventDefault();
  $("#imag3").val("");
  $("#Imgview3").attr("src", "");
  $('.preview3').removeClass('it');
  $('.btn-rmv3').removeClass('rmv');
  $('.preview3').removeClass('img-d3');
 });

</script>

<script>

function post_replay(value){
	$('#replay_'+value).css('display', 'block');
}      
	
</script>

<script>
  /********* Select tag dropdown js*********/
	$(document).ready(function () {

		var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
			removeItemButton: true,

		});

	});
	
	$(document).ready(function () {

		var multipleCancelButton = new Choices('.choices-multiple-remove-button', {
			removeItemButton: true,

		});

	});

</script>

<script>
   $(window).on('load',function(){
    var delayMs = 1500; // delay in milliseconds
    
    setTimeout(function(){
        $('#login_bylo').modal('show');
    }, delayMs);
}); 

</script>