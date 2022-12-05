<?php echo $layout['meta'];?>

<div id="wrapper">
    <!-- Header -->
    <?php echo $layout['header'];?>
    <!-- sidebar -->
    <!-- sidebar -->
    <div class="sidebar my-collection">

        <div class="sidebar_inner" data-simplebar>
            <div class="saved-item py-2 ml-3 border-bottom">

                <h4 class="text-2xl font-semibold mt-4"> Saved </h4>
                <a href="<?php echo base_url();?>saved/?referrer=SAVE_DASHBOARD_NAVIGATION_PANEL">
                    <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
                        <div class="w-8 h-8 flex-shrink-0 rounded-md relative">
                            <img src="<?php echo base_url()?>assets/images/group/group-3.jpg"
                                 class="absolute w-full h-full inset-0 rounded-full object-cover" alt="">
                        </div>
                        <div class="flex-1">
                            <h5 class=" capitalize text-small"> Saved Item </h5>
                        </div>

                    </div>
                </a>
            </div>
            <div class="my-collection-name">
                <div class="py-2 ml-3">
                    <h5 class="font-semibold pl-2">My collections</h5>
                    <?php
                        if(!empty($collection)){
                            foreach($collection as $collection_name) {
                                if($collection_name->type == 'user') {
                    ?>
                    <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
                        <div class="w-8 h-8 flex-shrink-0 rounded-md relative">
                            <img src="<?php echo base_url()?><?php echo $collection_name->folder_image?>"
                                 class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
                        </div>
                        <div class="flex-1">
                            <a href="<?php echo base_url();?>saved/list_id/<?= $collection_name->item_id?>"
                               class=" capitalize"> <?php echo $collection_name->folder_name?></a>
                        </div>
                    </div>
                    <?php } } }?>
                </div>
            </div>

            <div class="distance-range border-top mt-3 pt-4 mb-4 ml-3 pl-2">
                <a class="button px-2 rounded-md bg-blue-600 text-white space-x-1" href="#create-collection-model"
                   uk-toggle><span class="icon-material-outline-add">
              	</span> Create New Collection</a>
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
            <h2 class="text-2xl font-semibold mb-4"> All </h2>
            <?php if(!empty($saved_data)){
                foreach($saved_data as $save){
            ?>
            <div class="divide-y card px-4 saved-data mb-4">
                <div class="flex md:space-x-6 space-x-4 md:py-5 py-3">
                    <?php
                        if(!empty($save->image)) {
                    ?>
                    <div class="md:w-64 md:h-40 w-36 h-24 overflow-hidden rounded-lg relative shadow-sm">
                        <img src="<?php echo base_url('upload')?><?= $save->image;?>" alt=""
                             class="w-full h-full absolute inset-0 object-cover">
                    </div>
                    <?php } else { ?>
                    <div class="md:w-64 md:h-40 w-36 h-24 overflow-hidden rounded-lg relative shadow-sm">
                    <video class="w-full h-full absolute inset-0 object-cover">
                        <source src="<?php echo base_url('upload')?><?= $save->video;?>">
                    </video>
                    </div>
                    <?php } ?>
                    <div class="flex-1 space-y-2">
                        <a href="#" class="md:text-xl font-semibold line-clamp-2"> <?= $save->content?></a>
                        <p class="leading-6 pr-4 line-clamp-2 md:block hidden" style="font-size: 11px">
                            <?php if($save->folder_id != '0') { ?>
                            <span>Video Saved to</span> <a href="<?php echo base_url();?>saved/list_id/<?= $save->item_id?>/?referrer=SAVE_DASHBOARD_NAVIGATION_PANEL""><?= $save->folder_name?> </a>
                            <?php } else { ?>
                            <span>Post</span>
                            <?php } ?>
                        </p>
                        <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                            <a href="#" iv="" class="w-8 h-8 flex-shrink-0 overflow-hidden rounded-full relative">
                                <img src="<?php echo base_url('upload')?><?= $save->profile_image?>" class="absolute w-full h-full inset-0 "
                                     alt="">
                            </a>
                            <div class="flex-1">
                                <span>Saved from</span> <a href="<?php echo base_url()?><?= $save->user_code?>" class="text-base font-semibold capitalize"> <?= $save->first_name .' '. $save->last_name?> </a>
                            </div>

                        </div>

                        <div class="flex items-center justify-between relative">
                            <button onclick="get_collection_id('<?= $save->id?>')" class="md:flex items-center justify-center h-9 px-8 rounded-md border hidden bg-gray-100"
                               href="#add-collection-model" uk-toggle>Add to collection </button>
                        </div>


                    </div>
                </div>
            </div>
            <?php } } ?>
        </div>
    </div>
</div>
<!-- open chat box -->
<?php echo $layout['message']?>

<div id="create-collection-model" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Create collection</h2>
        </div>
        <form method="post" id="saved_user_data" action="/UserCntrl/Saved_data">
            <div class="uk-modal-body collection-model">
                <!-- search icon for mobile -->

                <div class="form-group">
                    <label>Name </label>
                    <input type="text" name="collection_name" placeholder="Give Your Collection Name.."
                           class="form-control with-border">
                </div>
            </div>
            <div class="uk-modal-footer text-right">
                <button class="button gray uk-modal-close" type="button">Cancel</button>
                <button class="button" onclick="MyFunction('', 'user_data_saved')" type="button">Apply</button>
            </div>
        </form>
    </div>
</div>


<div id="add-collection-model" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Add collection</h2>
        </div>
        <form method="post" id="saved_data" action="/UserCntrl/Saved_data">
            <div class="uk-modal-body collection-model">
                <!-- search icon for mobile -->
                <?php
                if(!empty($collection)){
                    foreach($collection as $collection_name) {
                        if($collection_name->type == 'user') {
                ?>

                <div class="listing-collection mb-2">
                    <div class="flex items-center space-x-4 py-3 hover:bg-gray-100 rounded-md -mx-2 px-2">
                        <div class="w-8 h-8 flex-shrink-0 rounded-md relative">
                            <img src="<?php echo base_url()?><?php echo $collection_name->folder_image?>"
                                 class="absolute w-full h-full inset-0 rounded-md object-cover" alt="">
                        </div>
                        <div class="flex-1">
                            <a onclick="Myfolder('<?= $collection_name->id?>', '')" href="#"
                               class=" capitalize"><?php echo $collection_name->folder_name?></a>

                        </div>

                        <input readonly type="hidden" name="save_data_id" id="save_data_id" placeholder="Give Your Collection Name.."
                               class="form-control with-border">
                    </div>
                </div>
                <?php } } } ?>
                <div class="uk-modal-footer text-right">
                </div>
                <div id="show_btn_div" class="mt-1">
                    <button type="button" class="button-cl" id="show_collection_btn"><span class="icon-material-outline-add">
              	</span> New collection
                    </button>
                </div>

                <div id="show_field_form" class="form-group" style="display:none;">
                    <div class="form-group mt-4">
                        <label>Collection Name </label>
                        <input type="text" name="collection_name" placeholder="Give Your Collection Name.."
                               class="form-control with-border">

                    </div>
                </div>

            </div>
            <div class="uk-modal-footer text-right">
                <button id="bach_collection_btn" class="button gray " type="button">Cancel</button>
                <button class="button" onclick="MyFunction('', 'saved_data')" type="button">Apply</button>
            </div>
        </form>
    </div>
</div>


<script>

    /***********collection field**********/

    $(document).ready(function () {
        $("#show_collection_btn").click(function () {
            $("#show_field_form").css('display', 'block');
            $("#show_btn_div").css('display', 'none');
        });

        $("#bach_collection_btn").click(function () {
            $("#show_collection_btn").css('display', 'none');
            $("#show_btn_div").css('display', 'block');
        });
    });

</script>

<?php echo $layout['footer']?>
<?php echo $layout['js']?>
