<div class="sidebar" data-color="orange" data-background-color="white" data-image="assets/img/sidebar-1.jpg">
  <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
  <div class="logo">
    <a href="" class="simple-text logo-normal">
      {{ __('Intellect Room') }}
    </a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
      <li class="nav-item{{ $activePage == 'dashboard' ? ' active' : '' }}">
        <a class="nav-link" href="/home">
          <i class="material-icons">dashboard</i>
            <p>{{ __('Dashboard') }}</p>
        </a>
      </li>

      <li class="nav-item {{ ($activePage == 'profile' || $activePage == 'user-management') ? ' active' : '' }}">
        <a class="nav-link" data-toggle="collapse" href="#laravelExample" aria-expanded="true">
          <i><img style="width:25px" src="/assets/img/react.png"></i>
          <p>{{ __('Kategori') }}
            <b class="caret"></b>
          </p>
        </a>
        <div class="collapse show" id="laravelExample">
          <ul class="nav">
            <li class="nav-item{{ $activePage == 'profile' ? ' active' : '' }}">
              <a class="nav-link" href="/sd-mi">
                <span class="sidebar-mini"> <i><img style="width:25px" src="/sd.jpg"></i> </span>
                <span class="sidebar-normal">{{ __('SD / MI') }} </span>
              </a>
            </li>
            <li class="nav-item{{ $activePage == 'user-management' ? ' active' : '' }}">
              <a class="nav-link" href="/smp-mts">
                <span class="sidebar-mini"> <i><img style="width:25px" src="/smp.jpg"></i> </span>
                <span class="sidebar-normal"> {{ __('SMP / MTs') }} </span>
              </a>
            </li>
            <li class="nav-item{{ $activePage == 'user-management' ? ' active' : '' }}">
              <a class="nav-link" href="/sma-ma">
                <span class="sidebar-mini"> <i><img style="width:25px" src="/sma.jpg"></i> </span>
                <span class="sidebar-normal"> {{ __('SMA / MA') }} </span>
              </a>
            </li>
          </ul>
        </div>
      </li>

      <li class="nav-item{{ ($activePage == 'course') ? ' active' : '' }}">
        <a class="nav-link" data-toggle="collapse" href="#course" aria-expanded="true">
          <i class="material-icons">book</i>
            <p>{{ __('My Course') }}
              <b class="caret"></b>
            </p>
        </a>
        <div class="collapse show" id="course">
          <ul class="nav">
            <?php $status = Session::get('status') ?>
            @if ($status == "login")
              @foreach ($course as $item)
              @if ($item->active == "1") 
                <li class="nav-item{{ $activePage == 'course' ? ' active' : '' }}">
                  <a class="nav-link" href="/course/{{$item->ID}}">
                    <span class="sidebar-mini"> <i><img style="width:25px" src="/image/{{ $item->image }}"></i> </span>
                    <span class="sidebar-normal">{{ $item->mapel }} </span>
                    <div class="progress-container progress-primary">
                      <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: {{$item->status}}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">{{$item->status}}%</div>
                      </div>
                    </div>
                  </a>
                </li>
              @endif
              @endforeach
            @else
              <li class="nav-item{{ $activePage == 'course' ? ' active' : '' }}">
                <a class="nav-link" href="/login">
                  <i class="material-icons">remove</i>
                  <span class="sidebar-normal">You Have No Course Yet</span>
                </a>
              </li>
            @endif
          
          </ul>
        </div>
      </li>

    </ul>
  </div>
</div>
