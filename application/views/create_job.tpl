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

            <div class="">
                <div class=" md:mb-4 mb-3">
                    <div class="col-md-12">
                        <div class="form-group">
                            <a href="<?php echo base_url();?>#jobs" type="button" style="margin: 0px" class="job-btn">Back</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="text-2xl font-semibold">Create Job </h2>
                        </div>
                    </div>
                </div>
                <div class="job-step-container">
                    <form action="JobCntrl/insert_job" mathod="post" id="reg_form" name="create_job">
                        <div class="row">
                            <div class="col-md-6">
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
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Job Title *</label>
                                    <input class="form-control" type="text" name="job_title" placeholder="Job Title">
                                </div>
                            </div>
						    <div class="col-md-6">
                                <div class="form-group">
                                    <label>Company name for this job *</label>
                                    <input class="form-control" type="text" name="company_name" placeholder="Company name">
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
                                            <option value="2">Healthcare </option>
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
                                            <option value="1">Employees report to a specific location</option>
                                            <option value="2">Employees will not report to a specific location</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
							<div class="col-md-6">
                                <div class="form-group">
                                    <label>Education</label>
                                    <input class="form-control" type="text" name="education" placeholder="Education">
                                </div>
                            </div>
							<div class="col-md-6">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input class="form-control" type="text" name="address" placeholder="Address">
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
                                        <input type="text" class="select-role form-control" name="pin_code">
                                    </div>
                                </div>
                            </div>
							<div class="col-md-6">
								<label>How many hires? * </label>
								<div class="form-group no-job">
								   <div class="input-group">
									  <input type="button" value="-" name="number_hire" class="button-minus" data-field="quantity">
									  <input type="number" step="0" max="" value="1" name="quantity" class="quantity-field">
									  <input type="button" value="+" class="button-plus ct-btn" data-field="quantity">
									</div>
								</div>
                            </div>
                            <div class="col-md-6">
                                <label>What Contract type is it? Multiple select</label>
                                <select class="form-control select2" name="contract[]" autocomplete="none" multiple>
                                    <option value="1">Temporary</option>
                                    <option value="2">Contract</option>
                                    <option value="3">Internship</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>what is the schedule for this job</label>
                                    <div class="form-group">
                                        <select class="mul-select" Name="schedule_job[]" multiple="true">
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
                                    <label> Daily update about this job and candidates will be sent to: </label>
                                    <input class="form-control" type="email" name="sent_mail" placeholder="Enter Email">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label> Is there a planned start date for this job?</label>
                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                        <div class="radio">
                                            <input type="radio" id="chkYes" value="1" name="chkPinNo"/>
                                            <label for="chkYes"><span class="radio-label"></span> Yes</label>
                                        </div>
                                        <br>
                                        <div class="radio">
                                            <input type="radio" id="chkNo" value="0" name="chkPinNo"/>
                                            <label for="chkNo"><span class="radio-label"></span> No</label>
                                        </div>
                                        <hr>
                                        <div id="dvPinNo" style="display: none">
                                            Select Date
                                            <input type="date" class="form-control" name="star_date" id="txtPinNo"/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label> Is there an application deadline?</label>
                                    <div class="bg-white rounded-md shadow py-4 px-6 max-w-md">
                                        <div class="radio">
                                            <input type="radio" id="chkYes1" value="1" name="chkPinNo1"/>
                                            <label for="chkYes1"><span class="radio-label"></span> Yes</label>
                                        </div>
                                        <br>
                                        <div class="radio">
                                            <input type="radio" id="chkNo1" value="0" name="chkPinNo1"/>
                                            <label for="chkNo1"><span class="radio-label"></span> No</label>
                                        </div>
                                        <hr>
                                        <div id="dvPinNo1" style="display: none">
                                            Select Date
                                            <input type="date" class="form-control" id="txtPinNo1" name="end_date"/>
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
                                            <label for="radio-1"><span class="radio-label"></span> Yes </label>
                                        </div>

                                        <br>

                                        <div class="radio">
                                            <input id="radio-2" name="resume" value="0" type="radio">
                                            <label for="radio-2"><span class="radio-label"></span> No </label>
                                        </div>

                                        <br>

                                        <div class="radio">
                                            <input id="radio-3" name="resume" value="2" type="radio">
                                            <label for="radio-3"><span class="radio-label"></span> Optional </label>
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
                                    <textarea name="description" class="form-control" rows="5"> </textarea>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="button" class="job-btn" onclick="MyFunction('create_job')">Submit</button>
                                </div>
                            </div>

                        </div>
                    </form>
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
