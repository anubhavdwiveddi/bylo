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
                                <h2 class="text-2xl font-semibold">Product Management </h2>
                            </div>
                        </div>
                    </div>
					<!----- blog  listing --->
					
					<div class="table-listing">
							<table  id="example"  style="width:100%" class="table table-default product-table  table-striped table-responsive-lg">
									<thead>
										<tr>
											<th>ID#</th>
											<th> Image</th>
											<th> Product Name</th>
											<th>Brands</th>
											<th>Price</th>
											<th>Categories</th>
											 <th>Status </th>
											<th>Date</th>	
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1001</td>
											<td class="product-pic"><figure class="pt-2"><img src="<?php echo base_url();?>assets/images/product/1.jpg" alt=""></figure> </td>
											<td class="product-name"><a class="text-blue-500" href="#" >Little Girls  Flared Skirt Top</a></td>
											
											<td><a class="text-blue-500" href="#"> Little Dolly  </a></td>
											<td>₹769.00</td>
											<td>Clothing</td>
											 <td>
                                               Approved
												
                                            </td>
											<td>2021/12/21 at 7:05 pm</td>
											<td>
												<div class="actions-btn">
                                                    <a href="#"> <span class="iconbox button soft-primary"><span class="icon-feather-edit">
                                    
                                    </span></span> </a>
                                                  <!--  <span class="iconbox button soft-danger"><i class="icofont-trash"></i></span> -->
                                                </div>
											</td>
										</tr>
									    <tr>
											<td>1002</td>
											<td class="product-pic"><figure><img src="<?php echo base_url();?>assets/images/product/1.jpg" alt=""></figure> </td>
											<td class="product-name"><a class="text-blue-500" href="#">Simple Black Clock</a></td>
											
											<td><a class="text-blue-500" href="#"> Byloapp </a></td>
											<td>₹769.00</td>
											<td>Electronics</td>
											 <td>
                                               Approved
												
                                            </td>
											<td>2021/12/21 at 7:05 pm</td>
											<td>
												<div class="actions-btn">
                                                    <a href="#"> <span class="iconbox button soft-primary"><span class="icon-feather-edit">
                                    
                                    </span></span> </a>
                                                  <!--  <span class="iconbox button soft-danger"><i class="icofont-trash"></i></span> -->
                                                </div>
											</td>
										</tr>
									</tbody>
								</table>
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
