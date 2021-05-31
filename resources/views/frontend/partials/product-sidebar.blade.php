<div class="list-group">
  @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id', NULL)->get() as $parent)

    <a href="{{ route('categories.show', $parent->id) }}" class="list-group-item list-group-item-action
      @if(Route::is('categories.show'))
        @if($parent->id == $category->id)
          active
        @endif
      @endif

      " >
      <img src="{{ asset('images/categories/'. $parent->image) }}" alt="" width="50">
        {{ $parent->name }}
    </a> <a href="#main - {{ $parent->id }}" data-toggle="collapse" class="list-group-item list-group-item-action">{{ $parent->name }} Sub categories---></a>
    <div class="collapse

      @if(Route::is('categories.show'))
        @if(App\Models\Category::ParentOrNotCategory($parent->id, $category->id))
          show
        @endif
      @endif

    " id="main - {{ $parent->id }}">

      @foreach(App\Models\Category::orderBy('name','asc')->where('parent_id', $parent->id)->get() as $child)

      <div class="child-rows">
        <a href="{{ route('categories.show', $child->id) }}" class="list-group-item list-group-item-action

          @if(Route::is('categories.show'))
            @if($child->id == $category->id)
              active
            @endif
          @endif
          ">
          <img src="{{ asset('images/categories/'. $child->image) }}" alt="" width="40">
            {{ $child->name }}
        </a>
      </div>

      @endforeach

    </div>

  @endforeach



</div>
