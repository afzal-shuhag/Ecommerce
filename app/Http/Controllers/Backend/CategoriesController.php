<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Image;
use File;

if (version_compare(PHP_VERSION, '7.2.0', '>=')) {
// Ignores notices and reports all other kinds... and warnings
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
// error_reporting(E_ALL ^ E_WARNING); // Maybe this is enough
}

class CategoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
      $categories = Category::orderBy('id','desc')->get();
      return view('backend.pages.categories.index', compact('categories'));
    }

    public function create()
    {
      $main_categories = Category::orderBy('name','desc')->where('parent_id', NULL)->get();
      return view('backend.pages.categories.create', compact('main_categories'));
    }

    public function store(Request $request)
    {
      $this->validate($request,
      [
        'name' => 'required',
        'image' => 'nullable|image',
      ],
      [
        'name.required' => 'Please insert a category Name',
        'image.image' => 'The file must be an image',
      ]);

      $category = new Category();

      $category->name = $request->name;
      $category->description = $request->description;
      $category->parent_id = $request->parent_id;

      //Image Inserting
      if (count($request->image)>0)
      {
          $image = $request->file('image');
          $img = time() . '.'. $image->getClientOriginalExtension();
          $location = 'images/categories/' .$img;
          Image::make($image)->save($location);
          $category->image = $img;
      }
      $category->save();

      session()->flash('success', 'A new category has been added successfully :)');
      return redirect()->route('admin.categories');
    }

    public function edit($id)
    {
      $main_categories = Category::orderBy('name','desc')->where('parent_id', NULL)->get();
      $category = Category::find($id);
      if(!is_null($category))
      {
        return view('backend.pages.categories.edit', compact('category','main_categories'));
      }
      else
      {
        return redirect()->route('admin.categories');
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
        'name.required' => 'Please insert a category Name',
        'image.image' => 'The file must be an image',
      ]);

      $category = Category::find($id);

      $category->name = $request->name;
      $category->description = $request->description;
      $category->parent_id = $request->parent_id;

      //Image Inserting
      if (count($request->image)>0)
      {
        //Delete The old image from file
          if(File::exists('images/categories/' .$category->image))
          {
            File::delete('images/categories/' .$category->image);
          }

          $image = $request->file('image');
          $img = time() . '.'. $image->getClientOriginalExtension();
          $location = 'images/categories/' .$img;
          Image::make($image)->save($location);
          $category->image = $img;
      }
      $category->save();

      session()->flash('success', 'A new category has been updated successfully :)');
      return redirect()->route('admin.categories');
    }

    public function delete($id)
    {
      $category = Category::find($id);
      if(!is_null($category))
      {
        //If it is parent category then delete all it's sub category
        if($category->parent_id == NULL)
        {
          //delete sub categories
          $sub_categories = Category::orderBy('name','desc')->where('parent_id', $category->id)->get();
          foreach($sub_categories as $sub)
          {
            if(File::exists('images/categories/' .$sub->image))
            {
              File::delete('images/categories/' .$sub->image);
            }
            $sub->delete();
          }
        }
        //Delete Category image
        if(File::exists('images/categories/' .$category->image))
        {
          File::delete('images/categories/' .$category->image);
        }
        $category->delete();
      }

      session()->flash('success','Category has been deleted successfully');
      return back();
    }
}
