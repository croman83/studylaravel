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
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="{{ mix('css/admin.css') }}" rel="stylesheet">
</head>
<body>
    <div id="admin">
        @yield('content')
    </div>

    <!-- Scripts -->
    @php
        $config = [
            'locale' => $locale = app()->getLocale(),
            'translations' => json_decode(file_get_contents(resource_path("lang/admin/{$locale}/{$locale}.json")), true)

        ];
    @endphp
    <script>window.config = {!! json_encode($config); !!};</script>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
    <script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>

    <script src="{{ mix('js/admin.js') }}"></script>

        <script id="__bs_script__">//<![CDATA[
            document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.js?v=2.18.6'><\/script>".replace("HOST", location.hostname));
            //]]></script>
</body>
</html>
