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
                    <div class=" md:mb-4 mb-3">
                        <div class="row">
                            <div class="col-lg-6">
                                <h2 class="text-2xl font-semibold">Blog Management </h2>
                            </div>
                        </div>
                    </div>
					
					
					
					<!----- blog  listing --->
					
					<div class="all-job-listing">
					       <div class="card md:p-6 max-w-1xl mx-auto jobs-cl">
                            <div id="job_content">
                                <div class=" md:mb-4 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h2 class="text-2xl font-semibold"> Jobs </h2>
                                        </div>
                                        <?php if($this->session->userdata('id')){ ?>
                                        <div class="col-lg-6">
                                            <div class="right-ct">
                                                <div class="add-job">
                                                    <button class="flex items-center justify-center z-10 h-10 w-10 rounded-full bg-blue-600 text-white right-0"
                                                            id="show_job_add_btn" href="#">
                                                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd"
                                                                  d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                                                                  clip-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>

                                <!--- job list --->
                                <div class="jobs-list">
                                    <nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
                                        <ul uk-switcher="connect: #jobs-list-tab; animation: uk-animation-fade">
                                            <li class="uk-active"><a class="active" href="#0"> Jobs </a></li>
                                            <?php if($this->session->userdata('id')){ ?>
                                            <li><a href="#0"> Candidates </a></li>
                                            <?php } ?>
                                        </ul>
                                    </nav>
                                    <div class=" px-2 uk-switcher" id="jobs-list-tab">
                                        <!------- job tab  ---->
                                        <div class="p-1">
                                            <div class="job-inner-tab">
                                                <nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
                                                    <ul uk-switcher="connect: #job-status-tab; animation: uk-animation-fade">
                                                        <li class="uk-active"><a class="active" href="#0"> Open and
                                                                paused
                                                                jobs <span> </a></li>
                                                        <?php if($this->session->userdata('id')){ ?>
                                                        <li><a href="#0">Close</a></li>
                                                        <?php }?>
                                                    </ul>
                                                </nav>
                                                <div class=" uk-switcher" id="job-status-tab">
                                                    <div class="p-1">
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <?php
                                                                foreach ($open_job_posting as $jobs) {
                                                                    if($jobs->job_status == 1){
                                                                ?>
                                                                <tbody>
                                                                <tr>
                                                                    <td class="table_data">
                                                                        <table class="table">
                                                                            <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="checkbox">
                                                                                        <label class="p-0">
                                                                                            <p class="data_listing m-0">
                                                                                                <a href="<?php echo base_url('jobs/').str_replace(' ', '-', $jobs->city).'/'.str_replace(' ', '-', $jobs->job_title).'/'.$jobs->create_job_id?>"
                                                                                                   class="title_text text-info"><?= $jobs->
                                                                                                    job_title?></a>
                                                                                                <span><?= $jobs->address  .','. $jobs->city .','. $jobs->state .','. $jobs->country .'-'. $jobs->pin_code?></span>
                                                                                                <span>Created: <?php echo $newdate = date("l, d M Y", strtotime($jobs->
                                                                                                    date));?></span>
                                                                                            </p>
                                                                                        </label>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="btn_badge">
                                                                                        <p class="data_listing">
                                                                                            <span>3</span>
                                                                                            <span class="">Applied Person</span>
                                                                                        </p>
                                                                                        <p class="data_listing">
                                                                                            <span>0</span>
                                                                                            <span class="">Hired</span>
                                                                                        </p>
                                                                                        <p class="data_listing">
                                                                                            <span>0</span>
                                                                                            <span class="">Rejected Person</span>
                                                                                        </p>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <p class="data_listing">
																				<span class="text-info">
																				<b class="text-dark">Job Status: </b><?php if ($jobs->
                                                                                    status == 1){ echo "Open";}?></span>
                                                                                    </p>
                                                                                </td>
                                                                                <td>
                                                                                    <select id="status"
                                                                                            onchange="status_change(32)"
                                                                                            class="form-control status-job table_control mb-0">
                                                                                        <option selected="" value="1">
                                                                                            Open
                                                                                        </option>
                                                                                        <option value="2"> Pending
                                                                                        </option>
                                                                                        <option value="0"> Close
                                                                                        </option>
                                                                                    </select>
                                                                                </td>
                                                                                <td>
                                                                                    <button class="button mr-btn"
                                                                                            type="button"><span
                                                                                                class="icon-feather-more-horizontal">
                                                                                        </span>
                                                                                    </button>
                                                                                    <div class="" uk-drop="mode: click">
                                                                                        <div class="card p-5">
                                                                                            <div class="uk-drop-grid"
                                                                                                 uk-grid>
                                                                                                <div>
                                                                                                    <ul class="right_menu">
                                                                                                        <li>
                                                                                                        <span href="#"
                                                                                                              id="show_job_edit_btn">Edit
                                                                                                            job</span>
                                                                                                        </li>
                                                                                                        <li>
                                                                                                            <a href="#modal-overflow"
                                                                                                               uk-toggle>View
                                                                                                                job
                                                                                                                details</a>

                                                                                                            <!---- view job model popup ---->
                                                                                                            <div id="modal-overflow"
                                                                                                                 uk-modal>
                                                                                                                <div class="uk-modal-dialog">

                                                                                                                    <button class="uk-modal-close-default m-3"
                                                                                                                            type="button"
                                                                                                                            uk-close></button>

                                                                                                                    <div class="uk-modal-header">
                                                                                                                        <h4 class="uk-modal-title">
                                                                                                                            Web
                                                                                                                            Designer</h4>
                                                                                                                    </div>

                                                                                                                    <div class="uk-modal-body"
                                                                                                                         uk-overflow-auto>
                                                                                                                        <div class="job-view-body">
                                                                                                                            <div class="card">
                                                                                                                                <div class="h-44 md:h-60 overflow-hidden relative rounded-t-lg w-full">
                                                                                                                                    <img src="<?php echo base_url()?>assets/images/blog/img-5.jpg"
                                                                                                                                         alt=""
                                                                                                                                         class="w-full h-full absolute inset-0 object-cover">
                                                                                                                                </div>

                                                                                                                                <div class="p-4 pt-0 divide-y divide-gray-100">

                                                                                                                                    <div class="md:py-8 py-3">
                                                                                                                                        <div class="row">
                                                                                                                                            <div class="col-lg-12 m-0">
                                                                                                                                                <h2 class="text-2xl font-bold">
                                                                                                                                                    Web
                                                                                                                                                    developer </h2>
                                                                                                                                                <p class="font-medium mt-1 text-base">
                                                                                                                                                    Front
                                                                                                                                                    end
                                                                                                                                                    developer </p>
                                                                                                                                            </div>

                                                                                                                                        </div>
                                                                                                                                    </div>

                                                                                                                                    <div class="md:py-8 py-3">
                                                                                                                                        <h1 class="block text-xl font-bold mb-9">
                                                                                                                                            Job
                                                                                                                                            details </h1>
                                                                                                                                        <div class="md:">
                                                                                                                                            <div class="md:w-3/3 space-y-4 -mt-2">
                                                                                                                                                <div class="flex items-center space-x-3">
                                                                                                                                                    <ion-icon
                                                                                                                                                            name="mail-open"
                                                                                                                                                            class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                                                                                                                                    <div class="flex-1">
                                                                                                                                                        <div>
                                                                                                                                                            Full-time,
                                                                                                                                                            Contractual
                                                                                                                                                            /
                                                                                                                                                            Temporary
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div class="flex items-center space-x-3">
                                                                                                                                                    <ion-icon
                                                                                                                                                    "
                                                                                                                                                    class="bg-gray-100
                                                                                                                                                    p-1.5
                                                                                                                                                    rounded-full
                                                                                                                                                    icon-material-outline-room"></ion-icon>
                                                                                                                                                    <div class="flex-1">
                                                                                                                                                        <div>
                                                                                                                                                            501,
                                                                                                                                                            Scheme
                                                                                                                                                            No
                                                                                                                                                            55,
                                                                                                                                                            NRK
                                                                                                                                                            Bizpark,
                                                                                                                                                            Scheme
                                                                                                                                                            54
                                                                                                                                                            PU4,
                                                                                                                                                            Indore,
                                                                                                                                                            Madhya
                                                                                                                                                            Pradesh
                                                                                                                                                            452010
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div class="flex items-center space-x-3">
                                                                                                                                                    <ion-icon
                                                                                                                                                            name="mail-open"
                                                                                                                                                            class="bg-gray-100 p-1.5 rounded-full  "></ion-icon>
                                                                                                                                                    <div class="flex-1">
                                                                                                                                                        <div>
                                                                                                                                                            Posted
                                                                                                                                                            21
                                                                                                                                                            hours
                                                                                                                                                            ago
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div class="flex items-center space-x-3">
                                                                                                                                                    <ion-icon
                                                                                                                                                            class="bg-gray-100 p-1.5 rounded-full text-xl icon-feather-phone"></ion-icon>
                                                                                                                                                    <div class="flex-1">
                                                                                                                                                        <div>
                                                                                                                                                            <a href="#"
                                                                                                                                                               class="text-blue-500">
                                                                                                                                                                9617145789 </a>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div class="flex items-center space-x-3">
                                                                                                                                                    <ion-icon
                                                                                                                                                            name="albums"
                                                                                                                                                            class="bg-gray-100 p-1.5 rounded-full text-xl"></ion-icon>
                                                                                                                                                    <div class="flex-1">
                                                                                                                                                        <div>
                                                                                                                                                            Graduate
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>

                                                                                                                                            </div>

                                                                                                                                            <div class="space-y-4 mt-6 text-sm font-medium">
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        Schedule
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        Morning
                                                                                                                                                        shift
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        Job
                                                                                                                                                        Location
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        Indore
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        Supplemental
                                                                                                                                                        Pay:
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        Performance
                                                                                                                                                        bonus
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        COVID-19
                                                                                                                                                        considerations
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        Complete
                                                                                                                                                        Vaccination
                                                                                                                                                        certificate
                                                                                                                                                        required
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        Start
                                                                                                                                                        Date
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        1/2/2022
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                                <div>
                                                                                                                                                    <div class="font-semibold mb-2">
                                                                                                                                                        End
                                                                                                                                                        date
                                                                                                                                                    </div>
                                                                                                                                                    <div class="text-gray-400">
                                                                                                                                                        15/2/2022
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                    </div>

                                                                                                                                    <div class="md:py-8 py-3">
                                                                                                                                        <h1 class="block text-2xl font-bold mb-6">
                                                                                                                                            Job
                                                                                                                                            Description </h1>
                                                                                                                                        <div class="space-y-3">
                                                                                                                                            <p>
                                                                                                                                                Lorem
                                                                                                                                                ipsum
                                                                                                                                                dolor
                                                                                                                                                sit
                                                                                                                                                amet,
                                                                                                                                                consectetuer
                                                                                                                                                adipiscing
                                                                                                                                                elit,
                                                                                                                                                sed
                                                                                                                                                diam
                                                                                                                                                nonummy
                                                                                                                                                nibh
                                                                                                                                                euismod
                                                                                                                                                tincidunt
                                                                                                                                                ut
                                                                                                                                                laoreet
                                                                                                                                                dolore
                                                                                                                                                magna
                                                                                                                                                aliquam
                                                                                                                                                erat
                                                                                                                                                volutpat.
                                                                                                                                                Ut
                                                                                                                                                wisi
                                                                                                                                                enim
                                                                                                                                                ad
                                                                                                                                                minim
                                                                                                                                                veniam,
                                                                                                                                                quis
                                                                                                                                                nostrud
                                                                                                                                                exerci
                                                                                                                                                tation
                                                                                                                                                ullamcorper
                                                                                                                                                suscipit
                                                                                                                                                lobortis
                                                                                                                                                nisl
                                                                                                                                                ut
                                                                                                                                                aliquip
                                                                                                                                                ex
                                                                                                                                                ea
                                                                                                                                                commodo
                                                                                                                                                consequat.
                                                                                                                                            </p>
                                                                                                                                            <p>
                                                                                                                                                Lorem
                                                                                                                                                ipsum
                                                                                                                                                dolor
                                                                                                                                                sit
                                                                                                                                                amet,
                                                                                                                                                consectetuer
                                                                                                                                                adipiscing
                                                                                                                                                elit,
                                                                                                                                                sed
                                                                                                                                                diam
                                                                                                                                                nonummy
                                                                                                                                                nibh
                                                                                                                                                euismod
                                                                                                                                                tincidunt
                                                                                                                                                ut
                                                                                                                                                laoreet
                                                                                                                                                dolore
                                                                                                                                                magna
                                                                                                                                                aliquam
                                                                                                                                                erat
                                                                                                                                                volutpat.
                                                                                                                                                Ut
                                                                                                                                                wisi
                                                                                                                                                enim
                                                                                                                                                ad
                                                                                                                                                minim
                                                                                                                                                veniam,
                                                                                                                                                quis
                                                                                                                                                nostrud
                                                                                                                                                exerci
                                                                                                                                                tation
                                                                                                                                                ullamcorper
                                                                                                                                                suscipit
                                                                                                                                                lobortis
                                                                                                                                                nisl
                                                                                                                                                ut
                                                                                                                                                aliquip
                                                                                                                                                ex
                                                                                                                                                ea
                                                                                                                                                commodo
                                                                                                                                                consequat.
                                                                                                                                            </p>
                                                                                                                                            <p>
                                                                                                                                                Lorem
                                                                                                                                                ipsum
                                                                                                                                                dolor
                                                                                                                                                sit
                                                                                                                                                amet,
                                                                                                                                                consectetuer
                                                                                                                                                adipiscing
                                                                                                                                                elit,
                                                                                                                                                sed
                                                                                                                                                diam
                                                                                                                                                nonummy
                                                                                                                                                nibh
                                                                                                                                                euismod
                                                                                                                                                tincidunt
                                                                                                                                                ut
                                                                                                                                                laoreet
                                                                                                                                                dolore
                                                                                                                                                magna
                                                                                                                                                aliquam
                                                                                                                                                erat
                                                                                                                                                volutpat.
                                                                                                                                                Ut
                                                                                                                                                wisi
                                                                                                                                                enim
                                                                                                                                                ad
                                                                                                                                                minim
                                                                                                                                                veniam,
                                                                                                                                                quis
                                                                                                                                                nostrud
                                                                                                                                                exerci
                                                                                                                                                tation
                                                                                                                                                ullamcorper
                                                                                                                                                suscipit
                                                                                                                                                lobortis
                                                                                                                                                nisl
                                                                                                                                                ut
                                                                                                                                                aliquip
                                                                                                                                                ex
                                                                                                                                                ea
                                                                                                                                                commodo
                                                                                                                                                consequat.
                                                                                                                                                Nam
                                                                                                                                                liber
                                                                                                                                                tempor
                                                                                                                                                cum
                                                                                                                                                soluta
                                                                                                                                                nobis
                                                                                                                                                eleifend
                                                                                                                                                option
                                                                                                                                                congue
                                                                                                                                                nihil
                                                                                                                                                imperdiet
                                                                                                                                                doming
                                                                                                                                                id
                                                                                                                                                quod
                                                                                                                                                mazim
                                                                                                                                                placerat
                                                                                                                                                facer
                                                                                                                                                possim
                                                                                                                                                assum.
                                                                                                                                                Lorem
                                                                                                                                                ipsum
                                                                                                                                                dolor
                                                                                                                                                sit
                                                                                                                                                amet,
                                                                                                                                                consectetuer
                                                                                                                                                adipiscing
                                                                                                                                                elit,
                                                                                                                                            </p>
                                                                                                                                            <p>
                                                                                                                                                Consectetuer
                                                                                                                                                adipiscing
                                                                                                                                                elit,
                                                                                                                                                sed
                                                                                                                                                diam
                                                                                                                                                nonummy
                                                                                                                                                nibh
                                                                                                                                                euismod
                                                                                                                                                tincidunt
                                                                                                                                                ut
                                                                                                                                                laoreet
                                                                                                                                                dolore
                                                                                                                                                magna
                                                                                                                                                aliquam
                                                                                                                                                erat
                                                                                                                                                volutpat.
                                                                                                                                                Ut
                                                                                                                                                wisi
                                                                                                                                                enim
                                                                                                                                                ad
                                                                                                                                                minim
                                                                                                                                                veniam,
                                                                                                                                                quis
                                                                                                                                                nostrud
                                                                                                                                                exerci
                                                                                                                                                tation
                                                                                                                                                ullamcorper
                                                                                                                                                suscipit
                                                                                                                                                lobortis
                                                                                                                                                nisl
                                                                                                                                                ut
                                                                                                                                                aliquip
                                                                                                                                                ex
                                                                                                                                                ea
                                                                                                                                                commodo
                                                                                                                                                consequat.
                                                                                                                                            </p>
                                                                                                                                        </div>
                                                                                                                                    </div>

                                                                                                                                </div>

                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div class="uk-modal-footer text-right">
                                                                                                                        <button class="button gray uk-modal-close"
                                                                                                                                type="button">
                                                                                                                            Cancel
                                                                                                                        </button>
                                                                                                                    </div>

                                                                                                                </div>
                                                                                                            </div>

                                                                                                            <!---- view job model popup end ---->
                                                                                                        </li>
                                                                                                    </ul>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                                </tbody>
                                                                <?php } } ?>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <!---Status 0 means Jobs are Close--->

                                                    <div class="p-1">
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <?php
                                                                foreach ($open_job_posting as $close_jobs) {
                                                                    if($close_jobs->job_status == 0) {
                                                                ?>
                                                                <tbody>
                                                                <tr>
                                                                    <td class="table_data">
                                                                        <table class="table">
                                                                            <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <div class="checkbox">
                                                                                        <label class="p-0">
                                                                                            <p class="data_listing m-0">
                                                                                                <a href="<?php echo base_url('jobs/').str_replace(' ', '-', $close_jobs->city).'/'.str_replace(' ', '-', $close_jobs->job_title).'/'.$close_jobs->create_job_id?>"
                                                                                                   class="title_text text-info"><?= $close_jobs->
                                                                                                    job_title?></a>
                                                                                                <span><?= $close_jobs->
                                                                                                    address  .', '.  $close_jobs->city .', '.  $close_jobs->state   .', '.  $close_jobs->country .' - '.  $close_jobs->pin_code?></span>
                                                                                                <span>Created: <?php echo $newdate = date("l, d M Y", strtotime($close_jobs->
                                                                                                    date));?></span>
                                                                                            </p>
                                                                                        </label>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="btn_badge">
                                                                                        <p class="data_listing">
                                                                                            <span>3</span>
                                                                                            <span class="">Applied Person</span>
                                                                                        </p>
                                                                                        <p class="data_listing">
                                                                                            <span>0</span>
                                                                                            <span class="">Hired</span>
                                                                                        </p>
                                                                                        <p class="data_listing">
                                                                                            <span>0</span>
                                                                                            <span class="">Rejected Person</span>
                                                                                        </p>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <p class="data_listing">
																				<span class="text-info">
																				<b class="text-dark">Job Status: </b>
                                                                                    Close</span>
                                                                                    </p>
                                                                                </td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                                <?php } } ?>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!------- candidates tab  ---->
                                        <div class="p-1">
                                            <nav class="responsive-nav border-b  mb-2 -mt-2 sidechat_tabs">
                                                <ul uk-switcher="connect: #candidates-tab; animation: uk-animation-fade">
                                                    <li class="uk-active"><a class="active" href="#0">Applied Jobs<span></a>
                                                    </li>
                                                    <li><a href="#1">Hired Jobs </a></li>
                                                    <li><a href="#2">Reject Jobs</a></li>
                                                </ul>
                                            </nav>
                                            <div class=" px-2 uk-switcher" id="candidates-tab">
                                                <!------- job tab  ---->
                                                <div class="p-1">
                                                    <div class="table-responsive candidate-table">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">Candidate</th>
                                                                <th scope="col">Applied Role</th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                            </thead>
                                                            <?php if(!empty($apply_job)) {
                                                                foreach($apply_job as $job_apply) {
                                                                    if($job_apply->status == 1) {
                                                            ?>
                                                            <tbody>
                                                            <tr>
                                                                <td scope="row">
                                                                    <div class="checkbox">
                                                                        <label class="p-0">
                                                                            <p class="data_listing m-0">
                                                                                <a href="<?php echo base_url()?><?= $job_apply->user_code?>"
                                                                                   class="title_text text-info"><?= $job_apply->
                                                                                    first_name .' '.
                                                                                    $job_apply->last_name?></a>
                                                                                <span>Applied on <?= date("l d F Y", strtotime($job_apply->
                                                                                    datetime)); ?></span>
                                                                                <span>Awaiting Status: &nbsp; <span
                                                                                            style="color: green;font-weight:800;"><?php if ($job_apply->
                                                                                        status == 1) {echo "Applied"; }?></span></span>
                                                                            </p>
                                                                        </label>
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <p class="data_listing"><span
                                                                                class="text-info"> <?= $job_apply->
                                                                            job_title?> </span></p>
                                                                </td>
                                                                <td>
                                                                    <button class="button mr-btn" type="button">
                                                                            <span class="icon-feather-more-horizontal">
                                                                        </span>
                                                                    </button>
                                                                    <div class="" uk-drop="mode: click">
                                                                        <div class="card p-5">
                                                                            <div class="uk-drop-grid" uk-grid>
                                                                                <div>
                                                                                    <ul class="right_menu">
                                                                                        <li><a href="#">Edit job</a>
                                                                                        </li>
                                                                                        <li><a href="#">View job
                                                                                                details</a></li>
                                                                                        <li><a href="#">View public job
                                                                                                page</a></li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                            <?php } } } ?>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="p-1">
                                                    <div class="table-responsive candidate-table">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">Candidate</th>
                                                                <th scope="col">Applied Role</th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                            </thead>
                                                            <?php if($apply_job) {
                                                                foreach($apply_job as $job_apply) {
                                                                    if($job_apply->status == 2) {
                                                            ?>
                                                            <tbody>
                                                            <tr>
                                                                <td scope="row">
                                                                    <div class="checkbox">
                                                                        <label class="p-0">
                                                                            <p class="data_listing m-0">
                                                                                <a href="<?php echo base_url()?><?= $job_apply->user_code?>"
                                                                                   class="title_text text-info"><?= $job_apply->
                                                                                    first_name .' '.
                                                                                    $job_apply->last_name?></a>
                                                                                <span>Applied on <?= date("l d F Y", strtotime($job_apply->
                                                                                    datetime)); ?></span>
                                                                                <span>Awaiting Status: &nbsp; <span
                                                                                            style="color: green;font-weight:800;"><?php if ($job_apply->
                                                                                        status == 2) {echo "Hired"; }?></span></span>
                                                                            </p>
                                                                        </label>
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <p class="data_listing"><span
                                                                                class="text-info"> <?= $job_apply->
                                                                            job_title?> </span></p>
                                                                </td>
                                                                <td>
                                                                    <button class="button mr-btn" type="button">
                                                                        <span class="icon-feather-more-horizontal">
																		</span>
                                                                    </button>
                                                                    <div class="" uk-drop="mode: click">
                                                                        <div class="card p-5">
                                                                            <div class="uk-drop-grid" uk-grid>
                                                                                <div>
                                                                                    <ul class="right_menu">
                                                                                        <li>
                                                                                            <a href="#">Edit job</a>
                                                                                        </li>
                                                                                        <!--li>
                                                                                            <a href="#">Post job in multiple locations</a>
                                                                                            </li>
                                                                                            <li>
                                                                                            <a href="#">Sponsor your job</a>
                                                                                        </li-->
                                                                                        <li>
                                                                                            <a href="#">View job
                                                                                                details</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="#">View public job
                                                                                                page</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                            <?php } } }?>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="p-1">
                                                    <div class="table-responsive candidate-table">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">Candidate</th>
                                                                <th scope="col">Applied Role</th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                            </thead>
                                                            <?php if($apply_job) {
                                                                foreach($apply_job as $job_apply) {
                                                                    if($job_apply->status == 0) {
                                                            ?>
                                                            <tbody>
                                                            <tr>
                                                                <td scope="row">
                                                                    <div class="checkbox">
                                                                        <label class="p-0">
                                                                            <p class="data_listing m-0">
                                                                                <a href="<?php echo base_url()?><?= $job_apply->user_code?>"
                                                                                   class="title_text text-info"><?= $job_apply->
                                                                                    first_name .' '.
                                                                                    $job_apply->last_name?></a>
                                                                                <span>Applied on <?= date("l d F Y", strtotime($job_apply->
                                                                                    datetime)); ?></span>
                                                                                <span>Awaiting Status: &nbsp; <span
                                                                                            style="color: green;font-weight:800;"><?php if ($job_apply->
                                                                                        status == 0) {echo "Reject"; }?></span></span>
                                                                            </p>
                                                                        </label>
                                                                    </div>
                                                                </td>

                                                                <td>
                                                                    <p class="data_listing"><span
                                                                                class="text-info"> <?= $job_apply->
                                                                            job_title?> </span></p>
                                                                </td>
                                                                <td>
                                                                    <button class="button mr-btn" type="button"><span
                                                                                class="icon-feather-more-horizontal">

																		</span>
                                                                    </button>
                                                                    <div class="" uk-drop="mode: click">
                                                                        <div class="card p-5">
                                                                            <div class="uk-drop-grid" uk-grid>
                                                                                <div>
                                                                                    <ul class="right_menu">
                                                                                        <li>
                                                                                            <a href="#"
                                                                                               id="show_job_edit_btn">Edit
                                                                                                job</a>
                                                                                        </li>
                                                                                        <!--li>
                                                                                            <a href="#">Post job in multiple locations</a>
                                                                                            </li>
                                                                                            <li>
                                                                                            <a href="#">Sponsor your job</a>
                                                                                        </li-->
                                                                                        <li>
                                                                                            <a href="#">View job
                                                                                                details</a>
                                                                                        </li>
                                                                                        <li>
                                                                                            <a href="#">View public job
                                                                                                page</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                            <?php } } }?>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!---  add job form ---->
                            <div id="show_job_form" style="display:none;">
                                <div class="job-step-container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h4 class="text-2xl font-semibold">Add Jobs </h4>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="right-ct">
                                                <button class="button" id="show_job_back_btn" href="#">Back</button>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="<?php echo base_url()?>/JobCntrl/insert_job" mathod="post"
                                          id="create_job" name="create_job">
                                        <div class="row">
                                            <!--<div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Select Page</label>
                                                    <div class="form-group">
                                                        <select id="select-bs-page" Name="page_id">
                                                            <option value="">Select Page</option>
                                                            <?php
																if(!empty($user_page)){
																	foreach($user_page as $page){
															?>
                                                            <option value="<?= $page->id;?>"><?= $page->page_name;?></option>
                                                            <?php } }?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Job Title *</label>
                                                    <input class="form-control" type="text" name="job_title"
                                                           placeholder="Job Title">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Company name for this job *</label>
                                                    <input class="form-control" type="text" name="company_name"
                                                           placeholder="Company name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Your role in this hiring process</label>
                                                    <div class="form-group">
                                                        <select name="job_role" class="select-role form-control">
                                                            <option value="1">Option 1</option>
                                                            <option value="2">Option 2</option>
                                                            <option value="3">Option 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>What Category does this job fall under? *</label>
                                                    <div class="form-group">
                                                        <select name="job_category" class="select-role form-control">
                                                            <option value="1">Front End Developers</option>
                                                            <option value="2">Healthcare</option>
                                                            <option value="3">Back End Developers</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Where will in employee report to work? *</label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="report_location">
                                                            <option value="1">Employees report to a specific location
                                                            </option>
                                                            <option value="2">Employees will not report to a specific
                                                                location
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Education</label>
                                                    <input class="form-control" type="text" name="education"
                                                           placeholder="Education">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input class="form-control" type="text" name="address"
                                                           placeholder="Address">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Country </label>
                                                    <div class="form-group">
                                                        <select id="get_country" class="select-role form-control"
                                                                name="country">
                                                            <option value="">Select your country name</option>
                                                            <?php
														    if(!empty($country)) {
														        foreach($country as $cou) {
														?>
                                                            <option value="<?= $cou->id?>"><?= $cou->name?></option>
                                                            <?php } }?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>State </label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="state"
                                                                id="state">
                                                            <option value="">Select your State</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>City </label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" id="city" name="city">
                                                            <option value="">Select your city</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Pin Code </label>
                                                    <div class="form-group">
                                                        <input type="text" class="select-role form-control"
                                                               name="pin_code">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label>How many hires? * </label>
                                                <div class="form-group no-job">
                                                    <div class="input-group">
                                                        <input type="button" value="-" name="number_hire"
                                                               class="button-minus" data-field="quantity">
                                                        <input type="number" step="0" max="" value="1" name="quantity"
                                                               class="quantity-field">
                                                        <input type="button" value="+" class="button-plus ct-btn"
                                                               data-field="quantity">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label>What Contract type is it? Multiple select</label>
                                                <select class="form-control select2" name="contract[]"
                                                        autocomplete="none" multiple>
                                                    <option value="1">Temporary</option>
                                                    <option value="2">Contract</option>
                                                    <option value="3">Internship</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>what is the schedule for this job</label>
                                                    <div class="form-group">
                                                        <select class="mul-select" Name="schedule_job[]"
                                                                multiple="true">
                                                            <option value="1">Morning Shift</option>
                                                            <option value="2">Day Shift</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Salary & Benefits</label>
                                                    <input class="form-control" type="text" name="salary"
                                                           placeholder="Salary & Benefits">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Are there any forms supplimental pay offered?</label>
                                                    <div class="form-group">
                                                        <select id="pay-offered" Name="supplimental[]" multiple="true">
                                                            <option value="1">Commissionn Pay</option>
                                                            <option value="2">Overtime Pay</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Are any of the following benefits offered</label>
                                                    <div class="form-group">
                                                        <select id="benefits-offered" Name="benefits[]" multiple="true">
                                                            <option value="1">Food Allowance</option>
                                                            <option value="2">Health Insurance</option>
                                                            <option value="3">Health Form home</option>
                                                            <option value="4">Other</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Let Applicant call you directly </label>
                                                    <input class="form-control" type="text" name="number"
                                                           placeholder="Enter Phone No. ">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> How do you want to receive Applications </label>
                                                    <input class="form-control" type="email" name="received_mail"
                                                           placeholder="Enter Email">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Daily update about this job and candidates will be sent
                                                        to: </label>
                                                    <input class="form-control" type="email" name="sent_mail"
                                                           placeholder="Enter Email">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Is there a planned start date for this job?</label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input type="radio" id="chkYes" value="1" name="chkPinNo"/>
                                                            <label for="chkYes"><span class="radio-label"></span>
                                                                Yes</label>
                                                        </div>
                                                        <br>
                                                        <div class="radio">
                                                            <input type="radio" id="chkNo" value="0" name="chkPinNo"/>
                                                            <label for="chkNo"><span class="radio-label"></span>
                                                                No</label>
                                                        </div>
                                                        <hr>
                                                        <div id="dvPinNo" style="display: none">
                                                            Select Date
                                                            <input type="date" class="form-control" name="star_date"
                                                                   id="txtPinNo"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Is there an application deadline?</label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input type="radio" id="chkYes1" value="1"
                                                                   name="chkPinNo1"/>
                                                            <label for="chkYes1"><span class="radio-label"></span>
                                                                Yes</label>
                                                        </div>
                                                        <br>
                                                        <div class="radio">
                                                            <input type="radio" id="chkNo1" value="0" name="chkPinNo1"/>
                                                            <label for="chkNo1"><span class="radio-label"></span>
                                                                No</label>
                                                        </div>
                                                        <hr>
                                                        <div id="dvPinNo1" style="display: none">
                                                            Select Date
                                                            <input type="date" class="form-control" id="txtPinNo1"
                                                                   name="end_date"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Do you want applicant to submit resume </label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input id="radio-1" name="resume" value="1" type="radio">
                                                            <label for="radio-1"><span class="radio-label"></span> Yes
                                                            </label>
                                                        </div>

                                                        <br>

                                                        <div class="radio">
                                                            <input id="radio-2" name="resume" value="0" type="radio">
                                                            <label for="radio-2"><span class="radio-label"></span> No
                                                            </label>
                                                        </div>

                                                        <br>

                                                        <div class="radio">
                                                            <input id="radio-3" name="resume" value="2" type="radio">
                                                            <label for="radio-3"><span class="radio-label"></span>
                                                                Optional </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Are you taking any additional covid-19 </label>
                                                    <textarea name="covid" class="form-control" rows="3" c> </textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> How do you want to receive Applications </label>
                                                    <input class="form-control" type="file" name="image">
                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label> Job Description </label>
                                                    <textarea name="description" class="form-control"
                                                              rows="5"> </textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="button" class="job-btn"
                                                            onclick="MyFunction('<?php echo $po->page_id?>','create_job')">
                                                        Submit
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!---- end job  add form -->

                            <!--- Edit job form ---->
                            <div id="show_job_edit_form" style="display:none;">
                                <div class="job-step-container">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h4 class="text-2xl font-semibold">Edit Jobs </h4>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="right-ct">
                                                <button class="button" id="show_job_back_edit_btn" href="#">Back
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <form action="JobCntrl/insert_job" mathod="post" id="reg_form" name="create_job">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Select Page</label>
                                                    <div class="form-group">
                                                        <select id="select-bs-page-job" Name="page_id">
                                                            <option value="">Select Page</option>
                                                            <?php
																if(!empty($user_page)){
																	foreach($user_page as $page){
															?>
                                                            <option value="<?= $page->id;?>"><?= $page->page_name;?>
                                                            </option>
                                                            <?php } }?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Job Title *</label>
                                                    <input class="form-control" type="text" name="job_title"
                                                           placeholder="Job Title">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Company name for this job *</label>
                                                    <input class="form-control" type="text" name="company_name"
                                                           placeholder="Company name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Your role in this hiring process</label>
                                                    <div class="form-group">
                                                        <select name="job_role" class="select-role form-control">
                                                            <option value="1">Option 1</option>
                                                            <option value="2">Option 2</option>
                                                            <option value="3">Option 3</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>What Category does this job fall under? *</label>
                                                    <div class="form-group">
                                                        <select name="job_category" class="select-role form-control">
                                                            <option value="1">Front End Developers</option>
                                                            <option value="2">Healthcare</option>
                                                            <option value="3">Back End Developers</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Where will in employee report to work? *</label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="report_location">
                                                            <option value="1">Employees report to a specific location
                                                            </option>
                                                            <option value="2">Employees will not report to a specific
                                                                location
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Education</label>
                                                    <input class="form-control" type="text" name="education"
                                                           placeholder="Education">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input class="form-control" type="text" name="address"
                                                           placeholder="Address">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Country </label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="country">
                                                            <option value="1">India</option>
                                                            <option value="2">Uk</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>State </label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="state">
                                                            <option value="1">MP</option>
                                                            <option value="2">UP</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>City </label>
                                                    <div class="form-group">
                                                        <select class="select-role form-control" name="city">
                                                            <option value="1">Indore</option>
                                                            <option value="2">Bhopal</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Pin Code </label>
                                                    <div class="form-group">
                                                        <input type="text" class="select-role form-control"
                                                               name="pin_code">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label>How many hires? * </label>
                                                <div class="form-group no-job">
                                                    <div class="input-group">
                                                        <input type="button" value="-" name="number_hire"
                                                               class="button-minus" data-field="quantity">
                                                        <input type="number" step="0" max="" value="1" name="quantity"
                                                               class="quantity-field">
                                                        <input type="button" value="+" class="button-plus ct-btn"
                                                               data-field="quantity">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label>What Contract type is it? Multiple select</label>
                                                <select class="form-control select2" name="contract[]"
                                                        autocomplete="none" multiple>
                                                    <option value="1">Temporary</option>
                                                    <option value="2">Contract</option>
                                                    <option value="3">Internship</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>what is the schedule for this job</label>
                                                    <div class="form-group">
                                                        <select class="mul-select" Name="schedule_job[]"
                                                                multiple="true">
                                                            <option value="1">Morning Shift</option>
                                                            <option value="2">Day Shift</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Salary & Benefits</label>
                                                    <input class="form-control" type="text" name="salary"
                                                           placeholder="Salary & Benefits">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Are there any forms supplimental pay offered?</label>
                                                    <div class="form-group">
                                                        <select id="pay-offered" Name="supplimental[]" multiple="true">
                                                            <option value="1">Commissionn Pay</option>
                                                            <option value="2">Overtime Pay</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group ">
                                                    <label>Are any of the following benefits offered</label>
                                                    <div class="form-group">
                                                        <select id="benefits-offered" Name="benefits[]" multiple="true">
                                                            <option value="1">Food Allowance</option>
                                                            <option value="2">Health Insurance</option>
                                                            <option value="3">Health Form home</option>
                                                            <option value="4">Other</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Let Applicant call you directly </label>
                                                    <input class="form-control" type="text" name="number"
                                                           placeholder="Enter Phone No. ">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> How do you want to receive Applications </label>
                                                    <input class="form-control" type="email" name="received_mail"
                                                           placeholder="Enter Email">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Daily update about this job and candidates will be sent
                                                        to: </label>
                                                    <input class="form-control" type="email" name="sent_mail"
                                                           placeholder="Enter Email">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Is there a planned start date for this job?</label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input type="radio" id="chkYes" value="1" name="chkPinNo"/>
                                                            <label for="chkYes"><span class="radio-label"></span>
                                                                Yes</label>
                                                        </div>
                                                        <br>
                                                        <div class="radio">
                                                            <input type="radio" id="chkNo" value="0" name="chkPinNo"/>
                                                            <label for="chkNo"><span class="radio-label"></span>
                                                                No</label>
                                                        </div>
                                                        <hr>
                                                        <div id="dvPinNo" style="display: none">
                                                            Select Date
                                                            <input type="date" class="form-control" name="star_date"
                                                                   id="txtPinNo"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Is there an application deadline?</label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input type="radio" id="chkYes1" value="1"
                                                                   name="chkPinNo1"/>
                                                            <label for="chkYes1"><span class="radio-label"></span>
                                                                Yes</label>
                                                        </div>
                                                        <br>
                                                        <div class="radio">
                                                            <input type="radio" id="chkNo1" value="0" name="chkPinNo1"/>
                                                            <label for="chkNo1"><span class="radio-label"></span>
                                                                No</label>
                                                        </div>
                                                        <hr>
                                                        <div id="dvPinNo1" style="display: none">
                                                            Select Date
                                                            <input type="date" class="form-control" id="txtPinNo1"
                                                                   name="end_date"/>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Do you want applicant to submit resume </label>
                                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                                        <div class="radio">
                                                            <input id="radio-1" name="resume" value="1" type="radio">
                                                            <label for="radio-1"><span class="radio-label"></span> Yes
                                                            </label>
                                                        </div>

                                                        <br>

                                                        <div class="radio">
                                                            <input id="radio-2" name="resume" value="0" type="radio">
                                                            <label for="radio-2"><span class="radio-label"></span> No
                                                            </label>
                                                        </div>

                                                        <br>

                                                        <div class="radio">
                                                            <input id="radio-3" name="resume" value="2" type="radio">
                                                            <label for="radio-3"><span class="radio-label"></span>
                                                                Optional </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> Are you taking any additional covid-19 </label>
                                                    <textarea name="covid" class="form-control" rows="3" c> </textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label> How do you want to receive Applications </label>
                                                    <input class="form-control" type="file" name="image">
                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label> Job Description </label>
                                                    <textarea name="description" class="form-control"
                                                              rows="5"> </textarea>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="button" class="job-btn"
                                                            onclick="MyFunction('create_job')">Update
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--- end edit job form ---->

                        </div>
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
