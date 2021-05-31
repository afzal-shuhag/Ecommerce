<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use File;
use Image;

if (version_compare(PHP_VERSION, '7.2.0', '>=')) {
// Ignores notices and reports all other kinds... and warnings
error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
// error_reporting(E_ALL ^ E_WARNING); // Maybe this is enough
}


class SlidersController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
      $sliders = Slider::orderBy('priority','asc')->get();
      return view('backend.pages.sliders.index', compact('sliders'));
    }


    public function store(Request $request)
    {
      $this->validate($request, [
        'title' => 'required',
        'image' => 'required|image',
        'priority' => 'required',
        'button_link' => 'nullable|url',
      ],
      [
        'title.required' => 'Please Provide Slider Title',
        'image.required' => 'Please Provide a Slider Image',
        'image.image' => 'Please Provide a valid Slider Image',
        'priority.required' => 'Please Provide a Slider Priority',
        'button_link.url' => 'Please Provide valid link of slider url',
      ]
    );

    $slider = new Slider();

    $slider->title = $request->title;
    $slider->button_text = $request->button_text;
    $slider->button_text = $request->button_text;
    $slider->button_link = $request->button_link;
    $slider->priority = $request->priority;
    if (count($request->image)>0)
    {
        $image = $request->file('image');
        $img = time() . '.'. $image->getClientOriginalExtension();
        $location = 'images/sliders/' .$img;
        Image::make($image)->save($location);
        $slider->image = $img;
    }
    $slider->save();

    session()->flash('success','Slider has been added successfuly');
    return redirect()->route('admin.sliders');
    }

    public function update(Request $request, $id)
    {
      $this->validate($request, [
        'title' => 'required',
        'image' => 'nullable|image',
        'priority' => 'required',
        'button_link' => 'nullable|url',
      ],
      [
        'title.required' => 'Please Provide Slider Title',
        'image.image' => 'Please Provide a valid Slider Image',
        'priority.required' => 'Please Provide a Slider Priority',
        'button_link.url' => 'Please Provide valid link of slider url',
      ]
    );

    $slider = Slider::find($id);

    $slider->title = $request->title;
    $slider->button_text = $request->button_text;
    $slider->button_text = $request->button_text;
    $slider->button_link = $request->button_link;
    $slider->priority = $request->priority;
    if (count($request->image)>0)
    {
      //Delete The old image from file
        if(File::exists('images/sliders/' .$slider->image))
        {
          File::delete('images/sliders/' .$slider->image);
        }
        $image = $request->file('image');
        $img = time() . '.'. $image->getClientOriginalExtension();
        $location = 'images/sliders/' .$img;
        Image::make($image)->save($location);
        $slider->image = $img;
    }
    $slider->save();

    session()->flash('success','Slider has been Updated successfuly');
    return redirect()->route('admin.sliders');
    }

    public function delete($id)
    {
      $slider = Slider::find($id);
      if(!is_null($slider))
      {
        //delete image
        if(File::exists('images/sliders/' .$slider->image))
        {
          File::delete('images/sliders/' .$slider->image);
        }
        $slider->delete();
      }
      session()->flash('success','Slider has been deleted successfuly');
      return back();
    }
}
