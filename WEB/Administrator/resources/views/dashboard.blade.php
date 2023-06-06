@extends('layouts.app', ['activePage' => 'dashboard', 'title' => __('Dashboard')])

@section('content')
  <div class="content">
    <div class="container-fluid">
        
      
      <div class="row">
        @foreach ($mapel as $item)
        <div class="col-md-4">
          <div class="card card-chart">
            <div class="card-header card-header-success">
              <img class="card-img-top" src="/image/{{$item->image}}" alt="" />
            </div>
            <div class="card-body">
              <h4 class="card-title">{{$item->name_mapel}}</h4>
              <p class="card-category">
                {{$item->deskripsi}}</p>
            </div>
            <div class="card-footer">
              <div class="stats">
                <a class="btn btn-outline-dark mt-auto" href="/detail/{{$item->ID}}">Details</a>  
              </div>
            </div>
          </div>
        </div>
        @endforeach  
      </div>
      
    </div>
  </div>
@endsection

@push('js')
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();
    });
  </script>
@endpush