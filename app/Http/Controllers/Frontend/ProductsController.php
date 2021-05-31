<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;

class ProductsController extends Controller
{
  public function index()
  {
    $products = Product::orderBy('id','desc')->paginate(9);
    $categories = Category::orderBy('name','asc')->get();
    return view('frontend.pages.product.index', compact('products','categories'));
  }

  public function show($slug)
  {
    $product = Product::where('slug', $slug)->first();
    if(!is_null($product))
    {
      return view('frontend.pages.product.show', compact('product'));
    }
    else{
      session()->flash('errors','Sorry!! there is no product by this URL :(');
      return redirect()->route('products');
    }
  }
}
