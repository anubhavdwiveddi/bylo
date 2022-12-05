<?php echo $layout['meta']?>
<style>
	div#qnimate {
		margin-bottom: 55px;
		height: 400px;
	}
</style>
<body>
    <div id="wrapper">

        <!-- Header -->
        <?php echo $layout['header']?>

        <!-- sidebar -->
        <?php echo $layout['sidebar']?>
        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer relative">
                 <!--  Feeds  -->
                 <div class="content ecommerce-page">
					<div class="block-header">
						<div class="row">
							<div class="col-lg-7 col-md-6 col-sm-12">
								<h2>Product Detail
								<small class="text-muted">Welcome to Byloapp</small>
								</h2>
							</div>
							<div class="col-lg-5 col-md-6 col-sm-12">
								<!--<ul class="breadcrumb float-md-right">
									<li class="breadcrumb-item"><a href="#"><i class="zmdi zmdi-home"></i> Byloapp</a></li>
									<li class="breadcrumb-item"><a href="#">Products</a></li>
									<li class="breadcrumb-item active">Product Detail</li>
								</ul>-->
							</div>
						</div>
					</div>
					<div class="container-fluid">
						<div class="row clearfix">
							<div class="col-lg-12">
								<div class="card">
									<div class="body">
										<div class="row">
											<div class="preview col-lg-4 col-md-12">
												<div class="preview-pic tab-content">
													<div class="tab-pane active" id="product_5"><img src="<?php echo base_url('upload/').$product_details->product_image?>" class="img-fluid"></div>
												</div>

											</div>
											<div class="details col-lg-8 col-md-12">
												<h3 class="product-title m-b-0"><?= $product_details->product_name?></h3>
												<h4 class="price m-t-0">Current Price: <span class="col-amber"><span style="font-size:20px;" class="ex">&#x20b9; <?= $product_details->product_price?></span></h4>
												<div class="rating">
													<div class="stars">
														<span class="zmdi zmdi-star col-amber"></span>
														<span class="zmdi zmdi-star col-amber"></span>
														<span class="zmdi zmdi-star col-amber"></span>
														<span class="zmdi zmdi-star col-amber"></span>
														<span class="zmdi zmdi-star-outline"></span>
													</div>
													<span class="m-l-10">41 reviews</span>
												</div>
												<hr>
												<p class="product-description"><?= $product_details->description;?></p>
												<hr>
												<!--<div class="flex add-to-card">
												    <div class="qtySelector text-center">
													  <i class="fa fa-minus decreaseQty"></i>
													  <input type="text" class="qtyValue" value="1" />
													  <i class="fa fa-plus increaseQty"></i>
													</div>
												 
													<button class="btn btn-primary btn-round waves-effect " type="button"> <a class="text-white-500" href="<?php  echo base_url();  ?>shopping_cart" > add to cart </a></button>
											   </div>-->
												<?php if(!empty($this->session->userdata('id'))) { ?>
											   <div class="mt-4">
											        <button id="addClass" value="<?= $product_details->id?>" data="<?= $product_details->id?>" onclick="product_msg('<?= $product_details->id?>', 'page')" class="btn btn-primary btn-icon btn-icon-mini btn-round waves-effect">
														<span class="icon-feather-phone"> </span> Contact Seller
													</button>
											   </div>
												<?php } ?>

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

    <?php echo $layout['footer']?>
    <?php echo $layout['js']?>
