<?php echo $layout['meta'];?>
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
                                <h2 class="text-2xl font-semibold">Order History </h2>
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
											<th>Unit</th>
											<th>Price</th>
											<th>Categories</th>
											<th>Date</th>	
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1001</td>
											<td class="product-pic"><figure><img src="<?php echo base_url();?>assets/images/product/1.jpg" alt=""></figure> </td>
											<td class="product-name"><a class="text-blue-500" href="#" >Little Girls  Flared Skirt Top</a></td>
											
											<td>  1 </td>
											<td>₹769.00</td>
											<td>Clothing</td>
											
											<td>2021/12/21 at 7:05 pm</td>
											
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
