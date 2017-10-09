<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ mix('css/admin.css') }}" rel="stylesheet">
</head>
<body>

    <div id="login-page" class="login">
        <div class="login-plate">
            <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                {{ csrf_field() }}
                <div class="login-wrapper {{ $errors->has('email') ? ' has-error' : '' }}">
                    <label for="email">E-Mail</label>
                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>
                    @if ($errors->has('email'))
                        <span class="error">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
                    @endif
                </div>
                <div class="login-wrapper {{ $errors->has('password') ? ' has-error' : '' }}">
                    <label for="password" class="">Password</label>
                    <input id="password" type="password" class="" name="password" required>
                    @if ($errors->has('password'))
                        <span class="error">
                        <strong>{{ $errors->first('password') }}</strong>
                    </span>
                    @endif
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                    </label>
                </div>
                <div class="submit">
                    <button type="submit" class="">
                        Login
                    </button>
                    <a class="" href="{{ route('password.request') }}">
                        Forgot Your Password?
                    </a>
                </div>
            </form>
        </div>
    </div>
    {{--<script src="{{ mix('js/admin.js') }}"></script>--}}
    {{--@if (getenv('APP_ENV') === 'local')--}}
        {{--<script id="__bs_script__">//<![CDATA[--}}
            {{--document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.js?v=2.18.6'><\/script>".replace("HOST", location.hostname));--}}
            {{--//]]></script>--}}
    {{--@endif--}}
</body>