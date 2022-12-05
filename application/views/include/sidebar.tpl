<style>
    li.active a {
        background: #9dceec !important;
    }
</style>
  <?php $data = login_user_data();
?>
<div class="sidebar">
    <div class="sidebar_inner" data-simplebar>
        <ul>
            <?php $uriMethod_name = $this->router->fetch_method();
            $data = menu_list();
                if(!empty($data)){
                foreach ($data as $menu){
                ?>
            <li class="py-1 <?php if($uriMethod_name==$menu->url_name){ echo "active"; }else{ echo "" ; } ?>">
            <a href="<?= $menu->url_address?>" style="background: #f9fafb">
                <img class="w-7" src="<?= base_url('upload').$menu->menu_image?>">
                <span class="text-gray-700 px-3"> <?= $menu->menu_name?> </span>
            </a>
            </li>
            <?php } } ?>
                
            <?php if(!empty($data)){ ?>
            <li id="more-veiw" hidden><a href="<?php echo base_url()?>saved">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                         class="text-pink-500">
                        <path fill-rule="evenodd"
                              d="M2 5a2 2 0 012-2h8a2 2 0 012 2v10a2 2 0 002 2H4a2 2 0 01-2-2V5zm3 1h6v4H5V6zm6 6H5v2h6v-2z"
                              clip-rule="evenodd"/>
                        <path d="M15 7h1a2 2 0 012 2v5.5a1.5 1.5 0 01-3 0V7z"/>
                    </svg>
                    <span> Saved</span> </a>
            </li>
            <?php } ?>
        </ul>
        <hr>
        <div class="your-shortcut">
            <h3 class="text-xl font-semibold"> Your shortcuts </h3>
            <div class="contact-list">
                <?php if(!empty($user_pages)){
                    foreach($user_pages as $page){
                ?>
                <a href="<?= base_url('pages')?>/<?= $page->user_name?>" aria-expanded="false" class="">
                    <div class="contact-avatar">
                        <img src="<?php echo base_url('upload')?><?= $page->business_Logo?>" alt="">
                    </div>
                    <div class="contact-username"><?= $page->page_name;?></div>
                </a>
                <?php } }?>
            </div>
        </div>
    </div>
    <!-- sidebar overly for mobile -->
    <div class="side_overly" uk-toggle="target: #wrapper ; cls: is-collapse is-active"></div>

</div>
