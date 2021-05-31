<div class="row">

  @foreach($products as $product)

  <div class="col-md-4">
    <div class="card">
      <!-- <img class="card-img-top feature-img" src="{{ asset('images/products/'.'samsung.png') }}" alt="Card image"> -->
      @php $i = 1; @endphp
      @foreach($product->images as $image)
        @if($i>0)
        <a href="{{ route('products.show', $product->slug) }}">
          <img style ="  min-height: 200px;" class="card-img-top feature-img product_image" src="{{ asset('images/products/'. $image->image) }}" alt="Card image">
        </a>
        @endif
      @php $i--; @endphp
      @endforeach
      <div class="card-body">
        <h4 class="card-title">
           <a href="{{ route('products.show', $product->slug) }}">{{ $product->title }}</a>
         </h4>
        <p class="card-text">Taka - {{ $product->price }}</p>
        @include('frontend.pages.product.partials.cart-button')
        <!-- <a href="#" class="btn btn-outline-warning">Add To Cart</a> -->
      </div>
    </div>
  </div>

  @endforeach


</div>

<div class="pagination">
    {{ $products->links() }}
</div>

@foreach($categories as $category)

  @if($category->products())
<div class="{{ $category->name }} mt-5">
  <h3 class="badge badge-info">{{ $category->name }}</h3>

  <div class="row">
      @foreach($category->products as $product)
    <div class="col-md-4">

      <div class="card">
        <!-- <img class="card-img-top feature-img" src="{{ asset('images/products/'.'samsung.png') }}" alt="Card image"> -->
        @php $i = 1; @endphp

          @foreach($product->images as $image)
          @if($i>0)
          <a href="{{ route('products.show', $product->slug) }}">
            <img style ="  min-height: 200px;" class="card-img-top feature-img product_image" src="{{ asset('images/products/'. $image->image) }}" alt="Card image">
          </a>
          @endif
        @php $i--; @endphp
        @endforeach

        <div class="card-body">
          <h4 class="card-title">
             <a href="{{ route('products.show', $product->slug) }}">{{ $product->title }}</a>
           </h4>
          <p class="card-text">Taka - {{ $product->price }}</p>
          @include('frontend.pages.product.partials.cart-button')
          <!-- <a href="#" class="btn btn-outline-warning">Add To Cart</a> -->
        </div>
      </div>

    </div>
          @endforeach
  </div>
</div>


@endif
@endforeach
