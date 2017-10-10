@php
    $config = [
        'appName' => config('app.name'),
        'locale' => $locale = app()->getLocale(),
        'translations' => json_decode(file_get_contents(resource_path("lang/{$locale}/{$locale}.json")), true)

    ];
@endphp
<script>window.config = {!! json_encode($config); !!};</script>
<script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
<script src="{{ mix('/js/app.js') }}"></script>
    <script id="__bs_script__">//<![CDATA[
        document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.js?v=2.18.6'><\/script>".replace("HOST", location.hostname));
        //]]></script>
