<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Division;
use App\Models\District;

class DivisionsController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }
    
    public function index()
    {
      $divisions = Division::orderBy('priority','asc')->get();
      return view('backend.pages.divisions.index', compact('divisions'));
    }

    public function create()
    {
      return view('backend.pages.divisions.create');
    }

    public function store(Request $request)
    {
      $this->validate($request, [
        'name' => 'required',
        'priority' => 'required'
      ],
      [
        'name.required' => 'Please Provide a division name',
        'priority.required' => 'Please Provide a division Property',
      ]
    );

    $division = new Division();

    $division->name = $request->name;
    $division->priority = $request->priority;
    $division->save();

    session()->flash('success','Division has been added successfuly');
    return redirect()->route('admin.divisions');
    }

    public function edit($id)
    {
      $division = Division::find($id);
      if(!is_null($division))
      {
        return view('backend.pages.divisions.edit',compact('division'));
      }
      else
      {
        return redirect()->route('admin.divisions');
      }
    }

    public function update(Request $request, $id)
    {
      $this->validate($request, [
        'name' => 'required',
        'priority' => 'required'
      ],
      [
        'name.required' => 'Please Provide a division name',
        'priority.required' => 'Please Provide a division Property',
      ]
    );

    $division = Division::find($id);

    $division->name = $request->name;
    $division->priority = $request->priority;
    $division->save();

    session()->flash('success','Division has been updated successfuly');
    return redirect()->route('admin.divisions');
    }

    public function delete($id)
    {
      $division = Division::find($id);
      if(!is_null($division))
      {
        //delete allthe Districts
        $districts =  District::where('division_id', $division->id)->get();
        foreach($districts as $district)
        {
          $district->delete();
        }
        $division->delete();
      }
      session()->flash('success','Division has been deleted successfuly');
      return back();
    }
}
