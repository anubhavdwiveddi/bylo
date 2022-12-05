<?php echo $layout['meta'];?>

<body>
<div id="wrapper">
    <!-- Header -->
    <?php echo $layout['user_header'];?>
    <!-- sidebar -->
    <?php echo $layout['dashboard_sidebar'];?>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="lg:space-x-12">
                <div class="lg:w-4/4">
                   
					<!----- blog  listing --->
					<div class="create-blog">
					     
                            <!------ add  blog  form --->
                            <div class="add-blog" id="add_blog_form" >
                            
                                <div class="col-span-2 ">
                                    <!-- create page-->
                                    <div id="add_blog" class="max-w-2xl m-auto shadow rounded-md bg-white lg:mt-20">
                                        <form method="post" id="reg_form1" action="BlogCntrl/insert_blog"
                                              enctype="multipart/form-data">
                                            <!-- form header -->
                                            <div class="text-center border-b border-gray-100 py-6">
                                                <h3 class="font-bold text-xl"> Add New Blog </h3>
                                            </div>

                                            <!-- form body -->
                                            <div class="p-10 space-y-7">

                                                <div class="line1">
                                                    <label for="username" class="line__placeholder1"> Blog
                                                        Tittle </label>
                                                    <input class="form-control with-border" id="blog_title"
                                                           placeholder="Blog Tittle" name="blog_title"
                                                           type="text" value="" autocomplete="off">

                                                </div>
                                                <!--<div class="flex items-center">
                                                    <div class="-mr-1 bg-gray-100 border px-3 py-3 rounded-l-md"> <?php echo base_url()?></div>
                                                    <input type="text" class="with-border" placeholder="">
                                                </div>-->
                                                <div class="select-blog-cate">
                                                    <label for=""> Blog Category </label>
                                                    <select id="blog_category" onchange="getcategorytag()"
                                                            name="blog_category"
                                                            class="shadow-none  with-border ">
                                                        <option value="">Select Page Category</option>
                                                        <?php if(!empty($category)) {
													foreach($category as $cat) {
													?>
                                                        <option value="<?= $cat->id;?>"
                                                                data="<?= $cat->name;?>"><?= $cat->name;?>
                                                        </option>
                                                        <?php } }?>
                                                    </select>
                                                </div>
                                                <div class="add-tag">
                                                    <label for=""> Blog Tags </label>
                                                    <div class="form-group">
                                                        <select name="blog_tag[]" id="blog_tag"
                                                                class="form-control select2 select2-hidden-accessible"
                                                                style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                                multiple="">
                                                            <option value="" disabled>Select Blog tag</option>
                                                        </select></div>
                                                </div>


                                                <div class="add-feature-img">
                                                    <label for=""> Add Featured Image </label>
                                                    <div class="line">
                                                        <input class="line__input" id="blog-img" name="blog_img"
                                                               type="file">
                                                    </div>
                                                </div>
                                                <div class="line h-32">
                                                    <textarea class="line__input h-32" maxlength="169"
                                                              id="blog_short_description" name="blog_short_description"
                                                              type="text"
                                                              onkeyup="this.setAttribute('value', this.value);" value=""
                                                              autocomplete="off"></textarea>
                                                    <span for="username"
                                                          class="line__placeholder"> Short description </span>
                                                </div>
                                                <div class="line h-32">
                                                    <textarea class="line__input h-32" id="blog_description"
                                                              minlength="500" name="blog_description" type="text"
                                                              onkeyup="this.setAttribute('value', this.value);" value=""
                                                              autocomplete="off"></textarea>
                                                    <span for="username"
                                                          class="line__placeholder"> Blog description </span>
                                                </div>
                                            </div>
                                            <!-- form footer -->
                                            <div class="border-t flex justify-between lg:space-x-10 p-7 bg-gray-50 rounded-b-md">
                                                <p class="text-sm leading-6">  </p>
                                                <button onclick="insert_blog('<?php echo $po->page_id?>')" type="button"
                                                        class="button lg:w-1/2">
                                                    Create Now
                                                </button>
                                            </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                            <!------- add blog form end -----> 
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
