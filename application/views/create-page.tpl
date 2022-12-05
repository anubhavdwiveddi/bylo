<?php echo $layout['meta'];?>

<div id="wrapper">
    <?php echo $layout['header'];?>
    <?php echo $layout['sidebar'];?>
    <div class="main_content">
        <div class="mcontainer">
             <div class="max-w-2xl m-auto shadow-md create-pg-form rounded-md bg-white lg:mt-20">
                <form method="POST" id="reg_form" action="<?= base_url('PageCntrl/insert_data')?>">
                <div class="p-10 space-y-7">
                    <div class="line">
                        <label for="username" class="line__placeholder1"> Create Username </label>
                        <input class="form-control  with-border" placeholder="Create Username" id="user_name"
                               name="user_name" type="text" onchange="checkusername('value', this.value);" value=""
                               autocomplete="off">
                    </div>

                    <div class="line">
                        <label for="username" class="line__placeholder1"> Page Name </label>
                        <input class="form-control  with-border" placeholder="Page Name" id="page_name" name="page_name"
                               type="text" onkeyup="this.setAttribute('value', this.value);" value=""
                               autocomplete="off">

                    </div>

                    <div class="row mt-0 mb-0">
                        <div class="col-lg-6">
                            <div>
                                <label for=""> Country</label>
                                <select id="get_country" name="Country" class="shadow-none with-border ">
                                    <option value="">Select Country</option>
                                    <?php if(!empty($country)) {
										foreach($country as $cou) {
									?>
                                    <option id="get_country" value="<?= $cou->id?>"><?= $cou->name?></option>
                                    <?php } } ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div>
                                <label for=""> State</label>
                                <select id="state" name="state_list" class="shadow-none with-border">
                                    <option value="" selected="">Select State</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div>
                                <label for=""> City</label>
                                <select id="city" name="city" class="shadow-none with-border ">
                                    <option value="" selected="">Select City</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div>
                                <label for=""> Page Category </label>
                                <select id="category" name="category" class="shadow-none with-border ">
                                    <option value="">Select Page Category</option>
                                    <?php if(!empty($category)) {
									foreach($category as $cat) {
									?>
                                    <option value="<?= $cat->id;?>" data="<?= $cat->name;?>"><?= $cat->name;?></option>
                                    <?php } }?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="line1 h-32 mb-4">
                        <label for=""> Page description </label>
                        <textarea class="p-2 h-32 with-border" id="page_description" name="page_description" type="text"
                                  onkeyup="this.setAttribute('value', this.value);" value=""
                                  autocomplete="off"></textarea>
                    </div>
                </div>
                
                <div class="border-t flex justify-between lg:space-x-10 p-7 bg-gray-50 rounded-b-md">
                    <p class="text-sm leading-6"> You can add images, contact info and other details after you create
                        the Page. </p>
                    <button type="button" id="create_page" disabled="disabled" onclick="insert_data('', 'create_page')" class="button lg:w-1/2">
                        Create Now
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php echo $layout['message'];?>
<?php echo $layout['footer'];?>
<?php echo $layout['js'];?>

