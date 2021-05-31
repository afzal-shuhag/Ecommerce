<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use Image;
use File;

if (version_compare(PHP_VERSION, '7.2.0', '>=')) {
// Ignores notices and reports all other kinds... and warnings
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
// error_reporting(E_ALL ^ E_WARNING); // Maybe this is enough
}

class BrandsController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');

    }

    public function index()
    {
      $brands = Brand::orderBy('id','desc')->get();
      return view('backend.pages.brands.index', compact('brands'));
    }

    public function create()
    {
      return view('backend.pages.brands.create');
    }

    public function store(Request $request)
    {
      $this->validate($request,
      [
        'name' => 'required',
        'image' => 'nullable|image',
      ],
      [
        'name.required' => 'Please insert a brand Name',
        'image.image' => 'The file must be an image',
      ]);

      $brand = new Brand();

      $brand->name = $request->name;
      $brand->description = $request->description;

      //Image Inserting
      if (count($request->image)>0)
      {
          $image = $request->file('image');
          $img = time() . '.'. $image->getClientOriginalExtension();
          $location = 'images/brands/' .$img;
          Image::make($image)->save($location);
          $brand->image = $img;
      }
      $brand->save();

      session()->flash('success', 'A new brand has been added successfully :)');
      return redirect()->route('admin.brands');
    }

    public function edit($id)
    {
      $brand = Brand::find($id);
      if(!is_null($brand))
      {
        return view('backend.pages.brands.edit', compact('brand'));
      }
      else
      {
        return redirect()->route('admin.brands');
      }
    }

    public function update(Request $request, $id)
    {
      $this->validate($request,
      [
        'name' => 'required',
        'image' => 'nullable|image',
      ],
      [
        'name.required' => 'Please insert a brand Name',
        'image.image' => 'The file must be an image',
      ]);

      $brand = Brand::find($id);

      $brand->name = $request->name;
      $brand->description = $request->description;

      //Image Inserting
      if (count($request->image)>0)
      {
        //Delete The old image from file
          if(File::exists('images/brands/' .$brand->image))
          {
            File::delete('images/brands/' .$brand->image);
          }

          $image = $request->file('image');
          $img = time() . '.'. $image->getClientOriginalExtension();
          $location = 'images/brands/' .$img;
          Image::make($image)->save($location);
          $brand->image = $img;
      }
      $brand->save();

      session()->flash('success', 'A new brand has been updated successfully :)');
      return redirect()->route('admin.brands');
    }

    public function delete($id)
    {
      $brand = Brand::find($id);
      if(!is_null($brand))
      {

        //Delete Brand image
        if(File::exists('images/brands/' .$brand->image))
        {
          File::delete('images/brands/' .$brand->image);
        }
        $brand->delete();
      }

      session()->flash('success','Brand has been deleted successfully');
      return back();
    }
}
