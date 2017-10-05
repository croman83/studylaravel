<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="{{ mix('/css/app.css') }}">
        <title>Laravel</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

    </head>
    <body>
        <div id="app">
            <apps></apps>
        </div>
        <script src="{{ mix('/js/app.js') }}"></script>
        @if (getenv('APP_ENV') === 'local')
            <script id="__bs_script__">//<![CDATA[
                document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.js?v=2.18.6'><\/script>".replace("HOST", location.hostname));
                //]]></script>
        @endif
    </body>
</html>
