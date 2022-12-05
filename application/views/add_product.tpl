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
                    
					<!-----add product  --->
					
				<div class="max-w-2xl m-auto shadow rounded-md bg-white lg:mt-20">
						<div class="text-center border-b border-gray-100 py-6">
							<h3 class="font-bold text-xl"> Add New Product</h3>
						</div>
					<form>
						<div class="p-6 space-y-3 flex-1">
							<div>
								<div class="col-span-2 page-select">
									<label>Select Page Name    </label>
									<select name="page_name" id="category" class=" with-border ">
										<option value="2"> Page Name -1 </option>
										<option value="3"> Page Name -2 </option>
								 
									</select>
								</div>
							</div> 
							<div>
								<label> Product Name  </label>
								<input type="text" name="product_name" class="with-border" placeholder="">
							</div>
							<div>
								<label> Location  </label>
								<input type="text" class="with-border" placeholder="">
							</div>
							<div>
								<label> Description   </label>
								<textarea name="description" rows="3" class="with-border w-full p-4" id="description" placeholder="Please describe your product."></textarea>
							</div>
							 <div>
								<label> Condition   </label>
								<select name="category" id="category" class=" with-border">
										<option value="2">New</option>
										<option value="3">Used – like new</option>
										<option value="3">Used – Good</option>
									</select>
							</div>
							<div class="grid grid-cols-3 gap-4">
								<div class="col-span-2">
									<label> Category    </label>
									<select name="category" id="category" class=" with-border">
									   <option value="1">'.Home &amp; garden.'</option><option value="7">'.Entertainment.'</option><option value="10">'.Clothing &amp; accessories.'</option><option value="15">'.Family.'</option><option value="20">'.Electronics.'</option><option value="23">'.Hobbies.'</option><option value="30">'.Classifieds.'</option><option value="33">'.Vehicle.'</option>                        </select>
								</div>
								<div> 
									<label> Price </label>
									<input placeholder="0.00" type="text" class="with-border w-full">
								</div>
							</div>
							<div class="keywords-container max-w-lg flow-root">
							<label> Add Keywords </label>
								<div class="keyword-input-container">
									<input type="text" class="keyword-input with-border
									" placeholder="Add Keywords">
									<button class="keyword-input-button ripple-effect"><i class="icon-material-outline-add"></i></button>
								</div>
								<div class="keywords-list">
									<!-- keywords go here -->
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="grid grid-cols-3 gap-4">
								   <div class="col-span-2">
									<label> Type </label>
									<select id="" name="" class=" with-border">
										<option value="2"> Rend </option>
										<option value="3"> Purchase </option>
									</select>
									</div>
							  <div> 
									<label> Availability </label>
									<select id="" name="" class=" with-border">
										<option value="2"> In Stock </option>
										<option value="3"> Out of Stock</option>
									</select>
								</div>
							</div>
							 
							
							<div class="product-form">
								<div id="product-preview"></div>
								<input type="file" id="choose-file" name="choose-file" accept="image/*">
								<label for="choose-file">Choose Product Image</label>
							  </div>
							  
							  
						</div>
						<div class="p-5">
							<button type="button" class="button w-full">
								Add Now
							</button>
						</div>
						
						</form>
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
