<?php echo $layout['meta'];?>
<style>
/* Styles */
/* Page Defults */
html {
		height: 100%;
		overflow: hidden;
	}

	body {
		height:100%;
		overflow: auto;
		-webkit-overflow-scrolling: touch;
	}
	
	body{
		height:100%;
		
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-position: center;
	}

	#cspio-page{
		background-color: rgba(0,0,0,0);
	}
	
	.flexbox #cspio-page{
		align-items: center;
		justify-content: center;
	}

	.cspio body, .cspio body p{
        font-family: Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
        font-size: 20px;
        line-height: 1.50em;
        color:#ffffff;
    }

	::-webkit-input-placeholder {
		font-family:Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
	}

	::-moz-placeholder {
		font-family:Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
	} 

	:-ms-input-placeholder {
		font-family:Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
	} 

	:-moz-placeholder {
		font-family:Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
	}

    .cspio h1, .cspio h2, .cspio h3, .cspio h4, .cspio h5, .cspio h6{
        font-family: 'Pacifico';
        color:#ffffff;
    }

	#cspio-headline{
		font-family: 'Pacifico';
		font-weight: 400;
		font-style: ;
				font-size: 48px;
		color:#ffffff;
		line-height: 1.00em;
	}

	.cspio button{
        font-family: Helvetica, Arial, sans-serif;
		font-weight: 400;
		font-style: ;
    }
	
    .cspio a, .cspio a:visited, .cspio a:hover, .cspio a:active{
		color: #ffffff;
	}

	#cspio-socialprofiles a {
	  color: #ffffff;
	}
	.cspio .btn-primary,
	.cspio .btn-primary:focus,
	.gform_button,
	#mc-embedded-subscribe, .submit-button {
		color: black;
		text-shadow: 0 -1px 0 rgba(255,255,255,0.3);
		background-color: #ffffff;
		background-image: -moz-linear-gradient(top,#ffffff,#d9d9d9);
		background-image: -ms-linear-gradient(top,#ffffff,#d9d9d9);
		background-image: -webkit-gradient(linear,0 0,0 100%,from(#ffffff),to(#d9d9d9));
		background-image: -webkit-linear-gradient(top,#ffffff,#d9d9d9);
		background-image: -o-linear-gradient(top,#ffffff,#d9d9d9);
		background-image: linear-gradient(top,#ffffff,#d9d9d9);
		background-repeat: repeat-x;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#d9d9d9', GradientType=0);
		border-color: #d9d9d9 #d9d9d9 #b3b3b3;
		border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
		*background-color: #d9d9d9;
		filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
	}

	.cspio .btn-primary:hover,
	.cspio .btn-primary:active,
	.cspio .btn-primary.active,
	.cspio .btn-primary.disabled,
	.cspio .btn-primary[disabled],
	.cspio .btn-primary:focus:hover,
	.cspio .btn-primary:focus:active,
	.cspio .btn-primary:focus.active,
	.cspio .btn-primary:focus.disabled,
	.cspio .btn-primary:focus[disabled],
	#mc-embedded-subscribe:hover,
	#mc-embedded-subscribe:active,
	#mc-embedded-subscribe.active,
	#mc-embedded-subscribe.disabled,
	#mc-embedded-subscribe[disabled] {
		background-color: #d9d9d9;
		*background-color: #cccccc;
	}

	.cspio .btn-primary:active,
	.cspio .btn-primary.active,
	.cspio .btn-primary:focus:active,
	.cspio .btn-primary:focus.active,
	.gform_button:active,
	.gform_button.active,
	#mc-embedded-subscribe:active,
	#mc-embedded-subscribe.active {
		background-color: #bfbfbf;
	}

	.form-control,
	.progress {
		background-color: rgba(255, 255, 255, 0.85);
	}

	#cspio-progressbar span,
	.countdown_section {
		color: black;
		text-shadow: 0 -1px 0 rgba(255,255,255,0.3);
	}

	.cspio .btn-primary:hover,
	.cspio .btn-primary:active {
		color: black;
		text-shadow: 0 -1px 0 rgba(255,255,255,0.3);
		border-color: #e6e6e6;
	}

	.cspio input[type='text']:focus {
		webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(217,217,217,0.6);
		-moz-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(217,217,217,0.6);
		box-shadow: inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(217,217,217,0.6);
	}
    
    
	.cspio .progress-bar,
	.countdown_section,
	.cspio .btn-primary,
	.cspio .btn-primary:focus,
	.gform_button {
		background-image: none;
		text-shadow: none;
	}

	.cspio input,
	.cspio input:focus {
		-webkit-box-shadow: none !important;
		box-shadow: none !important;
	}
							
	#cspio-page{
	    background: -moz-radial-gradient(ellipse at center, rgba(0, 0, 0, 0.3) 0%,rgba(0, 0, 0, 0.2) 37%,rgba(0,0,0,0) 68%,rgba(0,0,0,0) 100%);
	    background: -webkit-radial-gradient(ellipse at center, rgba(0, 0, 0, 0.3) 0%,rgba(0, 0, 0, 0.2) 37%,rgba(0,0,0,0) 68%,rgba(0,0,0,0) 100%);
	    background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.3) 0%,rgba(0, 0, 0, 0.2) 37%,rgba(0,0,0,0) 68%,rgba(0,0,0,0) 100%);
	}

	

	#cspio-subscribe-btn{
	    background:transparent;
	    border: 1px solid #fff !important;
	    color: #fff;
	}

	#cspio-subscribe-btn:hover{
	    background: rgba(255,255,255,0.2);
	    color: #fff;
	}

	#cspio-credit img{
		margin-left:auto;
		margin-right:auto;
		width:125px;
		    margin-top: -4px;
	}

	#cspio-credit {
		font-size:11px;
	}


html{
	height: 100%;
  margin-top: 0 !important;
}
body{
	text-align:center;
	padding:0 0px;
	height:100%;
}
body:before {
    content: '';
    min-height: 100%;
    width: 100%;
        background: #000;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    opacity: .3;
}
.placeholder { color: #aaa; }

#cspio-page{
	padding-top:60px;
	padding-bottom:0px;
	padding-left:10px;
	padding-right:10px;
 	min-height: 100%;
}

.flexbox #cspio-page{
	display:flex;
	padding:10px;
}

.flexbox #cspio-content{
	margin:0;
}

/* Margins */
#cspio-description,#cspio-logo, #cspio-socialprofiles,#cspio-privacy-policy-txt, #cspio-headline,#cspio-progressbar,#cspio-countdown,#cspio-thankyoumsg,#cspio-sharebuttons,#cspio-afterform{
	margin-bottom:30px;
}

/* Responsive Images */
#cspio-description img,#cspio-thankyoumsg img, #cspio-logo{
	max-width:100%;
	height:auto;
}

/* Content Elements */
#cspio-content{
	width:100%;
	padding:30px;
	margin:0 auto;
}

#cspio-content ul {
	list-style-position: inside;
	padding-left: 0px;
}

#cspio-headline{
	margin-top:0;
}

#cspio-name, #cspio-email, #cspio-subscribe-btn{
	margin-bottom:10px;
}

#cspio-field-wrapper{
  margin-left:auto;
  margin-right:auto;
}

.form-el{
	border-color: transparent !important;
}

.noglow {
  outline: none !important;
}


.seperate #cspio-subscribe-btn{
	margin-left:10px;
}

.cspio .seperate .input-group .form-control:first-child, .cspio .seperate .input-group-addon:first-child, .cspio .seperate .input-group-btn:first-child>.btn, .cspio .seperate .input-group-btn:first-child>.dropdown-toggle, .cspio .seperate .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle) {
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
}
.cspio .seperate .input-group .form-control:last-child, .cspio .seperate .input-group-addon:last-child, .cspio .seperate .input-group-btn:last-child>.btn, .cspio .seperate .input-group-btn:last-child>.dropdown-toggle, .cspio .seperate .input-group-btn:first-child>.btn:not(:first-child) {
	border-bottom-left-radius: 4px;
	border-top-left-radius: 4px;
}

.input-group-btn .btn{
	padding-bottom:11px;
}

#cspio-privacy-policy-txt{
	display:inline-block;
	font-size:11px;
}

#cspio-ref-out{
	color:#555;
}

/* Share Buttons */
#cspio-sharebuttons{
 	padding:0;
 	line-height: 0 !important;
}

#cspio-sharebuttons span{
	line-height: 0 !important;
}

#cspio-sharebuttons li{
	display:inline-block;
	vertical-align:top;
	overflow: hidden;
	padding: 0 5px;
}

#share_facebook{
	width: 65px;
}

#share_facebook_send{
	margin-left:7px ;
	margin-right: 4px;
}

#share_googleplus{
	width: 45px;
}

#share_pinterest{
	width: 50px;
}

.fb-share-button span{
	vertical-align: top;
}

/* Social Profiles */
#cspio-socialprofiles a{
	padding-right:7px;
	display:inline-block;
}

/* CountDown */
.countdown_section{
	display:inline-block;
	padding:10px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	margin:0 5px 10px;
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	-moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	min-width:80px;
}

.countdown_amount{
	font-size:24px;
}

/* Footer Credit */
#cspio-credit{
	font-size:10px;
	position: fixed;
	bottom:0;
	right:20px;
	background-color: rgba(0,0,0,0.8);
	padding:7px;
	border-radius:2px;
	line-height: 1;
	color: #fff;
}
#cspio-credit a{
	color: #fff;
}

#cspio-credit img {
    margin-left: -6px;
    margin-right: auto;
    width: 125px;
    margin-top: -4px;
    vertical-align: middle;
}



/* Mobile */
@media (max-width: 480px) {
	#cspio-page{
		padding-top: 10px;
	}
	.cspio .input-group-btn, .cspio .input-group{
		display:block;
		width:100%;
	}
	.cspio #cspio-subscribe-btn{
		margin-left:0;
		width:100%;
		display:block;
	}
	
	.cspio .input-group .form-control:first-child, .cspio .input-group-addon:first-child, .cspio .input-group-btn:first-child>.btn, .cspio .input-group-btn:first-child>.dropdown-toggle, .cspio .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle) {
		border-bottom-right-radius: 4px;
		border-top-right-radius: 4px;
	}
	.cspio .input-group .form-control:last-child, .cspio .input-group-addon:last-child, .cspio .input-group-btn:last-child>.btn, .cspio .input-group-btn:last-child>.dropdown-toggle, .cspio .input-group-btn:first-child>.btn:not(:first-child) {
		border-bottom-left-radius: 4px;
		border-top-left-radius: 4px;
	}
	.countdown_section{
		margin-bottom: 10px !important;
	}
	
	#cspio-field-wrapper{
	  width:100%;
	}

	#cspio-credit{
		position:static;
		margin-top:20px;
	}

	.flexbox #cspio-page{
	display:flex;
	padding:10px;
	flex-direction: column;
	}
}

/* Gravity Forms */
#gforms_confirmation_message {
  background-color: transparent !important;
  border: none !important;
}

.gform_wrapper ul {
	padding-left: 0;
	list-style: none; }

.gform_wrapper li {
margin-bottom: 15px; }

.gform_wrapper form {
margin-bottom: 0; }

.gform_wrapper .gfield_required {
padding-left: 1px;
color: #b94a48; }

.ginput_container input, .ginput_container select, .ginput_container textarea {
display: block;
width: 100%;
height: 34px;
padding: 6px 12px;
font-size: 14px;
line-height: 1.428571429;
color: #555;
vertical-align: middle;
background-color: #fff;
border: 1px solid #ccc;
border-radius: 4px;
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
-webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; }

.ginput_container input:-moz-placeholder, .ginput_container select:-moz-placeholder, .ginput_container textarea:-moz-placeholder {
color: #aaa; }

.ginput_container input::-moz-placeholder, .ginput_container select::-moz-placeholder, .ginput_container textarea::-moz-placeholder {
color: #aaa; }

.ginput_container input:-ms-input-placeholder, .ginput_container select:-ms-input-placeholder, .ginput_container textarea:-ms-input-placeholder {
color: #aaa; }

.ginput_container input::-webkit-input-placeholder, .ginput_container select::-webkit-input-placeholder, .ginput_container textarea::-webkit-input-placeholder {
color: #aaa; }

.ginput_container input:focus, .ginput_container select:focus, .ginput_container textarea:focus {
border-color: #66afe9;
outline: 0;
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6);
box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, 0.6); }

.ginput_container input[disabled], .ginput_container select[disabled], .ginput_container textarea[disabled], .ginput_container input[readonly], .ginput_container select[readonly], .ginput_container textarea[readonly], fieldset[disabled] .ginput_container input, fieldset[disabled] .ginput_container select, fieldset[disabled] .ginput_container textarea {
cursor: not-allowed;
background-color: #eee; }

textarea.ginput_container input, textarea.ginput_container select, textarea.ginput_container textarea {
height: auto; }

.ginput_container textarea {
height: auto; }

.gform_button {
display: inline-block;
padding: 6px 12px;
margin-bottom: 0;
font-size: 14px;
font-weight: normal;
line-height: 1.428571429;
text-align: center;
vertical-align: middle;
cursor: pointer;
border: 1px solid transparent;
border-radius: 4px;
white-space: nowrap;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
-o-user-select: none;
user-select: none;
color: #fff;
background-color: #428bca;
border-color: #357ebd; }

.gform_button:focus {
outline: thin dotted #333;
outline: 5px auto -webkit-focus-ring-color;
outline-offset: -2px; }

.gform_button:hover, .gform_button:focus {
color: #333;
text-decoration: none; }

.gform_button:active, .gform_button.active {
outline: 0;
background-image: none;
-webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); }

.gform_button.disabled, .gform_button[disabled], fieldset[disabled] .gform_button {
cursor: not-allowed;
pointer-events: none;
opacity: .65;
filter: alpha(opacity=65);
-webkit-box-shadow: none;
box-shadow: none; }

.gform_button:hover, .gform_button:focus, .gform_button:active, .gform_button.active, .open .dropdown-toggle.gform_button {
color: #fff;
background-color: #3276b1;
border-color: #285e8e; }

.gform_button:active, .gform_button.active, .open .dropdown-toggle.gform_button {
background-image: none; }

.gform_button.disabled, .gform_button[disabled], fieldset[disabled] .gform_button, .gform_button.disabled:hover, .gform_button[disabled]:hover, fieldset[disabled] .gform_button:hover, .gform_button.disabled:focus, .gform_button[disabled]:focus, fieldset[disabled] .gform_button:focus, .gform_button.disabled:active, .gform_button[disabled]:active, fieldset[disabled] .gform_button:active, .gform_button.disabled.active, .gform_button[disabled].active, fieldset[disabled] .gform_button.active {
background-color: #428bca;
border-color: #357ebd; }

.gform_wrapper .gfield_error .gfield_label {
color: #b94a48; }

.gform_wrapper .gfield_error input, .gform_wrapper .gfield_error select, .gform_wrapper .gfield_error textarea {
border-color: #eed3d7;
background-color: #f2dede;
color: #b94a48; }

.gform_wrapper .gfield_error input:focus, .gform_wrapper .gfield_error select:focus, .gform_wrapper .gfield_error textarea:focus {
border-color: #b94a48;
outline: 0;
-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(185, 74, 72, 0.6);
box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(185, 74, 72, 0.6); }

.validation_error {
padding: 15px;
margin-bottom: 20px;
border: 1px solid transparent;
border-radius: 4px;
background-color: #f2dede;
border-color: #eed3d7;
color: #b94a48; }

.validation_error h4 {
margin-top: 0;
color: inherit; }

.validation_error .alert-link {
font-weight: bold; }

.validation_error>p, .validation_error>ul {
margin-bottom: 0; }

.validation_error>p+p {
margin-top: 5px; }

.validation_error hr {
border-top-color: #e6c1c7; }

.validation_error .alert-link {
color: #953b39; }

#gforms_confirmation_message {
padding: 15px;
margin-bottom: 20px;
border: 1px solid transparent;
border-radius: 4px; }

#gforms_confirmation_message h4 {
margin-top: 0;
color: inherit; }

#gforms_confirmation_message .alert-link {
font-weight: bold; }

#gforms_confirmation_message>p, #gforms_confirmation_message>ul {
margin-bottom: 0; }

#gforms_confirmation_message>p+p {
margin-top: 5px; }

.gallery-row {
padding: 15px 0; }

.aligncenter {
display: block;
margin: 0 auto; }

.alignleft {
float: left; }

.alignright {
float: right; }

figure.alignnone {
margin-left: 0;
margin-right: 0; }

@media (max-width: 480px) {
	.gform_wrapper .ginput_complex .ginput_right {
	float: none !important;
	width: 100% !important;
	}
	.gform_wrapper .ginput_complex .ginput_left {
	float: none !important;
	width: 100% !important;
	}

	.gform_wrapper .medium {
	float: none !important;
	width: 100% !important;
	}

	.gform_button{
		margin: auto;
		width: 100%;
	}
	.gform_wrapper .ginput_complex .ginput_right input[type=text], .gform_wrapper .ginput_complex .ginput_right input[type=url], .gform_wrapper .ginput_complex .ginput_right input[type=email], .gform_wrapper .ginput_complex .ginput_right input[type=tel], .gform_wrapper .ginput_complex .ginput_right input[type=number], .gform_wrapper .ginput_complex .ginput_right input[type=password], .gform_wrapper .ginput_complex .ginput_right select {
		width: 100% !important;
	}

	.gform_wrapper .ginput_complex input[type=text], .gform_wrapper .ginput_complex input[type=url], .gform_wrapper .ginput_complex input[type=email], .gform_wrapper .ginput_complex input[type=tel], .gform_wrapper .ginput_complex input[type=number], .gform_wrapper .ginput_complex input[type=password], .gform_wrapper .ginput_complex select {
		width: 100% !important;
	}
}

/* MailChimp */
#mc_embed_signup{
	background:transparent !important;
	font:inherit !important;
}

/* MyMail */
.mymail-form{
	text-align:left;
}

/* WPML */
#lang_sel, #lang_sel_click {
	position: absolute;
	top: 0;
	right: 0;
}

/* WordPress Core */
.alignnone {
    margin: 5px 20px 20px 0;
}

.aligncenter, div.aligncenter {
    display:block;
    margin: 5px auto 5px auto;
}

.alignright {
    float:right;
    margin: 5px 0 20px 20px;
}

.alignleft {
    float:left;
    margin: 5px 20px 20px 0;
}

.aligncenter {
    display: block;
    margin: 5px auto 5px auto;
}

a img.alignright {
    float:right;
    margin: 5px 0 20px 20px;
}

a img.alignnone {
    margin: 5px 20px 20px 0;
}

a img.alignleft {
    float:left;
    margin: 5px 20px 20px 0;
}

a img.aligncenter {
    display: block;
    margin-left: auto;
    margin-right: auto
}

.wp-caption {
    background: #fff;
    border: 1px solid #f0f0f0;
    max-width: 96%; /* Image does not overflow the content area */
    padding: 5px 1px 10px;
    text-align: center;
}

.wp-caption.alignnone {
    margin: 5px 20px 20px 0;
}

.wp-caption.alignleft {
    margin: 5px 20px 20px 0;
}

.wp-caption.alignright {
    margin: 5px 0 20px 20px;
}

.wp-caption img {
    border: 0 none;
    height: auto;
    margin:0;
    max-width: 98.5%;
    padding:0;
    width: auto;
}

.wp-caption p.wp-caption-text {
    font-size:11px;
    line-height:17px;
    margin:0;
    padding:0 4px 5px;
}

.gallery {
	margin-bottom: 1.6em;
}

.gallery-item {
	display: inline-block !important;
	padding: 1.79104477%;
	text-align: center;
	vertical-align: top;
	width: 100%;
}

.gallery-columns-2 .gallery-item {
	max-width: 50%;
}

.gallery-columns-3 .gallery-item {
	max-width: 33.33%;
}

.gallery-columns-4 .gallery-item {
	max-width: 25%;
}

.gallery-columns-5 .gallery-item {
	max-width: 20%;
}

.gallery-columns-6 .gallery-item {
	max-width: 16.66%;
}

.gallery-columns-7 .gallery-item {
	max-width: 14.28%;
}

.gallery-columns-8 .gallery-item {
	max-width: 12.5%;
}

.gallery-columns-9 .gallery-item {
	max-width: 11.11%;
}

.gallery-icon img {
	margin: 0 auto;
}

.gallery-caption {
	color: #707070;
	color: rgba(51, 51, 51, 0.7);
	display: block;
	font-size: 12px;
	font-size: 1.2rem;
	line-height: 1.5;
	padding: 0.5em 0;
}

.gallery-columns-6 .gallery-caption,
.gallery-columns-7 .gallery-caption,
.gallery-columns-8 .gallery-caption,
.gallery-columns-9 .gallery-caption {
	display: none;
}



.logo a {
    font-size: 60px;
    text-transform: uppercase;
    padding-bottom: 10px;
    display: block;
    font-weight: 600;
    text-decoration: none;
}
.logo img#cspio-logo {
    width: 204px;
}
div#cspio-socialprofiles a.in-btn {
    background: #739b2f;
    text-decoration: none;
    padding: 8px 23px !important;
    font-size: 18px;
    border-radius: 8px;
}

div#cspio-page {
    position: relative;
}
</style>
<body>

<body style="background-image: url(<?php echo base_url();?>/assets/images/under_maintenance_bg.jpg);">
	<div id="cspio-page">
		<div id="cspio-content">
			<div class="logo text-center">
				<a href="#"> <img id="cspio-logo" src="<?php echo base_url();?>/assets/images/logo.png"></a>
			</div>
		
			    				
			<h1 id="cspio-headline">Coming Soon</h1>			    				
			
			<div id="cspio-description">Get ready! Something really cool is coming!</div>			    				
			
			<!-- <form id="cspio-form" action="" method="post">
				<div id="cspio-field-wrapper">
					<div class="row">
						<div class="col-md-12 seperate"><div class="input-group"><input id="cspio-email" name="EMAIL" class="form-control input-lg form-el" type="email" placeholder="Email" required/>
					<span class="input-group-btn"><button id="cspio-subscribe-btn" type="submit" class="btn btn-lg btn-primary form-el noglow">Notify Me</button></span></div></div>
					</div>
				</div>
			</form> -->
			
			<!-- <span id="cspio-privacy-policy-txt">We promise to never spam you.</span> -->
			    						    			    								    			    			    				
			<div id="cspio-socialprofiles">
				<a href="https://api.whatsapp.com/send?phone=01932503074&text=&source=&data=" class="in-btn"> <i class="fa fa-whatsapp"></i> Send Inquiry </a>
		 		
			</div>
			<div id="cspio-socialprofiles">
				 <a href="#" ><i class="fa fa-facebook-official fa-2x"></i></a>			
				<a href="#" ><i class="fa fa-instagram fa-2x"></i></a>			
				<a href="#" ><i class="fa fa-twitter fa-2x"></i></a>	 		
			</div>

		
									    									    			    			    							    			     			    		
		</div><!-- end of #cspio-content -->
	</div>
	<!-- open chat box -->
	<?php echo $layout['message']?>
</div>

<?php echo $layout['js']?>
<script>
	$('.applyjob').click(function() {
		var id = $(this).attr('data');
		var page_id = $('#page_id').val(id);
	});
</script>
</body>
</html>
