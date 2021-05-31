<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Auth;

class Cart extends Model
{
  public $fillable = [
     'user_id',
     'product_id',
     'order_id',
     'product_quantity',
     'ip_address',

  ];

  public function user()
  {
    return $this->belongsTo(User::class);
  }

  public function order()
  {
    return $this->belongsTo(Order::class);
  }

  public function product()
  {
    return $this->belongsTo(Product::class);
  }

  public static function totalCarts()
  {
    if(Auth::check())
    {
      $carts = Cart::where('user_id', Auth::id())
                    // ->orWhere('ip_address', request()->ip())
                    ->where('order_id', NULL)
                    ->get();
    }
    else
    {
      $carts = Cart::where('ip_address', request()->ip())->where('order_id', NULL)->get();

    }
    return $carts;
  }

  public static function totalItems()
  {
    if(Auth::check())
    {
      $carts = Cart::where('user_id', Auth::id())
                    // ->orWhere('ip_address', request()->ip())
                    ->where('order_id', NULL)
                    ->get();
    }
    else
    {
      $carts = Cart::where('ip_address', request()->ip())->where('order_id', NULL)->get();

    }

    $total_items = 0;
    foreach($carts as $cart)
    {
      $total_items += $cart->product_quantity;
    }

    return $total_items;
  }

}
