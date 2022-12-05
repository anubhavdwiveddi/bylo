<?php echo $layout['meta'];?>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://admin.byloapp.in//assets/css/summernote/summernote-bs4.css">
<body>
<div id="wrapper">
    <!-- Header -->
    <?php echo $layout['user_header'];?>
    <!-- sidebar -->
    <?php echo $layout['dashboard_sidebar'];?>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer uds">
            <div class="lg:space-x-12">
                <div class="lg:w-4/4">
                    <div class=" md:mb-4 mb-3">
                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="text-2xl font-semibold">Order List </h2>
                            </div>
							 <div class="col-lg-6">
                               <div class="add-blog float-right">
                                                <a href="<?php base_url(); ?>add_product" class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0" id="show_blog_add">
                                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </a>
                                                <!------ edit page modal ---->
                                            </div>
                            </div>
                        </div>
                    </div>
					<!----- product  listing --->
					
				<div class="container-fluid">
					<div class="row clearfix">
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="card product_item">
								<div class="body">
									<div class="cp_img">
										<img src="assets/images/product/ecommerce/1.png" alt="Product" class="img-fluid">
										<div class="hover">
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-material-outline-visibility"></span></a>
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-feather-edit"></span></a>
										</div>
									</div>
									<div class="product_details">
										<h5><a href="ec-product-detail.html">Simple Black Clock</a></h5>
										<ul class="product_price list-unstyled">
											<li class="new_price">₹13.00</li>
										    <li class="old_price"><del> ₹16.00 </del></li>
										</ul>
									</div>
								</div>
							</div>                
						</div>
						
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="card product_item">
								<div class="body">
									<div class="cp_img">
										<img src="assets/images/product/ecommerce/1.png" alt="Product" class="img-fluid">
										<div class="hover">
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-material-outline-visibility"></span></a>
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-feather-edit"></span></a>
										</div>
									</div>
									<div class="product_details">
										<h5><a href="ec-product-detail.html">Simple Black Clock</a></h5>
										<ul class="product_price list-unstyled">
											<li class="new_price">₹13.00</li>
										    <li class="old_price"><del> ₹16.00 </del></li>
										</ul>
									</div>
								</div>
							</div>                
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="card product_item">
								<div class="body">
									<div class="cp_img">
										<img src="assets/images/product/ecommerce/1.png" alt="Product" class="img-fluid">
										<div class="hover">
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-material-outline-visibility"></span></a>
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-feather-edit"></span></a>
										</div>
									</div>
									<div class="product_details">
										<h5><a href="ec-product-detail.html">Simple Black Clock</a></h5>
										<ul class="product_price list-unstyled">
											<li class="new_price">₹13.00</li>
										    <li class="old_price"><del> ₹16.00 </del></li>
										</ul>
									</div>
								</div>
							</div>                
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="card product_item">
								<div class="body">
									<div class="cp_img">
										<img src="assets/images/product/ecommerce/1.png" alt="Product" class="img-fluid">
										<div class="hover">
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-material-outline-visibility"></span></a>
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-feather-edit"></span></a>
										</div>
									</div>
									<div class="product_details">
										<h5><a href="ec-product-detail.html">Simple Black Clock</a></h5>
										<ul class="product_price list-unstyled">
											<li class="new_price">₹13.00</li>
										    <li class="old_price"><del> ₹16.00 </del></li>
										</ul>
									</div>
								</div>
							</div>                
						</div>
						<div class="col-lg-3 col-md-4 col-sm-12">
							<div class="card product_item">
								<div class="body">
									<div class="cp_img">
										<img src="assets/images/product/ecommerce/1.png" alt="Product" class="img-fluid">
										<div class="hover">
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-material-outline-visibility"></span></a>
											<a href="javascript:void(0);" class="btn btn-primary waves-effect"><span class="icon-feather-edit"></span></a>
										</div>
									</div>
									<div class="product_details">
										<h5><a href="ec-product-detail.html">Simple Black Clock</a></h5>
										<ul class="product_price list-unstyled">
											<li class="new_price">₹13.00</li>
										    <li class="old_price"><del> ₹16.00 </del></li>
										</ul>
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

<!-- open chat box -->
<?php echo $layout['message']?>
</div>

<?php echo $layout['footer']?>
<?php echo $layout['js']?>


</body>
</html>
