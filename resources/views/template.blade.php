<!DOCTYPE html>
<html>
	<head>
		<title>Open HRM</title>
		<link rel="stylesheet" href="{{url('public/bower_components/bootstrap/dist/css/bootstrap.min.css')}}" type="text/css" />
		<link rel="stylesheet" href="{{url('public/bower_components/jquery-ui/themes/redmond/jquery-ui.min.css')}}" type="text/css" />
		<link rel="stylesheet" href="{{url('public/css/style.css')}}" type="text/css" />
		<script type="text/javascript" src="{{url('public/bower_components/jquery/dist/jquery.min.js')}}"></script>
		<script type="text/javascript" src="{{url('public/bower_components/bootstrap/dist/js/bootstrap.min.js')}}"></script>
		<script type="text/javascript" src="{{url('public/bower_components/angular/angular.min.js')}}"></script>
		<script type="text/javascript" src="{{url('public/bower_components/jquery-ui/ui/datepicker.js')}}"></script>
		<script type="text/javascript" src="{{url('public/js/plugins/bootbox.min.js')}}"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
		@if(isset($styles) && count($styles))
			@foreach($styles as $style)
				<script type="text/javascript" src="{{$style}}"></script>
			@endforeach
		@endif
		
		<script type="text/javascript">
			var BASE = "{{url('/').'/'}}";
		</script>
	</head>
	<body>
		<header>
		
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="collapse navbar-collapse">
					<div class="container-fluid">
						<div class="navbar-header">
							
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle Navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							
							<div class="navbar-brand">
								<a href="#">Open HRM</a>
							</div>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<div class="btn-group pull-right">
							
							
							<button type="button" class="btn btn-default navbar-btn dropdown-toogle" data-toggle="dropdown">
								<span><?php echo (count(Auth::user()))? Auth::user()->name : ''; ?></span>
								<span class="glyphicon glyphicon-user"></span> 
								
							</button>
							<button type="button" class="btn btn-default navbar-btn dropdown-toggle" data-toggle="dropdown">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu top-popup" role="menu">
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="{{url('changepass')}}"><span class="glyphicon glyphicon-lock"></span> Change Password</a></li>
							    <!--<li role="presentation"><a role="menuitem" href="#" tabindex="-1"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>-->
							    <li role="presentation" class="divider"></li>
							    <li role="presentation"><a role="menuitem" href="{{url('auth/logout')}}"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						    </ul>
						</div>
						</div>
					</div>
				</div>
			</nav>
		</header>

			@if(count(Auth::user()) && Auth::user()->role->name == 'admin')
				@include('partials.menu-admin')
			@else
				@include('partials.menu-ess')
			@endif
			
			@yield('content')
			
			
			<script type="text/javascript" src="{{url('public/js/common.js')}}"></script>
			@foreach($scripts as $script)
					<script type="text/javascript" src="{{$script}}"></script>
				@endforeach
	</body>
</html>