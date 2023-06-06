@extends('admin.nav')

@section('link_rel')
    <link rel="stylesheet" href="css/homeHtyle.css">
    <!-- DataTables -->
  <link rel="stylesheet" href="{{ asset('LTE/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ asset('LTE/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ asset('LTE/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="{{ asset('LTE/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') }}">
  <!-- Toastr -->
  <link rel="stylesheet" href="{{ asset('LTE/plugins/toastr/toastr.min.css') }}">
@endsection

@section('title')
  
@endsection 
@section('content')
<div class="row">
  <div class="col-md-12">
    <div class="card">
      <div class="card-header">
        <h5 class="card-title">DATA </h5>
        <div class="card-tools">
          <a href="" value="new" class="EditBtn btn-sm btn-primary" data-toggle="modal" data-target="#EditModal" data-placement="top" title="Tambah Data">
            <i class="fa fa-plus-circle"></i> Create Data
          </a>
          <button type="button" class="btn btn-tool" data-card-widget="collapse">
            <i class="fas fa-minus"></i>
          </button>
        </div>
      </div>
      
      <div class="card-body">
        <div class="row">
          <div class="col-md-12">
            <!-- Chart Canvas Top Player -->
            <div class="card">
              <div class="card-body p-0">
                <!-- <table id="example3" class="table table-bordered table-striped"> -->
                <table id="findTable2" class="table table-sm">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th style="width: 70px">ID</th>
                      <th >ID Mapel</th>
                      <th >Name</th>
                      <th >Type</th>
                      <th >FILE</th>
                      <th width="130px" class="text-center">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $i = 0 ?>
                    @foreach ($data as $fld)
                    <tr>
                      <td class="text-center" width="3%">{{ ++$i }}</td>
                      <td>{{ $fld->ID }} </td>
                      <td>{{ $fld->ID_mapel }} </td>
                      <td>{{ $fld->name_product }} </td>
                      @if ( $fld->type == "pdf.jpg")
                      <td>PDF</td>    
                      @else
                      <td>Video</td>
                      @endif
                      
                      <td>{{ $fld->file_product }} </td>
                      <td class="text-center">
                        <a href="" value="{{ $fld->ID }}" class="EditBtn btn-primary btn-xs" data-toggle="modal" data-target="#EditModal" data-placement="top" title="Koreksi Data">
                        <i class="fa fa-edit"></i> Edit</a>
                        <a href="" value="{{ $fld->ID }}" class="DelBtn btn-secondary btn-xs" data-toggle="modal" data-target="#DelRecModal" data-placement="top" title="Data tidak boleh dihapus">
                        <i class="fa fa-trash"></i> Del</a>
                        
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

    <!-- Modal Update -->
  <div class="modal fade" id="EditModal" data-backdrop="static">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-primary">
          <h6 class="modal-title" id="tJudul">Data</h6>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <form class="form-horizontal" id="EditForm" enctype="multipart/form-data">
          {{ csrf_field() }} {{ method_field('POST') }}

          <div class="modal-body">
            <div class="form-group row">
              <label for="inputText" class="col-sm-2 col-form-label">ID Categories</label>
              <div class="col-sm-10">
                <div class="input-group input-group-sm">
                  <select name="ID_mapel" class="form-control select" id="eID_mapel" placeholder="-- Choose Category --" style="width: 100%;" >
                    @foreach ($mapel as $d)
                    <option value="{{ $d->ID }}" >{{ $d->name_mapel }}</option>
                    @endforeach
                  </select>
                </div>
              </div>

              <label for="inputText" class="col-sm-2 col-form-label">Name</label>
              <div class="col-sm-10">
                <div class="input-group input-group-sm">
                  <input type="text" name="name_product" id="ename_product"  class="form-control" placeholder="max 250 char" required>
                </div>
              </div>

              <label for="inputText" class="col-sm-2 col-form-label">Type</label>
              <div class="col-sm-10">
                <div class="input-group input-group-sm">
                  <select name="type" class="form-control select" id="etype" placeholder="-- Choose Category --" style="width: 100%;" >
                    <option value="video.jpg" >Video</option>
                    <option value="pdf.jpg" >PDF</option>
                  </select>
                </div>
              </div>

              <label for="inputFile" class="col-sm-2 col-form-label">File</label>
              <div class="col-sm-10">
                <div class="input-group input-group-sm">
                  <input type="file" name="file_product" id="efile_product"  class="form-control" placeholder="max 250 char" >
                </div>
              </div>

              <label for="inputText" class="col-sm-2 col-form-label">Video</label>
              <div class="col-sm-10">
                <div class="input-group input-group-sm">
                  <input type="text" name="video_product" id="evideo_product"  class="form-control" placeholder="max 250 char">
                </div>
              </div>

            </div>
          </div>

          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cancel</button>
            <button type="submit" class="btn btn-danger"><i class="fa fa-save"></i> Save</button>
          </div>
        </form>  

      </div>
    </div>
  </div>

  <!-- Modal Delete -->
  <div class="modal fade" id="DelRecModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-danger">
          <h6 class="modal-title"><i class="fa fa-question-circle"></i>  Hapus Detail Data</h6>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <form id="DelRecForm">
          @csrf
          @method('PUT')

          <div class="modal-body">
            <div class="row">
                <dd class="col-sm-8" id="dID" hidden=""></dd>
              <dt class="col-sm-4">Mapel </dt><dd class="col-sx-1">:</dd>
              <dd class="col-sm-6" id="dname_product"></dd>
              <dt class="col-sm-4">Product </dt><dd class="col-sx-1">:</dd>
              <dd class="col-sm-6" id="dfile_product"></dd>
            </div>
          </div>

          <div class="modal-footer justify-content-between">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply-all"></i> Cancel</button>
            <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i> Delete</button>
          </div>
        </form>  
      
      </div>
    </div>
  </div>
@endsection

@section('script_src')
  <!-- DataTables  & Plugins -->
  <script src="{{ asset('LTE/plugins/datatables/jquery.dataTables.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/jszip/jszip.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/pdfmake/pdfmake.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/pdfmake/vfs_fonts.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
  <script src="{{ asset('LTE/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
  <!-- SweetAlert2 -->
  <script src="{{ asset('LTE/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
  <!-- Toastr -->
  <script src="{{ asset('LTE/plugins/toastr/toastr.min.js') }}"></script>
@endsection

@section('script_e')
  <script>
    var Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });  

      // Modal Add & Edit
    $('.EditBtn').on('click',function() {
      $cID = $(this).attr("value");
      if ($cID == "new") { 
        $("#tJudul").text("Add Data Product");
        $("#eID_mapel").val("");
        $("#ename_product").val("");
        $("#etype").val("");
        }
      else { 
        $("#tJudul").text("Edit Data Product");
        $.get("Det_Pro/"+$(this).attr("value"))
          .done(function(data){
            $("#eID_mapel").val(data[0].ID_mapel);
            $("#ename_product").val(data[0].name_product);
            $("#etype").val(data[0].type);
            $("#evideo_product").val(data[0].file_product);
            $cID = data[0].ID;
          });
        }

      $i = 0;
      $('#EditForm').on('submit',function(e){
        e.preventDefault();
        if ( $i == 0 ) {
          $i = 1;
          var id = $cID;

          $.ajax({
            type : "POST",
            url : "Upd_Pro/"+id,
            data : new FormData($("#EditForm")[0]),
            contentType: false,
            processData: false,
            success : function (response) {
              console.log(response);
              $('#EditModal').modal('hide');

              toastr.success('SUCCESS.., Input data berhasil, Silahkan klik reload/refresh.');
              location.reload();
            },
            error: function(error) {
              console.log(error);
              toastr.error('ERROR.., silahkan dicek kembali.');
              $i = 0;
            }
          });
        }
      });
    })

    // Modal Delete Record
    $('.DelBtn').on('click',function() {
      $.get("Det_Home/"+$(this).attr("value"))
        .done(function(data){
        $('#dID').text(data[0].kode);
        $('#dUraian').text(data[0].paragraf);
      });

      $('#DelRecForm').on('submit',function(e){
        e.preventDefault();
        var id = $('#dID').text();
        $.ajax({
          type : "PUT",
          url : "Del_Home/"+id,
          data : $('#DelRecForm').serialize(),
          success : function (response) {
            console.log(response);
            $('#DelRecModal').modal('hide');
            toastr.success('SUCCESS..., Data CPL sudah terhapus, Silahkan klik refresh/reload');
            // location.reload();
          },
          error: function(error) {
            console.log(error);
            toastr.error('ERROR.., Hapus data terjadi kesalahan.');
          }
        });
      });

    });
  </script>
@endsection