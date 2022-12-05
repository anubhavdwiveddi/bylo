<!DOCTYPE html>
<html lang="en" class="bg-gray-100">
<head>
    <?php echo $layout['meta']; ?>
</head>

<div id="wrapper" class="flex flex-col justify-between h-screen">
    <div class="bg-white py-4 shadow dark:bg-gray-800">
        <div class="max-w-6xl mx-auto">
            <div class="flex items-center lg:justify-between justify-around">
                <a href="trending.html">
                    <img src="<?php echo base_url();?>assets/images/logo.png" alt="" class="w-32">
                </a>
                <div class="capitalize flex font-semibold hidden lg:block my-2 space-x-3 text-center text-sm">
                    <a href="<?php echo base_url();?>" class="py-3 px-4">Login</a>
                    <a href="<?php echo base_url('register')?>"
                       class="bg-purple-500 purple-500 px-6 py-3 rounded-md shadow text-white">Register</a>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="lg:p-12 max-w-xl lg:my-0 my-12 mx-auto p-6 space-y-">
            <form class="lg:p-10 p-6 space-y-3 relative bg-white shadow-xl rounded-md">
                <h1 class="lg:text-2xl text-xl font-semibold mb-6"> Login </h1>
                <div>
                    <label class="mb-0"> Email Address </label>
                    <input type="email" placeholder="Info@example.com" class="bg-gray-100 h-12 mt-2 px-3 rounded-md w-full">
                </div>
                <div>
                    <label class="mb-0"> Password </label>
                    <input type="password" placeholder="******" class="bg-gray-100 h-12 mt-2 px-3 rounded-md w-full">
                </div>

                <div>
                    <button type="button"
                            class="bg-blue-600 font-semibold p-2 mt-5 rounded-md text-center text-white w-full">
                        Get Started
                    </button>
                </div>
            </form>

        </div>
    </div>
    <div class="lg:mb-5 py-3 uk-link-reset">
        <div class="flex flex-col items-center justify-between lg:flex-row max-w-6xl mx-auto lg:space-y-0 space-y-3">
            <div class="flex space-x-2 text-gray-700 uppercase">
                <a href="#"> About</a>
                <a href="#"> Help</a>
                <a href="#"> Terms</a>
                <a href="#"> Privacy</a>
            </div>
            <p class="capitalize"> © copyright 2020 by Socialite</p>
        </div>
    </div>
</div>
<?php $layout['js'];?>