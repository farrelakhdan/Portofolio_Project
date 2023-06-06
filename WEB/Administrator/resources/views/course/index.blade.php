@extends('layouts.app', ['activePage' => 'dashboard', 'title' => __('My Course')])

@section('content')
  <div class="content">
    <div class="container-fluid">
        
      
        <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Simple Table</h4>
                  <p class="card-category"> Here is a subtitle for this table</p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-shopping">
                            <thead>
                                <tr>
                                    <th class="text-center"></th>
                                    <th>Mata Pelajaran</th>
                                    <th class="th-description">Materi</th>
                                    <th class="text-left">Bentuk Materi</th>
                                    <th class="text-center">Progress</th>
                                    <th class="text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($modul as $item)
                                <tr>
                                    <td>
                                        <div class="img container">
                                            <img class="card-img-top" src="/image/{{$item->image}}" alt="" /> </td>
                                        </div>        
                                    <td class="td-name">{{$item->mapel}}</td>
                                    <td class="td-name">{{$item->modul}}</td>
                                    <td class="td-number">
                                        <div class="img-container">
                                            <img class="card-img-top" src="/{{$item->type}}" alt="" />
                                        </div>
                                    </td>
                                    <td class="td-name">
                                        <div class="progress-container progress-primary">
                                            <div class="progress">
                                              <div class="progress-bar progress-bar-striped" role="progressbar" style="width: {{$item->status}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">{{$item->status}}%</div>
                                            </div>
                                          </div>
                                    </td>
                                    <td class="td-actions">
                                        <a href="/file/{{$item->ID}}" class="btn btn-success btn-simple"><i class="material-icons">edit</i>Buka</a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                      </div>
                </div>
              </div>
            </div>
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