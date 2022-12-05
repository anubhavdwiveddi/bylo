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
                            <a href="<?php echo base_url()?>make_pages" class="flex items-center justify-center h-10 w-10 z-10 rounded-full bg-blue-600 text-white absolute right-0 bm-10" data-tippy-placement="left" data-tippy="" data-original-title="Create New Page">
                                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                            </a>
                            <h2 class="text-2xl font-semibold"> Pages you manage </h2>
                            <div
                        </div>
                    </div>

                    <ul class="card divide-y divide-gray-100 sm:m-0 -mx-5">
                        <?php
                         if(!empty($user_page)){
                         
                            foreach($user_page as $page) {
                            $decode = base64_encode($page->page_id);
                                $decode1 = base64_encode($decode);
                                $decode2 = base64_encode($decode1);
                        ?>
                        <li>
                            <div class="flex items-center space-x-5 p-7">
                                <?php if($page->business_Logo) { ?>
                                    <img src="<?= base_url('upload')?><?= $page->business_Logo ?>" alt="" class="w-20 h-20 rounded-full ">
                                <?php } else { ?>
                                    <img src="<?= base_url()?><?= $page->avatar_image ?>" alt="" class="w-20 h-20 rounded-full ">
                                <?php } ?>
                                <div class="flex-1">
                                    <a href="<?php echo base_url('page/').str_replace(' ', '-', $page->city).'/'.$page->user_name?>" class="text-lg font-semibold line-clamp-1 mb-1"><?= $page->page_name;?></a>
                                    <p class="text-sm text-gray-400 mb-2"><?= $page->page_name;?><span data-href="%40tag-dev.html">· 0 likes ·</span> 0 follows</span> </p>
                                </div>
                            </div>
                        </li>
                        <?php } } ?>
                    </ul>
                </div>

            </div>

        </div>
    </div>

</div>


<!-- open chat box -->
<?php echo $layout['message'];?>
<?php echo $layout['js'];?>
</body>
