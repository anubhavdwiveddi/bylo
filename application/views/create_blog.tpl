<?php echo $layout['meta'];?>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

<body>
<div id="wrapper">
    <!-- Header -->
    <?php echo $layout['header'];?>

    <!-- sidebar -->
    <?php echo $layout['sidebar'];?>
        <!-- Main Contents -->
        <div class="main_content">
            <div class="mcontainer">

                <!--  breadcrumb -->
                <div class="breadcrumb-area py-0">
                    <div class="breadcrumb">
                        <ul class="m-0">
                            <li>
                                <a href="#">Blogs</a>
                            </li>
                            <li class="active">
                                <a href="#">Create New Blog </a>
                            </li>
                        </ul>
                    </div>
                </div>


                <!-- create page-->
                <div id="add_blog" class="max-w-2xl m-auto shadow-md rounded-md bg-white lg:mt-20">  
 
                    <!-- form header -->
                    <div class="text-center border-b border-gray-100 py-6">
                        <h3 class="font-bold text-xl"> Create New Blog </h3>
                    </div>

                    <!-- form body -->
                    <div class="p-10 space-y-7">
					    
                        <div class="alert alert-danger msg" role="alert" id="errorModel">
                        </div>
                        <div class="alert alert-success msg" role="alert" id="success-msg">
                        </div>
					
                        <div class="line">
                            <input class="line__input" id="page_name" name="page_name" type="text" onkeyup="this.setAttribute('value', this.value);" value="" autocomplete="off">
                            <span for="username" class="line__placeholder"> Blog Tittle </span>
                        </div>
                        <!--<div class="flex items-center">
                            <div class="-mr-1 bg-gray-100 border px-3 py-3 rounded-l-md"> <?php echo base_url()?></div>
                            <input type="text" class="with-border" placeholder="">
                        </div>-->
                        <div>
                            <label for=""> Blog Category </label>
                            <select id="category" name="category"  class="shadow-none  with-border ">
                                <option value="">Select Page Category</option>
                                <?php if(!empty($category)) {
                                foreach($category as $cat) {
                                ?>
                                <option value="<?= $cat->id;?>" data="<?= $cat->name;?>"><?= $cat->name;?></option>
                                <?php } }?>
                           </select>
                         </div>
						 <div class="add-tag">
						      <label for=""> Blog Tags </label>
								<select  class="shadow-none selectpicker with-border" multiple>
									<option>Mustard</option>
									<option>Ketchup</option>
									<option>Relish</option>
								</select>
						 </div>
						 <div class="add-feature-img">
						 <label for=""> Add Featured Image </label>
							 <div class="line">
								
								<input class="line__input" id="blog-img" name="page_name" type="file" >
							</div>
						 
						 </div>
                        <div class="line h-32"> 
                            <textarea class="line__input h-32"  id="page_description" name="page_description" type="text" onkeyup="this.setAttribute('value', this.value);" value="" autocomplete="off"></textarea>
                            <span for="username" class="line__placeholder"> Blog description </span> 
                        </div>
                    </div>
                    <!-- form footer -->
                    <div class="border-t flex justify-between lg:space-x-10 p-7 bg-gray-50 rounded-b-md">
                        <p class="text-sm leading-6"> You can add images, contact info and other details after you create the Page. </p>
                        <button disabled type="button" id="create_page" class="button lg:w-1/2">
                            Create Now
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</script>
<?php echo $layout['message'];?>
<?php echo $layout['js'];?>

