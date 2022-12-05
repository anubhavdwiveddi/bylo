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

            <div class="lg:flex lg:space-x-12">

                <div class="lg:w-3/4 card">

                    <div class="h-44 md:h-60 overflow-hidden relative rounded-t-lg w-full">
                        <img src="<?php echo base_url()?>assets/images/blog/img-5.jpg" alt="" class="w-full h-full absolute inset-0 object-cover">
                    </div>

                    <div class="p-10 pt-4 divide-y divide-gray-100">

                        <div class="md:py-8 py-3">
                            <h2 class="text-2xl font-bold"><?= $job_details->job_title?></h2>
                            <p class="font-medium mt-1.5 text-base"> <?= $job_details->company_name?> </p>
                        </div>

                        <div class="md:py-8 py-3">
                            <h1 class="block text-xl font-bold mb-9"> Job details  </h1>
                            <div class="md:flex">
                                <div class="md:w-2/3 space-y-4 -mt-2">
                                 
                                    <div class="flex items-center space-x-3">
                                        <ion-icon  class="bg-gray-100 p-1.5 rounded-full icon-feather-calendar"></ion-icon>
                                        <div class="flex-1">
                                            <div> Posted 21 hours ago </div>
                                        </div>
                                    </div>
									<div class="flex items-center space-x-3">
									   <ion-icon class="bg-gray-100 p-1.5 rounded-full text-xl icon-feather-phone md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
										   <div>  <a href="#" class="text-blue-500"> 9617145789 </a> </div>
									   </div>
								   </div>
								      <div class="flex items-center space-x-3">
                                        <ion-icon   class="bg-gray-100 p-1.5 rounded-full icon-feather-briefcase"></ion-icon>
                                        <div class="flex-1">
										     <p class="font-semibold mb-0"> Contract type </p>
                                            <div><?= $job_details->contract_type?></div>
                                        </div>
                                    </div>
									 <div class="flex items-center space-x-3">
									   <ion-icon   class="bg-gray-100 p-1.5 rounded-full md icon-feather-book hydrated" role="img" aria-label="albums"></ion-icon>
									   <div class="flex-1">
									      <p class="font-semibold mb-0">Education </p>
										   <div>   Graduate </div>
									   </div>
								   </div>
								  
                                    <div class="flex items-center space-x-3">
									   <ion-icon  class="bg-gray-100 p-1.5 rounded-full icon-feather-map-pin md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
										   <div class="pr-6">  501, Scheme No 55, NRK Bizpark, Scheme 54 PU4, Indore, Madhya Pradesh 452010  </div>
									   </div>
								   </div>
								     <div class="flex items-center space-x-3">
									   <ion-icon "="" class="bg-gray-100 p-1.5 rounded-full icon-feather-calendar md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
									     <p class="font-semibold mb-0">Schedule </p>
										   <div>   Morning shift   </div>
									   </div>
								   </div>
								     <div class="flex items-center space-x-3">
									   <ion-icon "="" class="bg-gray-100 p-1.5 rounded-full  icon-feather-map-pin md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
									     <p class="font-semibold mb-0"> Job Location </p>
										   <div>   Indore   </div>
									   </div>
								   </div>
								    <div class="flex items-center space-x-3">
									   <ion-icon "="" class="bg-gray-100 p-1.5 rounded-full  icon-material-outline-arrow-forward md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
									     <p class="font-semibold mb-0"> Hiring process </p>
										   <div>   Lorem   </div>
									   </div>
								   </div>
								   <div class="flex items-center space-x-3">
									   <ion-icon "="" class="bg-gray-100 p-1.5 rounded-full  icon-feather-users md hydrated" role="img"></ion-icon>
									   <div class="flex-1">
									     <p class="font-semibold mb-0"> Vacancy </p>
										   <div>   3 Member   </div>
									   </div>
								   </div>

                                </div>

                                <div class="flex-1 space-y-4 md:mt-0 mt-6 text-md ft-size"> 
								        <div>
										   <div class="font-semibold "> Category  job </div>
										   <div class=" "> Healthcare </div>
									   </div> 
									   <div>
										   <div class="font-semibold "> Salary & Benefits</div>
										   <div class=" "> Life insurance, Paid sick time </div>
									   </div> 
									   <div>
										   <div class="font-semibold "> Benefits offered</div>
										   <div class=" "> Food Allowance </div>
									   </div> 
									   <div>
										   <div class="font-semibold "> Supplemental Pay</div>
										   <div class=" "> Performance bonus  </div>
									   </div>
									    <div>
										   <div class="font-semibold "> COVID-19 Considerations </div>
										   <div class=" "> Complete Vaccination certificate required  </div>
									   </div>
									    <div>
										   <div class="font-semibold ">Start Date </div>
										   <div class=" "> 1/2/2022  </div>
									   </div>
									   <div>
										   <div class="font-semibold "> End date</div>
										   <div class=" "> 15/2/2022  </div>
									   </div>
                                    <!--<div>
                                        <div  class="font-semibold mb-2"> Maximum </div>
                                        <div class="text-gray-400"> <span class="text-2xl font-semibold text-black"> $700 </span>  Per Month</div>
                                    </div>-->
                                    <a href="#" class="bg-blue-600 text-white py-2.5 text-center font-semibold w-full mt-4 block rounded"> Apply now </a>
                                </div>
                            </div>
                        </div>

                        <div class="md:py-8 py-3">
                            <h1 class="block text-2xl font-bold mb-6"> Job Description  </h1>
                            <div class="space-y-3">
                                <?= $job_details->description?>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="lg:w-1/4 w-full flex-shrink-0 card P-5">

                    <div uk-sticky="media @m ; offset:80 ; bottom : true">

                        <h2 class="text-xl font-semibold mb-2">Posted by </h2>
                        <div class="flex items-center space-x-4 rounded-md -mx-2 p-2 hover:bg-gray-50">
                            <a href="timeline-group.html" class="w-12 h-12 flex-shrink-0 overflow-hidden rounded-full relative">
                                <img src="<?php echo base_url()?>assets/images/group/group-3.jpg" class="absolute w-full h-full inset-0 " alt="">
                            </a>
                            <div class="flex-1">
                                <a href="timeline-page.html" class="text-base font-semibold capitalize"> <?= $job_details->company_name?></a>
                                <div class="text-sm text-gray-500 mt-0.5"> Clothing</div>
                            </div>
                        </div>
                        <ul class="text-gray-600 space-y-3 mt-3">
                            <li class="flex items-center space-x-2">
                                <ion-icon   class="rounded-full bg-gray-200 p-1 mr-3 md hydrated icon-material-outline-thumb-up" role="img" ></ion-icon>
                                <strong> 1,723 people like this  </strong>
                            </li>
                            <li class="flex items-center space-x-2">
                                <ion-icon name="globe" class="rounded-full bg-gray-200 text-xl p-1 mr-3 md hydrated" role="img" aria-label="globe"></ion-icon>
                                <a href="https://byloapp.in/page/Indore/Shoppin_car" class="text-blue-500">Page Url</a>
                            </li>

                        </ul>
                    </div>

                    </div><div class="uk-sticky-placeholder" style="height: 556px; margin: 0px;"></div>
                </div>

            </div>



        </div>
    </div>
</div>
<!-- open chat box -->
<?php echo $layout['message']?>
</div>

</div>
</div>
</div>
<?php echo $layout['footer']?>
<?php echo $layout['js']?>

</body>
</html>
