<?php echo $layout['meta']?>
<body>
<div id="wrapper">

    <!-- Header -->
    <?php echo $layout['header']?>

    <!-- sidebar -->
    <div class="sidebar marketplace">

        <div class="sidebar_inner" data-simplebar>
            <div class="cate-filter">
                <div class="py-2" style="font-size: 13px;">
                    <span><a href="<?php echo base_url('marketplace')?>">Marketplace > </a></span><span
                            id="category"></span>
                </div>
                <span id="category_name"></span>
            </div>
            <div class="header_search"><i class="uil-search-alt"></i>

                <input value="" type="text" class="form-control" placeholder="Search Marketplace.." autocomplete="off">
                <div uk-drop="mode: click" class="header_search_dropdown">
                    <h4 class="search_title"> Recently </h4>
                    <ul>
                        <li>
                            <a href="#">
                                <img src="assets/images/avatars/avatar-1.jpg" alt="" class="list-avatar">
                                <div class="list-name"> Erica Jones</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="assets/images/avatars/avatar-2.jpg" alt="" class="list-avatar">
                                <div class="list-name"> Coffee Addicts</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="assets/images/avatars/avatar-3.jpg" alt="" class="list-avatar">
                                <div class="list-name"> Mountain Riders</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="assets/images/avatars/avatar-4.jpg" alt="" class="list-avatar">
                                <div class="list-name"> Property Rent And Sale</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="assets/images/avatars/avatar-5.jpg" alt="" class="list-avatar">
                                <div class="list-name"> Erica Jones</div>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>

            <div class="cate-filter">
                <div class="py-2">
                    <ul>
                        <li><a href="<?php echo base_url('marketplace')?>">Browse all</a></li>
                    </ul>
                </div>
            </div>
			
			<?php if(!empty($this->session->userdata('id'))){ ?>

            <div class="creat-listing-btn mb-4">
                <div class="flex justify-between items-center relative md:mb-4 mb-3">
                    <a href="#offcanvas-create" uk-toggle
                       class="flex w-100 items-center justify-center h-8 lg:px-12 px-12 rounded-md bg-blue-600 text-white space-x-1 z-10">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4">
                            <path fill-rule="evenodd"
                                  d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z"
                                  clip-rule="evenodd"></path>
                        </svg>
                        <span class="md:block hidden"> Create </span>
                    </a>
                </div>
            </div>
			<?php } ?>


            <div class="box border-top pt-4" id="price_flitter">
                
            </div>
            <div class="distance-range border-top mt-3 pt-4 mb-4">
                <h6>Distance</h6>
                <p><a href="#"> Bhopal, Madhya Pradesh <span> Within 60 kilometres </span> </a></p>
                <a class="button px-2 rounded-md bg-blue-600 text-white space-x-1" href="#modal-distance" uk-toggle>Set
                    Distance</a>
            </div>


            <div class="cate-filter">
                <div class="py-2">
                    <h6 class="font-weight-bold">Categories</h6>
                    <ul>
                        <?php if(!empty($product_category)){
                            foreach($product_category as $category){
                            $category_url = str_replace(' ', '-', strtolower($category->category_url));
                        ?>
                        <li onclick="filtter('<?= $category->id;?>', 'category', '<?= $category_url?>')">
                            <span onclick="product_cat('<?php echo $category->category_name;?>')"
                                  id="<?= $category->id;?>"><p><?= $category->category_name;?></p></span>
                        </li>
                        <?php } }?>
                    </ul>
                </div>
            </div>
            <!--<a href="#" class="see-mover h-10 flex my-1 pl-2 rounded-xl text-gray-600" uk-toggle="target: #more-veiw; animation: uk-animation-fade">
                        <span class="w-full flex items-center" id="more-veiw">
                            <svg class="  bg-gray-100 mr-2 p-0.5 rounded-full text-lg w-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                            See More
                        </span>
                <span class="w-full flex items-center" id="more-veiw" hidden>
                            <svg  class="bg-gray-100 mr-2 p-0.5 rounded-full text-lg w-7"  fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd"></path></svg>
                            See Less
                        </span>
            </a>--->
            <hr>

        </div>

        <!-- sidebar overly for mobile -->
        <div class="side_overly" uk-toggle="target: #wrapper ; cls: is-collapse is-active"></div>

    </div>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="relative">
                <div id="product_list">
                    <div class="row">
                        <?php
                        if(!empty($product_list)){
                            foreach($product_list as $product) {
                    ?>
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-media h-60">
                                    <div class="card-media-overly"></div>
                                    <img src="<?php echo base_url('upload/').$product->product_image?>" alt="">
                                    <span class="absolute bg-white px-2 py-1 text-sm rounded-md m-2"> Label</span>

                                </div>
                                <div class="card-body pb-4 pt-4">
                                    <!--<div
                                            class="-top-3 absolute bg-blue-100 font-medium px-2 py-1 right-2 rounded-full text text-blue-500 text-sm">
                                        2km
                                    </div>-->
                                    <div class="text-xs font-semibold uppercase "><?= $product->
                                        page_name?>
                                    </div>
                                    <div class="ext-lg font-medium mt-1 t truncate"><a
                                                href="<?php echo base_url('marketplace/item/').str_replace(' ', '-', strtolower($product->product_name)).'/'.$product->product_id?>"><?= $product->
                                            product_name?></a></div>
                                    <div class="text-xs font-semibold uppercase"><?= $product->
                                        category_name?>
                                    </div>
                                    <ul class="product_price list-unstyled">
                                        <li class="new_price text-xs font-semibold uppercase pt-1"><span
                                                    style="font-size:20px;" class="ex">&#x20b9; <?= $product->
                                                product_price?></li>
                                        <!--<li class="old_price text-xs font-semibold uppercase text-red-500">
                                            <del> ₹16.00</del>
                                        </li>-->
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <?php } }?>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- Create new Product -->
<div id="offcanvas-create" class="product-form-main" uk-offcanvas="flip: true; overlay: true">
    <div class="uk-offcanvas-bar lg:w-4/12 w-full dark:bg-gray-700 dark:text-gray-300 p-0 bg-white shadow-2xl">
        <button class="uk-offcanvas-close absolute" type="button" uk-close></button>

        <!-- notivication header -->
        <div class="-mb-1 border-b font-semibold px-5 py-3 text-lg">
            <h4> Add new product </h4>
        </div>
        <form method="post" action="/UserEcomCntrl/insert_product" id="reg_form">
            <div class="p-6 space-y-3 flex-1">
                <div>
                    <div class="col-span-2 page-select">
                        <label>Select Page Name </label>
                        <select name="page_name" id="category" class=" with-border ">
                            <option value=""> Select Your page name</option>
                            <?php if(!empty($user_page)){
                                foreach($user_page as $page) {
                            ?>
                            <option value="<?= $page->id?>"> <?= $page->page_name?></option>
                            <?php } }?>
                        </select>
                    </div>
                </div>
                <div>
                    <label> Product Name </label>
                    <input type="text" name="product_name" class="with-border" placeholder="">
                </div>
                <div>
                    <label> Location </label>
                    <input type="text" name="location" class="with-border" placeholder="">
                </div>
                <div>
                    <label> Description </label>
                    <textarea name="description" rows="3" class="with-border w-full p-4" id="description"
                              placeholder="Please describe your product."></textarea>
                </div>
                <div>
                    <label> Condition </label>
                    <select name="condition" id="condition" class=" with-border">
                        <option value="1">New</option>
                        <option value="2">Used – like new</option>
                        <option value="3">Used – Good</option>
                    </select>
                </div>
                <div class="grid grid-cols-3 gap-4">
                    <div class="col-span-2">
                        <label> Category </label>
                        <select name="category" id="category" class=" with-border">
                            <option value=''>Select product category</option>
                            <?php
                           		if(!empty($product_category)) {
                           			foreach($product_category as $category){
										if($category->category_main_id != 0) { ?>
                            <option value='<?= $category->id?>'><?= $category->category_name;?></option>
                            <?php } } }?>
                        </select>
                    </div>
                    <div>
                        <label> Price &#x20b9; </label>
                        <input placeholder="0.00" name="product_price" type="text" class="with-border w-full">
                    </div>
                </div>
                <div class="keywords-container max-w-lg flow-root">
                    <div class="keyword-input-container">
                        <input type="text" class="keyword-input with-border" placeholder="Add Keywords"/>
                        <button type="button" class="keyword-input-button ripple-effect"><i class="icon-material-outline-add"></i>
                        </button>
                    </div>
                    <div class="keywords-list">
                        <!-- keywords go here -->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="grid grid-cols-3 gap-4">
                    <div class="col-span-2">
                        <label> Type </label>
                        <select id="" name="purchase_type" class=" with-border">
                            <option value="1"> Rent</option>
                            <option value="2"> Purchase</option>
                        </select>
                    </div>
                    <div>
                        <label> Availability </label>
                        <select id="availability" name="availability" class=" with-border">
                            <option value="1"> In Stock</option>
                            <option value="2"> Out of Stock</option>
                        </select>
                    </div>
                </div>


                <div class="product-form">
                    <div id="product-preview"></div>
                    <input type="file" id="choose-file" name="product_image" accept="image/*"/>
                    <label for="choose-file">Choose File</label>
                </div>


            </div>
            <div class="p-5">
                <button type="button" class="button w-full" onclick="product_add('insert_product')">
                    Add Now
                </button>
            </div>

        </form>
    </div>
</div>


<!-- open chat box -->
<div uk-toggle="target: #offcanvas-chat" class="start-chat">
    <svg class="h-7 w-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
    </svg>
</div>


<?php echo $layout['js']?>


<div id="modal-distance" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Change location</h2>
        </div>
        <div class="uk-modal-body distance-model">
            <!-- search icon for mobile -->

            <form>
                <div class="form-group">
                    <label>Location </label>
                    <div class="header-search-icon" uk-toggle="target: #wrapper ; cls: show-searchbox"></div>
                    <div class="header_search"><i class="uil-search-alt"></i>
                        <input value="" type="text" class="form-control" placeholder="Enter a city.."
                               autocomplete="off">
                        <div uk-drop="mode: click" class="header_search_dropdown">
                            <ul>
                                <li>
                                    <a href="#">
                                        <div class="list-name"> Indore</div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="list-name"> Bhopal</div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="list-name"> Jaipur</div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="list-name"> Delhi</div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="list-name"> Mumbai</div>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>

                <div class="form-group mb-3">
                    <label>Radius Filter </label>
                    <div class="form-group range-slider">
                        <input type="range" class="form-control-range" id="formControlRange"
                               onInput="$('#rangeval').html($(this).val())">
                        <span id="rangeval">50<!-- Default value --> </span> <span> Kilometres </span>
                    </div>
                </div>


                <div class="map-loaction">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d235527.45447396243!2d75.7237609247701!3d22.723911729012382!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3962fcad1b410ddb%3A0x96ec4da356240f4!2sIndore%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1643889255637!5m2!1sen!2sin"
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
                <div class="uk-modal-footer text-right">
                    <button class="button" type="button">Apply</button>
                </div>
            </form>

        </div>

    </div>
</div>

<!-----toast message -------->
<div class="toast-msg-product" style="display: none">
    <div id="success_msg" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="mr-auto">Success</strong>
            <small></small>
            <button type="button" class="ml-2 mb-1 close myBtn" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        </div>
        <div class="toast-body" id="success_msg_subject">
        </div>
    </div>


    <div id="error_msg" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display:none">
        <div class="toast-header">
            <strong class="mr-auto">Error</strong>
            <small></small>
            <button type="button" class="ml-2 mb-1 close myBtn" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        </div>
        <div class="toast-body" id="error_msg_subject">Error</div>
    </div>
    <div>
        <!-----toast message  end-------->