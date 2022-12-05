<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/userguide3/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
//$route['default_controller'] = 'welcome';
$route['default_controller'] = 'WebCntrl/feed';
$route['feed']      = 'WebCntrl/feed';
$route['forget-password']  = 'WebCntrl/forget_password';
$route['login'] = 'WebCntrl/index';
$route['discover']     = 'WebCntrl/page';
$route['media']    = 'WebCntrl/Media';
$route['replay_comment/(:num)'] = 'BlogCntrl/replay_comment/$1';
$route['replay_post_comments/(:num)'] = 'FeedCntrlCntrl/replay_post_comments/$1';
$route['verify'] = 'WebCntrl/verify';
$route['send_notification'] = 'WebCntrl/send_notification';
$route['Myappli'] = 'WebCntrl/Myappli';
$route['check_session'] = 'WebCntrl/check_session';
$route['logout'] = 'WebCntrl/logout';
$route['setting']   = 'SettingCntrl/setting';
$route['fetch']   = 'ScrollCntrl/fetch';
$route['video']            = 'WebCntrl/video';
$route['(:any)/posts/(:num)']      = 'FeedCntrl/posts/$1/$2';
$route['blog']     = 'BlogCntrl/blog';
$route['blog/(:any)/(:any)']     = 'BlogCntrl/blog/$1/$2';
//$route['(:any)/(:any)']     = 'BlogCntrl/blog/$1/$2';
$route['saved']  = 'UserCntrl/saved_user_post';
$route['saved/list_id/(:num)']  = 'UserCntrl/saved_user_post/$1';
$route['jobs']      = 'JobCntrl/jobs';
$route['jobs/(:any)/(:any)/(:num)']      = 'JobCntrl/jobs/$1/$2/$3';
$route['page/(:any)/(:any)']     = 'WebCntrl/page/$1/$2/';
$route['my_pages']     = 'PageCntrl/my_pages';
$route['make_pages']     = 'PageCntrl/make_pages';
$route['pages/(:any)'] = 'PageCntrl/pages/$1';
$route['video/(:num)']            = 'VideoCntrl/video/$1';
$route['replay_video_comment/(:num)']            = 'VideoCntrl/replay_video_comment/$1';
$route['video_watch/(:any)']      = 'VideoCntrl/video_watch/$1';
$route['friends']  = 'UserCntrl/friends';
$route['user_dashboard']  = 'DashboardCntrl/user_dashboard';
$route['all_blog_listing']  = 'DashboardCntrl/all_blog_listing';
$route['add_blog']  = 'DashboardCntrl/add_blog';
$route['edit_blog']  = 'DashboardCntrl/edit_blog';
$route['all_job_listing']  = 'DashboardCntrl/all_job_listing';
$route['all_product_listing']  = 'DashboardCntrl/all_product_listing';
$route['add_product']  = 'DashboardCntrl/add_product';
$route['order_history']  = 'DashboardCntrl/order_history';
$route['product_list']  = 'DashboardCntrl/product_list';
$route['groups']    = 'WebCntrl/groups';
$route['events']    = 'WebCntrl/events';
$route['marketplace']  = 'UserEcomCntrl/marketplace';
$route['marketplace/(:any)/(:any)']  = 'UserEcomCntrl/marketplace/$1/$2';
$route['marketplace/item/(:any)/(:num)']  = 'UserEcomCntrl/marketplace/item/$1/$2';
$route['shopping_cart']  = 'WebCntrl/shopping_cart';
$route['replay_photo_comment/(:num)']            = 'UserMediaCntrl/replay_photo_comment/$1';
$route['create_job']  = 'JobCntrl/create_job';
$route['profile']   = 'UserCntrl/profile';
$route['(:any)/photos/(:num)']   = 'UserCntrl/photos/$1/$2';
$route['photo/(:any)/(:num)']   = 'UserCntrl/photo/$1/$2';
$route['photo/(:num)']   = 'UserCntrl/photo/$1/$2';
$route['single_video/(:num)']  = 'VideoCntrl/single_video/$1';
$route['timeline_group']  = 'WebCntrl/timeline_group';
$route['u/(:any)'] = 'UserCntrl/user/$1';
$route['update_user']   = 'SettingCntrl/update_user';
$route['check_mobile']   = 'SettingCntrl/check_mobile';
$route['register']  = 'WebCntrl/register';

$route['forget']  = 'WebCntrl/forget';

$route['permalink']  = 'WebCntrl/permalink';
$route['search_friends']  = 'UserCntrl/search_friends';
$route['under_maintenance']  = 'WebCntrl/under_maintenance';
$route['terms_of_use']  = 'SettingCntrl/terms_of_use';

//API Controller make
$route['api/login1']  = 'API/ApiUserCntrl/login1';
$route['api/saved_user_feed']  = 'API/ApiUserCntrl/saved_user_feed';
$route['api/saved_user_data']  = 'API/ApiUserCntrl/saved_user_data';
$route['api/registration']  = 'API/ApiUserCntrl/registration';
$route['api/login']  = 'API/ApiUserCntrl/login';
$route['api/sent_otp']  = 'API/ApiUserCntrl/sent_otp';
$route['api/verify_OTP']  = 'API/ApiUserCntrl/verify_OTP';
$route['api/user_registration']  = 'API/ApiUserCntrl/user_registration';
$route['api/Resent_OTP']  = 'API/ApiUserCntrl/Resent_OTP';
$route['api/view_user_profile']  = 'API/ApiUserCntrl/view_user_profile';
$route['api/update_user_profile']  = 'API/ApiUserCntrl/update_user_profile';
$route['api/insert_feed']  = 'API/ApiFeedCntrl/insert_feed';
$route['api/delete_feed']  = 'API/ApiFeedCntrl/delete_feed';
$route['api/like_unlike']  = 'API/ApiFeedCntrl/like_unlike';
$route['api/share_feed_internal']  = 'API/ApiFeedCntrl/share_feed_internal';
$route['api/share_feed_external']  = 'API/ApiFeedCntrl/share_feed_external';
$route['api/feed_comment']  = 'API/ApiFeedCntrl/feed_comment';
$route['api/comment_replay']  = 'API/ApiFeedCntrl/comment_replay';
$route['api/view_feed']  = 'API/ApiFeedCntrl/view_feed';
$route['api/add_story']  = 'API/ApiStoryCntrl/add_story';
$route['api/add_user_story_view']  = 'API/ApiStoryCntrl/add_user_story_view';
$route['api/story_view']  = 'API/ApiStoryCntrl/story_view';
$route['api/delete_story']  = 'API/ApiStoryCntrl/delete_story';
$route['api/insert_story_msg']  = 'API/ApiStoryCntrl/insert_story_msg';
$route['api/story_msg_comment']  = 'API/ApiStoryCntrl/story_msg_comment';
$route['api/page_category']  = 'API/ApiPageCntrl/page_category';
$route['api/make_page']  = 'API/ApiPageCntrl/make_page';
$route['api/update_user_page']  = 'API/ApiPageCntrl/update_user_page';
$route['api/user_page_follow']  = 'API/ApiPageCntrl/user_page_follow';
$route['api/user_page_unfollow']  = 'API/ApiPageCntrl/user_page_unfollow';
$route['api/user_page_list']  = 'API/ApiPageCntrl/user_page_list';
$route['api/story_user_view']  = 'API/ApiStoryCntrl/story_user_view';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
