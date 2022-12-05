<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment Succesfull </title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,600;1,300;1,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <style type="text/css">
        body {
            background-color: #efefef;
            font-family: 'Poppins', sans-serif;
        }
        .welcome {
            background-color: #ffffff;
            max-width: 665px;
            margin: auto;
        }

        .col-6 {
            width: 50%;
        }
        .col-12 {
            width: 100%;
        }
        .row {
            display: flex;
        }
        .col-4{
            width: 33.3%;
        }

        .add p {
            padding: 0;
            margin: 0;
        }

        i.fas.fa-check-circle {
            color: #2196f3;
            font-size: 76px;
        }

        .app-box {
            width: 75%;
            margin: auto;
            padding: 70px 0;
        }
        @media only screen and (max-width: 781px) {

            .row {
                display: block;
            }
        }
        @media only screen and (max-width: 767px) {
            .welcome {
                max-width: 96%;
            }

        }
        @media only screen and (max-width: 481px) {

            .app-box {
                width: 100%;
                margin: auto;
            }
        }
    </style>
</head>
<body>
<div class="main">
    <div class="top-header">
    </div>
    <section class="welcome">
        <div class="container">
            <div class="row1" style=" text-align: center;">
                <div class="col-12 col-xs-12" style="
                     text-align: center;">
                    <div class="app-box">
                        <div class="app-right-content" style=" padding: 20px 15px 20px 15px;">
                            <div style="margin-top: 20px;">
                                <div class="date-time">
                                    <img src="<?php echo base_url()?>assets/images/icons/Success.gif">
                                </div>
                                <h4 style="    margin: 5px 0;"> Thank you </h4>
                                <p style="    margin: 0px;font-size: 15px;"> You account verification are successfully completed. Thank you registration Byloapp.com
                                    PLease login your account <a href="<?php echo base_url()?>">byloapp.com</a>
                                </p>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>
</div>
</body>
</html>
