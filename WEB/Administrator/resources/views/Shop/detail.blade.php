@extends('layouts.app', ['activePage' => 'dashboard', 'title' => __('Dashboard')])

@section('content')
  <div class="content">
    <div class="container-fluid">
        
      
      <div class="row">
        <?php $id = Session::get('id_user'); $status = Session::get('status')?>
        @foreach ($mapel as $item)
        <div class="col-md-10">
          <div class="card card-chart">
            <div class="card-header card-header-success">
              <img class="card-img-top" src="/image/{{$item->image}}" alt="" />
            </div>
            <div class="card-body">
              <h4 class="card-title">{{$item->name_mapel}}</h4>
              <p class="card-category">
                {{$item->deskripsi}}</p>
                <h4 class="card-title">Fasilitas</h4>  
                @foreach ($product as $item1)
                    <p class="card-category"><i><img style="width:25px" src="/{{ $item1->type }}"></i>{{$item1->name_product}}</p>
                @endforeach
            </div>
            <div class="card-footer">
              <div class="stats">
                @if ($status == "login")
                <a class="btn btn-outline-success mt-auto" href="/enroll/{{ $item->ID }}">ENROLL</a>  
                @else
                <a class="btn btn-outline-success mt-auto" href="/login">ENROLL</a>  
                @endif
                
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