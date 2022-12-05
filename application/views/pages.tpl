<?php echo $layout['meta'];?>
<body>
<div id="wrapper">
    <!-- Header -->
    <?php echo $layout['header'];?>

    <!-- sidebar -->
    <?php echo $layout['sidebar'];?>
    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">
            <div class="lg:space-x-12">

                <div class="flex-shirink-0">

                    <div class="flex justify-between relative md:mb-4 mb-3">
                        <div class="flex-1">
                            <!--<a href="<?php echo base_url()?>make_pages" class="flex items-center justify-center h-10 w-10 z-10 rounded-full bg-blue-600 text-white absolute right-0 bm-10" data-tippy-placement="left" data-tippy="" data-original-title="Create New Page">
                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                                </a>-->
                           
                         
                        </div>
                    </div>


                    <ul class="card divide-y divide-gray-100 sm:m-0 -mx-5" id="page_data">

                        <?php
                        if(!empty($user_page)){
                            foreach($user_page as $page) {
                        ?>
                        <li class="page_id" id="<?= $page->id?>">
                            <div class="flex items-start space-x-5 p-7">
                                <?php if(empty($page->business_Logo)){ ?>
                                <img src="<?php echo base_url().$page->avatar_image?>" alt=""
                                     class="w-12 h-12 rounded-full">
                                <?php } else { ?>
                                <img src="<?php echo base_url('upload').$page->business_Logo?>" alt=""
                                     class="w-12 h-12 rounded-full">
                                <?php } ?>
                                <div class="flex-1">
                                    <a href="<?php echo base_url('page/').$page->city_name.'/'.$page->user_name?>"
                                       class="text-lg font-semibold line-clamp-1 mb-1"><?= $page->page_name;?></a>
                                    <p class="text-sm text-gray-400 mb-2"><?= $page->page_name;?><span
                                                data-href="%40tag-dev.html">· 0 likes ·</span> 0 follows</span> </p>
                                </div>
                            </div>
                        </li>
                        <?php } } ?>
                        <!--<div class="page-loader">
                              <div class="loading loading03">
                                <span>L</span>
                                <span>o</span>
                                <span>a</span>
                                <span>d</span>
                                <span>i</span>
                                <span>n</span>
                                <span>g</span>
                                <span>.</span>
                                <span>.</span>
                                <span>.</span>
                                <span><img src="<?php echo base_url()?>assets/images/spinner.gif" class="loader-img"></span>
                              </div>
                        </div>-->

                    </ul>
                    <!-- <div class="wrapper-loader" id="page_loader" style="display: none;">
                        <div class="card-loader card-loader--tabs"></div>
                    </div> -->


                </div>

            </div>

        </div>
    </div>

</div>


<!-- open chat box -->
<?php echo $layout['message'];?>
<?php echo $layout['js'];?>

<script>
    // $(window).scroll(function() {
    //     if($(window).scrollTop() + $(window).height() >= $(document).height()) {
    //         var last_id = $(".page_id:last").attr("id");
    //         loadMore(last_id);
    //     }
    // });

    // function loadMore(last_id){
    //     $.ajax({
    //         url: '<?php echo base_url('MasterCntrl/get_data')?>?last_id=' + last_id,
    //         type: "get",
    //         beforeSend: function(){
    //             $('#page_loader').show();
    //         },
    //         success: function(response){
    //             $('#page_loader').hide();
    //             var dataObj = JSON.parse(response);
    //             if(dataObj !=''){
    //                 $.each(dataObj, function (i, d) {
    //                     $('#page_data').append('<li class="page_id" id="' + d["id"] + '">' +
    //                         '<div class="flex items-start space-x-5 p-7">' +
    //                         (d['business_Logo'] == '' ? '<img src="https://www.byloapp.in/' + d["avatar_image"] + '" alt="" class="w-12 h-12 rounded-full">': '<img src="https://www.byloapp.in/upload/' + d["business_Logo"] + '" alt="" class="w-12 h-12 rounded-full">') +
    //                         '<div class="flex-1">' +
    //                         '<a href="https://www.byloapp.in/page/' + d["city"]+'/'+ d["business_Logo"]+'" class="text-lg font-semibold line-clamp-1 mb-1">' + d["page_name"] + '</a>' +
    //                         '<p class="text-sm text-gray-400 mb-2">' +
    //                         '<span data-href="%40tag-dev.html">· 0 likes ·</span> 0 follows</span> </p>' +
    //                         '</div>' +
    //                         '</div>' +
    //                         '</li>');
    //                 });
    //             }else {
    //                 $('#page_loader').show();
    //             }
    //         }
    //     });
    // }
</script>
