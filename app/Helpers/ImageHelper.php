<?php
// {{ App\Helpers\ImageHelper::getUserImage(Auth::user()->id) }}
// {{ App\Helpers\ImageHelper::getUserImage(Auth::user()->id) }} to get the image in blade file i will use it..
// namespace App\Helpers;
//
// use App\Models\User;
// use App\Helpers\GravatarHelper;
//
// class ImageHelper
// {
//     public static function getUserImage($id)
//     {
//       $user = User::find($id);
//       $avatar_url = "";
//
//       if(!is_null($user))
//       {
//           if($user->avatar == NULL)
//           {
//               //return him gravatar imagear
//               if(GravatarHelper::validate_gravatar($user->email))
//               {
//                 $avatar_url = GravatarHelper::gravatar_image($user->email, 100);
//               }
//               else
//               {
//                 //when there is no gravatar image
//                 $avatar_url = url('images/defaults/user.png');
//               }
//           }
//           else
//           {
//             //return that image
//             $avatar_url = url('images/users/' .$user->avatar);          }
//       }
//       else
//       {
//         //return redirect('/');
//       }
//       return $avatar_url;
//     }
//
// }
