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
                                <h2 class="text-2xl font-semibold"> Dashboard </h2>
                            </div>
                        </div>
                    </div>

                

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

<!-- open chat box -->
<?php echo $layout['message']?>
</div>

<?php echo $layout['footer']?>
<?php echo $layout['js']?>
</body>
</html>
