@extends('frontend.layouts.master')

@section('content')
<!-- Start of Siderbar + content -->

  <div class="container margin-top-20">
    <div class="row">
      <div class="col-md-4">
      @include('frontend.partials.product-sidebar')
      </div>


      <div class="col-md-8">
          <div class="widget">
            <h3>All Products in <span class="badge badge-info">{{ $category->name }}</span> </h3>
            @php
              $products = $category->products()->paginate(9);
            @endphp

            @if($products->count() > 0)
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
            @else
              <div class="alert alert-warning">
                No Products Available in this category!!
              </div>
            @endif
          </div>
      </div>
    </div>
  </div>

<!-- End of Siderbar + Content -->
@endsection
