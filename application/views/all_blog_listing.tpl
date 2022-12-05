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
                       <div class=" justify-between items-center  mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h2 class="text-xl font-bold"> Blog </h2>
                                        </div>
                                                                                <div class="col-lg-6">
                                            <div class="add-blog float-right">
                                                <a href="<?php base_url(); ?>add_blog" class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0" id="show_blog_add" href="#">
                                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path>
                                                    </svg>
                                                </a>
                                                <!------ edit page modal ---->
                                            </div>
                                        </div>
                                                                            </div>
                                </div>
                    </div>
					
					
					
					<!----- blog  listing --->
					
					<div class="table-listing">
					     <table id="example"  style="width:100%" class="table table-default  table-striped table-responsive-lg">
                                <thead>
                                <tr>
                                    <th>Sr No.</th>
                                    <th>ID#</th>
                                    <th>Blog Title</th>
                                    <th>Page Name</th>
                                    <th>Author</th>
                                    <th>Categories</th>
                                    <th>Tags</th>
                                    <th>Status </th>
                                    <th>Created on</th>
                                    <th>Action</th> 
                                </tr>
                                </thead>
                                <tbody>
                               
                                        <tr>
                                            <td>01</td>
                                            <td> 1 </td>
                                            <td><a href="#blog-view"  class="text-blue-500" uk-toggle>Top 5 restaurant in Indore </a></td>
                                            <td><a href="#"  class="text-blue-500">Bylo Cafe </a></td>
                                            <td><a href="#"  class="text-blue-500" > Nick </a></td>
                                            <td> Food </td>
                                            <td> Free Delivery </td>
                                            <td>
                                               Approved
												
                                            </td>
                                            <td><span>09/11/2021 ( 4 days ago ) </span></td>
                                            <td>
                                                <div class="actions-btn">
                                                    <a href="<?php echo base_url()?>edit_blog"> <span class="iconbox button soft-primary"><span class="icon-feather-edit">
                                    
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

<!-------- blog view model  ----->
<div id="blog-view" uk-modal>
    <div class="uk-modal-dialog">

        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div id="blog_details">
		<div class="uk-modal-header">
		<h2 class="uk-modal-title">Your Best Friend Before Google in Python!</h2></div>
		<div class="uk-modal-body uk-overflow-auto" uk-overflow-auto="" style="min-height: 150px; max-height: 150px;">
		<div class="blog-model-content">
		<div class="">
		<div class="h-44 mb-4 md:h-72 overflow-hidden relative rounded-t-lg w-full"><img src="https://byloapp.in/upload//2022/jan/07/profile_b809e80e717ff430af99ce28b050f5d0.jpg" alt="" class="w-full h-full absolute inset-0 object-cover"></div><div class="p-0"><h1 class="lg:text-3xl text-2xl font-semibold mb-6"></h1><div class="flex items-center space-x-3 my-4 pb-4 border-b border-gray-100"><img src="https://byloapp.in/upload//2022/feb/04/profile_a01f17740becd36bed9cd21f03d28e96.jpg" alt="" class="w-10 h-10 rounded-full"><div><div class="text-base font-semibold">Anubhav Dwivedi </div><div class="text-xs">2022-01-07 02:20:24</div></div></div><div class="space-y-3"><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
Maecenas Pretium Lorem Fermentum
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.
Consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p></div></div></div></div></div></div>
    </div>
</div>

</body>
</html>
