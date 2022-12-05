<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php
$data = set_config_data();
if(!empty($data)){ ?>
<link href='<?= $data->m00_value?>' rel="icon" type="image/png">
<?php }
?>
<title><?php echo $title?></title>
<meta name="description" content="<?php if(!empty($description)){echo "$description";}?>">
<link rel="stylesheet" href="<?php echo base_url();?>/assets/css/icons.css">
<link rel="stylesheet" href="<?php echo base_url();?>/assets/css/uikit.css">
<link rel="stylesheet" href="<?php echo base_url();?>/assets/css/style.css">
<link rel="stylesheet" href="<?php echo base_url();?>/assets/css/tailwind.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>/assets/css/user-dashboard.css">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569006288/BBBootstrap/choices.min.css?version=7.0.0">
<script src="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569006273/BBBootstrap/choices.min.js?version=7.0.0"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/pdf.js/1.7.365/pdf.min.js'></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

<link rel='stylesheet' href='https://foliotek.github.io/Croppie/croppie.css'>
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://admin.byloapp.in//assets/css/summernote/summernote-bs4.css">
<script src="https://www.gstatic.com/firebasejs/7.18.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.18.0/firebase-messaging.js"></script>
<style>
    .msg{
        display: none;
        font-size: 13px;
    }
</style>