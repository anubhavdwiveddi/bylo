<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
    input[type="file"] {
        display: block;
    }

    .imageThumb {
        /*max-height: 75px;*/
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
    }

    .pip {
        display: inline-block;
        margin: 24px 10px 0 0;
    }

    /*.remove {*/
    /*    display: block;*/
    /*    background: #444;*/
    /*    border: 1px solid black;*/
    /*    color: white;*/
    /*    text-align: center;*/
    /*    cursor: pointer;*/
    /*}*/
    .remove {
    position: absolute;
    opacity: 19.1;
    background: #9257a3;
    display: block;
    float: right;
    /* background: rgb(0 0 0 / 0%); */
    border: 1px solid #111827;
    border-radius: 50px;
    color: white;
    text-align: center;
    cursor: pointer;
    padding: 8px 10px 10px 10px;
    align-items: inherit;
    margin: 0px 0px -40px 0px;
    z-index: 999;
        right: 30px;
    }
    #image_preview .pip span{
        float: right;
    }
    #image_preview .pip span i ::before{
     color: black;
    }
    .remove:hover {
        background: white;
        color: black;
    }

    #image_preview div textarea div{
        position: fixed;
        right: -100px;
        top: 179px;
        display: block;
        width: 400px;
        z-index: 999;
        overflow: hidden;
        background: rgb(255, 255, 255);
        border-radius: 5px;
        box-shadow: rgb(0 0 0 / 16%) 0px 3px 6px, rgb(0 0 0 / 23%) 0px 3px 6px;
        margin-top: 5px;
        outline: none;
    }
    img.max-h-96.w-full.object-cover {
        max-width: 100%;
        max-height: 100%;
    }
</style>
<?php $data = login_user_data(); ?>
<?php if(!empty($this->session->userdata('id'))){ ?>
<div class="card lg:mx-0 p-4" uk-toggle="target: #create-post-modal">
        <div class="flex space-x-3">
		<?php if($this->session->userdata('id') !='') {
                if(!empty($data->profile_image)) { ?>
                <img src="<?= base_url('upload').$data->profile_image?>"
                     class="w-10 h-10 rounded-full">
                <?php } else { ?>
                <img src="<?= base_url('').$data->avatar_image?>"
                     class="w-10 h-10 rounded-full">
                <?php } } ?>
                <input placeholder="Share your thoughts or tag someone you know"
                       class="bg-gray-100 hover:bg-gray-200 flex-1 h-10 px-6 rounded-full">
        </div>
        <div class="grid grid-flow-col pt-3 -mx-1 -mb-1 font-semibold text-sm">
                <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                        <svg class="bg-blue-100 h-9 mr-2 p-1.5 rounded-full text-blue-600 w-9 -my-0.5 hidden lg:block"
                             data-tippy-placement="top" title="Tooltip" fill="none" stroke="currentColor"
                             viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                      <span class="font-m">  Photo/Video </span>
                </div>
                <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                        <svg class="bg-green-100 h-9 mr-2 p-1.5 rounded-full text-green-600 w-9 -my-0.5 hidden lg:block"
                             uk-tooltip="title: Messages ; pos: bottom ;offset:7" fill="none"
                             stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"
                             title="" aria-expanded="false">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                         <span class="font-m"> Tag Connection </span>
                </div>
                <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                        <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block"
                             fill="none" stroke="currentColor" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                       <span class="font-m">  Feeling /Activity </span>
                </div>
        </div>
</div>
<?php } ?>


<!-- Craete post modal -->
<div id="create-post-modal" class="create-post is-story" uk-modal>
        <form method="POST" id="post_form" action="StoryCntrl/insert_post" enctype="multipart/form-data">
                <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical post_model rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">

                        <div class="text-center py-3 border-b">
                                <h3 class="text-lg font-semibold"> Create Post </h3>
                                <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close
                                        uk-tooltip="title: Close ; pos: bottom ;offset:7"></button>
                        </div>
                        <div class="flex flex-1 items-start space-x-4 p-5 user-m-img">

						<?php if(!empty($data->profile_image)){ ?>
                                <img src="<?php echo base_url('upload');?><?= $data->profile_image?>"
                                     class="bg-gray-200 border border-white rounded-full w-11 h-11">
									 <?php } else if(!empty($data->avatar_image)){ ?>
									 <img src="<?php echo base_url();?><?= $data->avatar_image?>"
                     class="w-10 h-10 rounded-full">
					 <?php } ?>

                                <div class="user-nm">
                    <span> <?php echo $this->session->userdata('first_name');?> <?php echo $this->
                            session->userdata('last_name');?></span> <span id="text"></span><br/>
                                        <span id="page_name"> </span>
                                </div>
                        </div>
                        <div class="pst-form-content">
                                <div class="flex-1 create-post-po pt-2 pd-lr mb-0 post-fd" id="image_preview">
					  <textarea style="overflow:hidden;" data-meteor-emoji="true" id="mytextarea" placeholder="Share your thoughts or tag someone you know"
                                                              name="post_content"
                                                              class="uk-textare text-black shadow-none focus:shadow-none text-xl font-medium resize-none "
                                                              rows="5"
                                                              placeholder="Share your thoughts or tag someone you know"></textarea>
                                </div>
                                <div class="all-post-content">
                                        <div class="post-image-row">
                                                <input type="button" id="imgPreview" value="x" class="btn-post-remove" style="display:none;">
                                        </div>
                                        <!--- video file upload --->
                                        <video style="display:none;" id="video" width="300" height="300" controls></video>
                                        <!--- doc file upload --->
                                        <div class="upload">
                                                <div class="upload__files">
                                                </div>
                                        </div>
                                        <!-- new file upload----->
                                        <!--  <div class="file-loading">
                                           <input id="input-ficons-5" name="input-ficons-5[]" multiple type="file">
                                            </div>  -->
                                </div>
                        </div>


                        <div class="bsolute bottom-0 p-4 space-x-4 w-full">
                                <div class="flex bg-gray-50 border border-purple-100 rounded-2xl p-2 shadow-sm items-center">
                                        <div class="lg:block hidden ml-1"> Add to your post</div>
                                        <div class="flex flex-1 items-center lg:justify-end justify-center space-x-2">
                                                <div class="profile-update pt-2">
                                                        <div class="avatar-upload">
                                                                <div class="avatar-edit pr-update">
                                                                        <input type='file' id="files" class="add_post "
                                                                               name="postimg" multiple
                                                                               accept=".png, .jpg, .jpeg, video/*"/>
                                                                        <label for="files">
                                                                                <svg class="bg-blue-100 h-9 p-1.5 rounded-full text-blue-600 w-9 cursor-pointer"
                                                                                     fill="none"
                                                                                     stroke="currentColor" viewBox="0 0 24 24"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                                              d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                                                                </svg>
                                                                        </label>
                                                                </div>

                                                        </div>
                                                </div>

                                                <button class="" type="button" uk-toggle="target: #tag-modal">
                                                        <svg class="text-green-600 h-9 p-1.5 rounded-full bg-green-100 w-9 cursor-pointer"
                                                             fill="none"
                                                             stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                      d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                                                        </svg>
                                                </button>

                                                <!-- <div class="hover:bg-gray-100 flex items-center p-1.5 rounded-md cursor-pointer">
                                                        <svg class="bg-red-100 h-9 mr-2 p-1.5 rounded-full text-red-600 w-9 -my-0.5 hidden lg:block"
                                                             fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                                  d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                        </svg>
                                                    </div>-->

                                        </div>
                                </div>
                        </div>
                        <div class="flex items-center w-full justify-between border-t p-3">

                                <select name="publish_story" class="select-btn mt-2 story send-type">
                                        <option value="1">Only me</option>
                                        <option value="2">Every one</option>
                                        <option value="3">People I Follow</option>
                                        <option value="4">People Follow Me</option>
                                </select>

                                <div class="flex space-x-2">
                                        <button type="button" onclick="Myfunction('create_post')"
                                                class="bg-blue-600 flex h-9 items-center justify-center rounded-md text-white px-5 font-medium">
                                                Share
                                        </button>
                                </div>
                        </div>
                        <span id="text_edit"></span>
        </form>
</div>
</div>
<div id="tag-modal" class="create-post tag_search is-story" uk-modal>
        <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical rounded-lg p-0 lg:w-5/12 relative shadow-2xl uk-animation-slide-bottom-small">

                <div class="text-center py-3 border-b">
                        <h3 class="text-lg font-semibold"> Tag Friends </h3>
                        <button class="uk-modal-close-default bg-gray-100 rounded-full p-2.5 right-2" type="button" uk-close
                                uk-tooltip="title: Close ; pos: bottom ;offset:7" uk-toggle="target: #create-post-modal"></button>
                </div>
                <div class="flex flex-1 items-start space-x-4 p-5 tag-model-content">
                        <img src="<?php echo base_url();?>/assets/images/avatars/avatar-2.jpg"
                             class="bg-gray-200 border border-white rounded-full w-11 h-11">
                        <div class="flex-1">
                                <form>

                                        <div class="header_search"><i class="uil-search-alt"></i>

                                                <form class="tag-form">
                                                        <select id='myselect' class="form-control select2" multiple>
                                                                <option value="1">Aayush,</option>
                                                                <option value="2">Kishan,</option>
                                                                <option value="3">Anil</option>
                                                        </select>
                                                </form>


                                        </div>

                        </div>

                </div>


                <div class=" items-center w-full justify-between border-t p-3 tag-footer">
                        <button class="bg-blue-600  h-9 items-center justify-center rounded-md text-white px-5 font-medium"
                                type="button" uk-toggle="target: #create-post-modal"> Tag
                        </button>
                </div>
                </form>
        </div>
</div>
<script>
          $(document).ready(function () {
                    if (window.File && window.FileList && window.FileReader) {
                              $("#files").on("change", function (e) {
                                        var files = e.target.files,
                                                filesLength = files.length;
                                        for (var i = 0; i < filesLength; i++) {
                                                  var f = files[i]
                                                  console.log(f);
                                                  var fileReader = new FileReader();
                                                  fileReader.onload = (function (e) {
                                                            var file = e.target;
                                                            $("#image_preview").append("<span class=\"pip\">" +
                                                                    "<span class=\"remove\"><i class=\"fa fa-times\" aria-hidden=\"true\"></i></span>" +
                                                                    "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
                                                                    "</span>");
                                                            $(".remove").click(function () {
                                                                      $(this).parent(".pip").remove();
                                                            });

                                                            // Old code here
                                                            /*$("<img></img>", {
                                                              class: "imageThumb",
                                                              src: e.target.result,
                                                              title: file.name + " | Click to remove"
                                                            }).insertAfter("#files").click(function(){$(this).remove();});*/

                                                  });
                                                  fileReader.readAsDataURL(f);
                                        }
                              });
                    } else {
                              alert("Your browser doesn't support to File API")
                    }
          });
</script>