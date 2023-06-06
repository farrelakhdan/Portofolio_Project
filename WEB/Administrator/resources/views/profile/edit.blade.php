@extends('layouts.app', ['activePage' => 'profile', 'title' => __('User Profile')])

@section('content')
  <div class="content">
    <div class="container-fluid">
      @foreach ($user as $item)
        
      </div>
      <div class="row">
        <div class="col-md-12">
          
            
          <form method="post" action="/editprofile" enctype="multipart/form-data" class="form-horizontal">
            @csrf

            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">{{ __('Edit Profile') }}</h4>
                <p class="card-category">{{ __('User information') }}</p>
              </div>
              <div class="card-body ">
          
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Foto') }}</label>
                  <div class="col-sm-7">
                    <div class="input-group{{ $errors->has('image') ? ' has-danger' : '' }}">
                      <img class="card-img-md-5" src="assets/img/new_logo.png" alt="" />
                      <input class="form-control{{ $errors->has('image') ? ' is-invalid' : '' }}" name="image" id="input-image" type="file" value=""/>
                      @if ($errors->has('image'))
                        <span id="name-error" class="error text-danger" for="input-image">{{ $errors->first('image') }}</span>
                      @endif
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Name') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name_user" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{$item->name_user}}" required="true" aria-required="true"/>
                      @if ($errors->has('name'))
                        <span id="name-error" class="error text-danger" for="input-name">{{ $errors->first('name') }}</span>
                      @endif
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Email') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('email') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" id="input-email" type="email" placeholder="{{ __('Email') }}" value="{{$item->email}}" required />
                      @if ($errors->has('email'))
                        <span id="email-error" class="error text-danger" for="input-email">{{ $errors->first('email') }}</span>
                      @endif
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Telepon') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('telepon') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('telepon') ? ' is-invalid' : '' }}" name="telepon" id="input-telepon" type="text" placeholder="{{ __('Telepon') }}" value="{{$item->telepon}}" required />
                      @if ($errors->has('telepon'))
                        <span id="telepon-error" class="error text-danger" for="input-telepon">{{ $errors->first('telepon') }}</span>
                      @endif
                    </div>
                  </div>
                </div>
      
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-primary">{{ __('Save') }}</button>
              </div>
            </div>
          </form>
          @endforeach
        </div>
      </div>

    </div>
  </div>
@endsection