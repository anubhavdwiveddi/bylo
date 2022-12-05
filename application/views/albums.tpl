<?php echo $layout['meta'];?>
<body>

<div id="wrapper">
    <?php echo $layout['header'];?>
    <?php echo $layout['sidebar'];?>
    <div class="main_content">
        <div class="mcontainer">
            <div class="flex justify-between items-center relative md:mb-4 mb-2">
                <div class="flex-1">
                    <h2 class="text-2xl font-semibold"></h2>
                </div>
            </div>

            <div class="lg:px-40 watch-photo">
                <?php
				  if(!empty($public_media)){
				  foreach($public_media as $public) {
				  $result = substr($public->image_alt_name, 0, 15);
                ?>
                <div class="card lg:mx-0 uk-animation-slide-bottom-small mb-4">
                    <div class="flex justify-between items-center lg:p-4 p-2.5">
                        <div class="flex flex-1 items-center space-x-4">
                            <?php if($public->page_id == 0 || $public->page_id == ''){ ?>
                            <img src="<?= base_url('upload')?><?= $public->image_address?>"
                                 class="bg-gray-200 border border-white rounded-full w-10 h-10">
                            <?php } else { ?>
                            <img src="<?= base_url()?><?php if($public->business_Logo !=''){ echo "upload/$public->business_Logo"; } else {echo"$public->avatar_image";}?>" class="bg-gray-200 border border-white rounded-full w-10 h-10">
                            <?php } ?>

                            <div class="flex-1 font-semibold capitalize">
                                <a href="<?php echo base_url()?><?php if($public->page_name != ''){ echo" page/$public->city_name/$public->user_name"; } else {echo"$public->user_code"; }?>" class="text-black dark:text-gray-100"> <?php if ($public->page_name != ''){ echo "$public->page_name"; } else {echo "$public->first_name $public->last_name" ; } ?></a>
                                <div class="text-gray-700 flex items-center space-x-2">
                                    <span> <?php echo $newdate = date("d F Y", strtotime($public->datetime));?></span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <a href="#">
                                <i class="icon-feather-more-horizontal text-2xl hover:bg-gray-200 rounded-full p-2 transition -mr-1 dark:hover:bg-gray-700"></i>
                            </a>
                            <div class="bg-white w-56 shadow-md mx-auto p-2 mt-12 rounded-md text-gray-500 hidden text-base border border-gray-100 dark:bg-gray-900 dark:text-gray-100 dark:border-gray-700"
                                 uk-drop="mode: click;pos: bottom-right;animation: uk-animation-slide-bottom-small">
                                <ul class="space-y-1">
                                    <!---<li>
                                            <a href="#" class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                                    <i class="uil-share-alt mr-1"></i> Share
                                            </a>
                                    </li>--->

                                    <li>
                                        <a href="#"
                                           class="flex items-center px-3 py-2 hover:bg-gray-200 hover:text-gray-800 rounded-md dark:hover:bg-gray-800">
                                            <i class="uil-favorite mr-1"></i> Save
                                        </a>
                                    </li>

                                </ul>

                            </div>
                        </div>
                    </div>

                    <div>
                        <?php if(!empty($public->page_id)){ ?>
                        <!---<a href="<?php echo base_url('photo/').$public->image_alt_name.'/'.$public->photos_id?>">--->
                            <img src="<?php echo base_url('upload')?><?= $public->image_address?>"
                                 alt="<?= $public->image_alt_name?>" class="max-h-96 w-full object-cover">
                        <!---</a>-->
                        <?php } else { ?>
                        <!---<a href="<?php echo base_url('photo/').$public->photos_id?>">--->
                        <img src="<?php echo base_url('upload');?><?= $public->image_address?>"
                             alt="<?= $public->image_alt_name?>" class="max-h-96 w-full object-cover">
                            <!---</a>--->
                        <?php } ?>

                    </div>

                    <div class="p-4 space-y-3">
                        <div class="flex space-x-4 lg:font-bold">
                            <span>
                                <svg id="Layer_1" width="20px" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 336.56 336.56">
                                    <defs>
                                        <style>.cls-1{fill:none;stroke-miterlimit:10;stroke-width:16px;stroke:url(#linear-gradient);}</style>
                                        <linearGradient id="linear-gradient" x1="64.93" y1="41.8" x2="269.55" y2="218.85" gradientUnits="userSpaceOnUse">
                                            <stop offset="0.08" stop-color="#f15648"/>
                                            <stop offset="0.36" stop-color="#eb107c"/>
                                            <stop offset="0.7" stop-color="#8a63aa"/>
                                            <stop offset="1" stop-color="#73c6ef"/>
                                        </linearGradient>
                                    </defs>
                                    <path class="cls-1" d="M307.56,129.06c0-45.57-33.58-82.5-75-82.5-27.44,0-51.43,16.22-64.5,40.4C155,62.78,131,46.56,103.56,46.56c-41.42,0-75,36.93-75,82.5a88.85,88.85,0,0,0,8.9,39h0c7.37,15.07,18.09,24.48,29.09,36.48,23.64,23.7,62,54.24,101.72,82.72,0,0,67.55-52.2,112.42-95h0C297.11,177.18,307.56,154.47,307.56,129.06Z"/>
                                </svg>
                            </span>

                            <span>
                                <svg id="Layer_2" width="20px" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 336.56 336.56">
                                    <defs>
                                        <style>.cls-1{fill:url(#linear-gradient);}.cls-2{fill:#fff;}</style>
                                        <linearGradient id="linear-gradient" x1="34.79" y1="168.28" x2="301.77" y2="168.28" gradientUnits="userSpaceOnUse">
                                            <stop offset="0.08" stop-color="#f15648"/>
                                            <stop offset="0.36" stop-color="#eb107c"/>
                                            <stop offset="0.7" stop-color="#8a63aa"/>
                                            <stop offset="1" stop-color="#73c6ef"/>
                                        </linearGradient>
                                    </defs>
                                    <path class="cls-1" d="M34.79,168.43c.41-65.5,48.45-121.68,113.09-131.67A133,133,0,0,1,300,146.94c4.8,29.32,0,57.32-13.93,83.62a8,8,0,0,0-.51,7c5.09,14.94,10,29.94,15,44.9,1.88,5.59,1.48,10.72-2.81,15s-9.48,4.69-15,2.83c-15.16-5.08-30.34-10.1-45.47-15.24a6.68,6.68,0,0,0-5.85.47c-79.24,42.4-176.72-4.06-193.62-92.37C36.16,185,35.74,176.68,34.79,168.43ZM267.16,267c-.44-1.42-.71-2.38-1-3.33-2.58-7.78-4.86-15.68-7.86-23.3-2.66-6.73-1.67-12.36,2-18.54,14.12-23.95,18.31-49.81,12.14-76.87-12.83-56.26-64.92-91.12-122-82.15-47,7.4-84.77,47.8-88.44,95.34-2.93,38.05,10.48,69.65,40.24,93.57,23,18.5,49.75,25.53,79.14,22.16a101.65,101.65,0,0,0,42.3-14.73c4.93-3,9.77-3.77,15.09-1.59,1,.39,2,.68,2.95,1Z"/>
                                    <path class="cls-2" d="M277.79,277.63l-28.2-9.34c-1.09-.36-2.2-.69-3.26-1.12-5.9-2.41-11.26-1.61-16.72,1.76a112.38,112.38,0,0,1-46.85,16.32C150.21,289,120.59,281.2,95.1,260.7c-33-26.49-47.81-61.5-44.57-103.64,4.06-52.65,45.9-97.4,98-105.59,63.19-9.94,120.88,28.68,135.09,91,6.84,30,2.2,58.62-13.44,85.14-4,6.85-5.13,13.09-2.19,20.54,3.33,8.44,5.85,17.2,8.71,25.81C277,275,277.31,276.05,277.79,277.63Z"/>
                                </svg>
                            </span>

                            <span>
                                <svg id="Layer_1" width="20px" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 336.56 336.56">
                                    <defs>
                                        <style>.cls-1{stroke-miterlimit:10;stroke-width:6.08px;fill:url(#linear-gradient);stroke:url(#linear-gradient-2);}</style>
                                        <linearGradient id="linear-gradient" x1="26.7" y1="168.28" x2="309.86" y2="168.28" gradientUnits="userSpaceOnUse">
                                            <stop offset="0.08" stop-color="#f15648"/>
                                            <stop offset="0.36" stop-color="#eb107c"/>
                                            <stop offset="0.7" stop-color="#8a63aa"/>
                                            <stop offset="1" stop-color="#73c6ef"/>
                                        </linearGradient>
                                        <linearGradient id="linear-gradient-2" x1="23.66" y1="168.28" x2="312.9" y2="168.28" xlink:href="#linear-gradient"/>
                                    </defs>
                                    <path class="cls-1" d="M309.86,60.47c-1.66,3.26-3.18,6.61-5,9.77q-62.44,107-124.94,214c-2.45,4.2-5.59,7.34-10.59,8-8,1.09-14.61-3.82-15.9-11.84-1.4-8.72-2.66-17.48-4-26.21q-5.65-37-11.32-74c-1.36-8.92-2.69-17.84-4.18-26.74a6.37,6.37,0,0,0-2-3.62Q82.45,109.69,32.82,69.7c-9.24-7.41-7.23-19.31.76-23.57A19.27,19.27,0,0,1,41,44.27c3.76-.31,7.55-.09,11.33-.09H293.74c9,0,12.83,2.68,15.93,11.1,0,.08.13.14.19.2ZM137.93,144c4.33-2.48,8.47-4.88,12.64-7.23,2.71-1.52,5-1.13,6.29,1s.57,4.58-2.16,6.19c-3.57,2.11-7.14,4.23-10.8,6.16a2.7,2.7,0,0,0-1.58,3.32c.66,3.81,1.22,7.64,1.8,11.46q5.7,37.16,11.38,74.29c2,13.3,4.05,26.59,6.11,39.88.51,3.31,2.46,5.06,5.48,5.14s4.36-1.87,5.67-4.11Q236.29,171.22,299.84,62.41c.34-.58.61-1.21,1.18-2.37-1.43.76-2.32,1.2-3.17,1.69C256.39,85.52,231.15,99.19,189.69,123a22.82,22.82,0,0,1-3.18,1.65,4.06,4.06,0,0,1-4.2-6.71,10.67,10.67,0,0,1,2.27-1.54c41-23.53,65.74-36.91,106.71-60.43,1.63-.93,3.22-1.92,4.83-2.88l-.17-.59H43.24c-1.19,0-2.58-.3-3.54.2a10.2,10.2,0,0,0-4.24,3.37c-1.47,2.52-.41,4.67,2.75,7.23l86.42,69.93Q131.28,138.61,137.93,144Z"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <?php } }?>
            </div>
        </div>
    </div>
</div>
<?php echo $layout['footer'];?>
<?php echo $layout['js'];?>