<?php echo $layout['meta'];?>
<style>
    .icon-feather-trash-2:before {
        content: "\e9e4";
        color: black;
    }

    .icon-feather-edit-2:before {
        color: black;
    }

    button.ibtnDel {
        background-color: #ededed;
        padding: 9px 8px;
        color: #fff;
        border-radius: 6px;
    }
</style>
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
                <div class="lg:w-4/4">
                    <div class=" md:mb-4 mb-3">
                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="text-2xl font-semibold"> Jobs </h2>
                            </div>
                        </div>
                    </div>

                    <?php
                        if(!empty($job_list)){
                            foreach($job_list as $job) {
                    ?>
                    <div class="card divide-y mb-4 divide-gray-100 sm:m-0 -mx-4">

                        <div class="flex items-start flex-wrap  p-7 sm:space-x-6">
                            <a href="job-details.html" class="w-14 h-14 relative mt-1 order-1">
                                <?php if(!empty($job->image)) { ?>
                                <img src="<?php echo base_url('upload')?>/<?= $job->image?>" alt=""
                                     class="rounded-md job-img">
                                <?php } else { ?>
                                <img src="<?php echo base_url();?>/assets/images/brand/brand-avatar-4.png" alt=""
                                     class="rounded-md job-img">
                                <?php } ?>
                            </a>
                            <div class="flex-1 sm:order-2">
                                <h4 class="text-base text-gray-500 font-medium mb-2"><?= $job->company_name?></h4>
                                <a href="<?php echo base_url();?>jobs/<?= str_replace(' ', '-', $job->city) .'/'. str_replace(' ', '-', $job->job_title) .'/'. $job->create_job_id?>">
                                    <h3 class="text-xl font-medium mb-4"><?= $job->job_title?></h3>
                                </a>
                                <p><?= $job->description?></p>
                                <div class="job-tags mt-5 mb-2 space-x-2.5 ">
                                    <a href="#apply_job" onclick="apply_jobs('<?= $job->id?>')" value="<?= $job->id?>"
                                       class="border px-3 py-1.5 rounded-md text-sm inline-block text-white bg-theme applyjob"
                                       uk-toggle>
                                        Apply </a>
                                    <button class="border px-3 py-1.5 rounded-md text-sm inline-block bg-rd"> Save
                                    </button>

                                </div>
                            </div>
                        </div>

                    </div>
                    <?php } }?>


                    <!--- job loader ----------->

                    <div class="post-card-loader mb-4">
                        <div class="left-column"></div>
                        <div class="shimmer-block">

                            <div class="content-column">
                                <div class="shimmer-mask poster-right"></div>
                                <div class="shimmer-mask title-bottom"></div>
                                <div class="shimmer-mask language-bottom"></div>
                                <div class="shimmer-mask genre-bottom"></div>
                                <div class="shimmer-mask title-right"></div>
                                <div class="shimmer-mask language-right"></div>
                                <div class="shimmer-mask genre-right"></div>
                                <div class="shimmer-mask j-button-1"></div>
                                <div class="shimmer-mask j-button-2"></div>

                            </div>
                        </div>
                    </div>


                    <!--- job loader end----------->


                </div>
            </div>
        </div>
    </div>
</div>
<div id="apply_job" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default m-3" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Apply Job</h2>
        </div>

        <div class="uk-modal-body job-content-popup">
            <div id="company_details">
            </div>
            <form method="post" action="JobCntrl/apply_user_jobs" enctype="multipart/form-data" id="reg_form">
                <div class="mt-4">
                    <div class="grid grid-cols-2 gap-3 lg:p-0 ">
                        <div>
                            <label for="">Name</label>
                            <input type="text" placeholder="Enter your Name"
                                   value="<?= $user_details->first_name .' '. $user_details->last_name?>"
                                   class="shadow-none with-border">
                        </div>
                        <div>
                            <label for=""> Phone No.</label>
                            <input type="text" placeholder="" name="mobile_number" value="<?= $user_details->mobile?>"
                                   class="shadow-none with-border">
                        </div>
                        <div class="col-span-1">
                            <label for=""> City</label>
                            <input type="text" placeholder=""
                                   value="<?= $user_details->City .', '. $user_details->state .', '. $user_details->pin_code?>"
                                   class="shadow-none with-border">
                        </div>
                        <div class="col-span-1">
                            <label for=""> Email</label>
                            <input type="text" placeholder="" value="<?= $user_details->email	?>"
                                   class="shadow-none with-border">
                        </div>

                        <div class="col-span-1">
                            <label for="">Work experience</label>

                            <div class="pb-0 flex space-x-3" style="color: #2563eb;">
                                <button type="button" onclick="add_multiple_rows('work_experience')"><span
                                            class="icon-material-outline-add-circle-outline">
                                     </span> Add work experience
                                </button>
                            </div>
                        </div>
                        <?php
								if(!empty($user_experience)){
									foreach($user_experience as $experience) {
							?>
                        <div class="col-span-2">
                            <div>
                                <div class="space-y-3">
                                    <div class="flex justify-between items-center">
                                        <div class="switches-list -mt-8 is-large">
                                            <div class="switch-container">
                                                <label class="switch"><input type="checkbox"><span
                                                            class="switch-button"></span> </label>
                                            </div>
                                        </div>
                                        <div>
                                            <div> <?= $experience->position .' at '. $experience->company_name .', '.
                                                $experience->city?>
                                            </div>
                                        </div>
                                        <div class="switches-list -mt-8 is-large">
                                            <div class="col-md-1 pd5" style="display: flex;">
                                                <button type="button" class="ibtnDel" style="margin-right: 10px;">
                                                    <span class="icon-feather-trash-2"></span>
                                                </button>
                                                <button type="button" class="ibtnDel">
                                                    <span class="icon-feather-edit-2"></span>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                        <?php } }?>
                        <div class="job_list" id="job_list">
                        </div>

                        <div></div>
                        <div class="col-span-2">
                            <label for="">Education history</label>
                            <div class="pb-0 flex space-x-3" style="color: #2563eb;">
                                <button type="button" onclick="add_multiple_rows('college')"><span
                                            class="icon-material-outline-add-circle-outline">
                                     </span> Add college or university
                                </button>
                            </div>
                        </div>
                        <?php
                            if(!empty($user_education)) {
                                foreach($user_education as $education) {
                        ?>
                        <div class="col-span-2">

                            <div>
                                <div class="space-y-3">
                                    <div class="flex justify-between items-center">
                                        <div class="switches-list -mt-8 is-large">
                                            <div class="switch-container">
                                                <label class="switch"><input type="checkbox"><span
                                                            class="switch-button"></span> </label>
                                            </div>
                                        </div>
                                        <div>
                                            <div><?= $education->college_name?></div>
                                        </div>
                                        <div class="switches-list -mt-8 is-large">
                                            <div class="col-md-1 pd5" style="display: flex;">
                                                <button type="button" class="ibtnDel" style="margin-right: 10px;">
                                                    <span class="icon-feather-trash-2"></span>
                                                </button>
                                                <button type="button" class="ibtnDel">
                                                    <span class="icon-feather-edit-2"></span>
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                    <hr>
                                </div>

                            </div>

                        </div>
                        <?php } }?>
                        <div class="job_list" id="education_list">
                        </div>

                        <div class="col-span-2">
                            <label for="about">About me</label>
                            <textarea id="about" name="about" rows="3" class="with-border"></textarea>
                        </div>
                        <div class="col-span-2">
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox1" value="1" name="checkbox" checked>
                                <label for="chekcbox1"><span class="checkbox-icon"></span> Your information will be used
                                    according to Byloapp's Data Policy.
                                    Byloapp's Data Policy </label>
                            </div>
                        </div>

                    </div>

                </div>
            </form>
        </div>
        <div class="uk-modal-footer text-right" id="cancel_save">

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
