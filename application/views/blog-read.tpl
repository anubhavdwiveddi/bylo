<?php echo $layout['meta'];?>
<div id="wrapper">
    <?php echo $layout['header'];?>
    <!-- sidebar -->
    <?php echo $layout['sidebar'];?>

    <!-- Main Contents -->
    <div class="main_content">
        <div class="mcontainer">

            <div class="lg:flex lg:space-x-10">

                <div class="lg:w-3/4 space-y-5">

                    <div class="card">

                        <div class="h-44 mb-4 md:h-72 overflow-hidden relative rounded-t-lg w-full">
                            <?php if(!empty($blog_details->folder_name)){ ?>
                            <img src="<?php echo base_url('/').$blog_details->folder_name?><?= $blog_details->blog_image?>" alt=""
                                 class="w-full h-full absolute inset-0 object-cover">
                            <?php } else { ?>
                            <img src="<?php echo base_url('upload')?><?= $blog_details->blog_image?>" alt=""
                                 class="w-full h-full absolute inset-0 object-cover">
                            <?php } ?>
                        </div>
                        <div class="p-7">

                            <h1 class="lg:text-3xl text-2xl mb-6"><?= $blog_details->blog_title?></h1>

                            <div class="flex items-center space-x-3 my-4 pb-4 border-b border-gray-100">

                                <img src="<?php echo base_url();?>assets/images/avatars/avatar-2.jpg" alt=""
                                     class="w-10 rounded-full">
                                <div>
                                    <div class="text-base font-semibold"><?php if(empty($blog_details->user_name)){
                                        print_r($blog_details->user_code);
                                        } else {
                                        print_r($blog_details->user_name);
                                        } ?>
                                    </div>
                                    <div class="text-xs"> Published
                                        on <?php echo $newdate = date("d F Y", strtotime($blog_details->datetime));?>
                                    </div>
                                </div>
                            </div>

                            <div class="space-y-3">
                                <p>
                                    <?= $blog_details->blog_description;?>
                                </p>
                            </div>

                        </div>

                    </div>

                    <!-- related articles -->


                    <div class="card p-6">

                        <h1 class="block text-lg font-semibold mb-4"> Comments (<?php echo $count_blog->no_of_user?>) </h1>

                        <div class="space-y-5">

                            <div class="flex gap-x-4 relative rounded-md">
                                <div id="output">
                                </div>
                        </div>

                        <div class="blog-comment-form mt-5" id="reply_comment">
                            <form method="post" id="reg_form" action="BlogCntrl/insert_comment">
                                <div class="flex space-x-4 mb-5 relative">
                                    <div class="flex-1">
                                        <div class="grid md:grid-cols-2 gap-4">
                                            <div id="reply_blog_btn" class="col-span-2">
                                                <textarea name="comment" id="comment" cols="30" rows="6"
                                                          class="bg-gradient-to-b from-gray-100 to-gray-100"></textarea>
                                            </div>

                                            <div class="col-span-2" style="display: none;">
                                                <input type="hidden" class="bg-gradient-to-b from-gray-100 to-gray-100" value="<?php echo $blog_details->id?>" id="blog_id">
                                            </div>
                                            <input type="text" hidden value="">
                                            <div class="col-span-2 flex justify-between py-4">
                                                <button class="button" type="button"
                                                       onclick="post_comment('<?php echo $blog_details->id?>')"
                                                        name="comment">Post Comment</button>
                                            </div>
											
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                    </div>


                </div>
                <div class="lg:w-1/4 w-full">

                    <div uk-sticky="offset:100" class="uk-sticky">

                        <h2 class="text-lg font-semibold mb-3"> Recently Posted </h2>
                        <ul>
                            <?php
                                if(!empty($recent_blog)){
                                    foreach($recent_blog as $recent){ ?>
                            <li>
                                <a href="#" class="hover:bg-gray-100 rounded-md p-2 -mx-2 block">
                                    <span class="font-medium line-clamp-2"><?php echo $recent->blog_title?></span>
                                    <div class="flex items-center my-auto text-xs space-x-1.5">
                                        <div><?php echo $newdate = date("d F Y", strtotime($recent->datetime));?></div>
                                        <div class="pb-1"></div>
                                        <!-- <ion-icon name="chatbox-ellipses-outline"></ion-icon>
                                         <div> </div>-->
                                    </div>
                                </a>
                            </li>
                            <?php } } ?>

                        </ul>
                        <br>

                        <h4 class="text-lg font-semibold mb-3"> Tags </h4>

                        <div class="flex flex-wrap gap-2">
                            <?php if(!empty($blog_tag)){
                                foreach($blog_tag as $tag) {
                            ?>
                            <span class="bg-gray-100 py-1.5 px-4 rounded-full"> <?php echo $tag->tag_name?></span>
                            <?php } } ?>
                        </div>

                    </div>


                </div>

            </div>


        </div>
    </div>

</div>


<!-- open chat box -->
 

<?php echo $layout['footer'];?>
<?php echo $layout['js'];?>

<script>
    function post_comment(value) {
        var formData = new FormData($('#reg_form')[0]);
        var action = $('#reg_form').attr('action');
        formData.append('blog_id', value);
        $.ajax({
            type: 'POST',
            url: baseUrl + '/' + action,
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            cache: false,
            async: false,
            success: function (response) {
                if (response['status'] == 200) {
                    document.getElementById('success_msg_subject').innerHTML = response['message'];
                    $('#success_msg').delay(3000).hide('slow');
                    $('#success_msg').css('display', 'block');
                    blogComment();
                } else {
                    document.getElementById('error_msg_subject').innerHTML = response['message'];
                    $('#error_msg').delay(3000).hide('slow');
                    $('#error_msg').css('display', 'block');
                }
            }
        });
    }
    $(document).ready(function(){
        blogComment();
    });
    function blogComment() {
        var blog_id = $("#blog_id").val();
        $.post("<?php echo base_url('BlogCntrl/replay_comment/');?>"+blog_id+"",
            function (result) {
                var data = JSON.parse(result);
                var comments = "";
                var replies = "";
                var item = "";
                var parent = -1;
                var results = new Array();
                var list = $("<div class='space-y-5'>");
                var item = $("<div class='flex gap-x-4 relative rounded-md hello top-p'>").html(comments);
                for (var i = 0; (i < data.length); i++) {

                    var commentId = data[i]['id'];
                    parent = data[i]['parent_id'];
                    if (parent == "0") {
                        comments = "<div class='flex gap-x-4 relative rounded-md'> <a href='#reply_comment' onClick='postReply(" + commentId + ")' class='bg-gray-100 py-1.5 px-4 rounded-full absolute right-5 top-0' value=''>Replay" +
                            "</a>" +
                            "<img src='<?php echo base_url('upload/')?>" + data[i]['profile_image'] + " ' alt='' class='rounded-full shadow w-12 h-12'>" +
                            "<div>" +
                            "<h4 class='text-base m-0 font-semibold'>" + data[i]['first_name'] + "  " + data[i]['last_name'] + " </h4>" +
                            "<span class='text-gray-700 text-sm'>" + data[i]['datetime'] + "</span>" +
                            "<p class='mt-3 md:ml-0 -ml-16'>" + data[i]['comment_msg'] + "</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        var item = $("<div class='  parent'>").html(comments);
                        list.append(item);
                        var reply_list = $("<div class=' child'>");
                        item.append(reply_list);
                        CommentReplies(commentId, data, reply_list);
                    } else {
                        comments = " <a href='#reply_comment' onClick='postReply(' + commentId + ')' class='bg-gray-100 py-1.5 px-4 rounded-full absolute right-5 top-0'>Replay</a>" +
                            "<img src='<?php echo base_url('upload/')?>" + data[i]['profile_image'] + " ' alt='' class='rounded-full shadow w-12 h-12'>" +
                            "<div>" +
                            "<h4 class='text-base m-0 font-semibold'>" + data[i]['first_name'] + "  " + data[i]['last_name'] + "</h4>" +
                            "<span class='text-gray-700 text-sm'>" + data[i]['datetime'] + "</span>" +
                            "<p class='mt-3 md:ml-0 -ml-16'>" + data[i]["comment_msg"] + "</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                        // var item = $("<li class='mt-4'>").html(comments);
                        // list.append(item);
                        // var reply_list = $('<ul class="media-list list-unstyled mb-0">');
                        // item.append(reply_list);
                        //blogComment(commentId, data, reply_list);
                    }
                }
                $("#output").html(list);
            });
    }

    function CommentReplies(commentId, data, list) {
       //console.log(data);
        for (var i = 0; i<data.length; i++) {
            if (commentId == data[i].parent_id) {
                var comments ="<div class='flex gap-x-4 relative rounded-md lg:ml-10'> <a href='#reply_comment' onClick='postReply(" + commentId + ")' class='bg-gray-100 py-1.5 px-4 rounded-full absolute right-5 top-0'>Replay</a>" +
                    "<img src='<?php echo base_url('upload/')?>" + data[i]['profile_image'] + " ' alt='' class='rounded-full shadow w-12 h-12'>" +
                    "<div class='mid-ct'>" +
                    "<h4 class='text-base m-0 font-semibold'>" + data[i]['first_name'] + "  " + data[i]['last_name'] + "</h4>" +
                    "<span class='text-gray-700 text-sm'>" + data[i]['datetime'] + " </span>" +
                    "<p class='mt-3 md:ml-0 -ml-16'>" + data[i]["comment_msg"] + "</p>" +
                    "</div>" +
                    "</div>" +
                    "</div>";
                var item = $("<div class='child-2'>").html(comments);
                var reply_list = $("<div class='sub-ct lg:ml-6'>");
                list.append(item);	
                item.append(reply_list);
                CommentReplies(data[i].id, data, reply_list);
            }
        }
    }

</script>
</body>
</html>