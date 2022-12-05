<?php $data = login_user_data();
?>

      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,600&display=swap" rel="stylesheet">
	  
	  <!-- sidebar -->
        <div class="sidebar user-sidebar">
        
            <div class="sidebar_inner " data-simplebar>
			<h4 class="text-1xl font-semibold"> User Dashboard </h4>
                <ul class="side_links" >
                    <li><a href="<?php base_url(); ?>all_blog_listing">  <span class="icon-material-outline-assignment side-icon"> </span>  <span> Blog  </span> </a> 
                    </li>
					
					<li><a href="<?php base_url(); ?>all_job_listing"> <span class="icon-feather-briefcase side-icon"> </span>  <span> Job  </span> </a> 
                    </li>
					
                    <li><a href="#"><span class="icon-feather-shopping-bag side-icon"></span> <span> Product  </span> </a>
                        <ul> 
                            <li><a href="<?php base_url(); ?>all_product_listing"> Product </a></li>
                          <!--  <li><a href="<?php base_url(); ?>product_list"> Product List </a></li>-->
                            <li><a href="<?php base_url(); ?>order_history"> Order History </a></li>
                        </ul>
                    </li> 
                    <li><a href="#"> <ion-icon name="document-outline" class="side-icon"></ion-icon> <span> Create Content </span>  </a> 
                        <ul>
                            <li><a href="create-group.html"> Create Group </a></li>
                            <li><a href="create-page.html"> Create Page </a></li> 
                        </ul>
                    </li>
                    <li><a href="#"> <ion-icon name="code-slash-outline" class="side-icon"></ion-icon> <span> Development  </span> </a>
                        <ul> 
                            <li><a href="development-components.html"> Compounents </a></li>
                            <li><a href="development-plugins.html"> Plugins </a></li>
                            <li><a href="development-icons.html"> Icons </a></li>
                        </ul>
                    </li>
                    <li><a href="#"> <ion-icon name="log-in-outline" class="side-icon"></ion-icon> <span>  Authentication  </span>  </a>
                        <ul>
                            <li><a href="form-login.html">form login </a></li>
                            <li><a href="form-register.html">form register</a></li>
                        </ul>
                    </li>
                    
                </ul>

             
 
            </div>

            <!-- sidebar overly for mobile -->
            <div class="side_overly" uk-toggle="target: #wrapper ; cls: is-collapse is-active"></div>

        </div>