<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        @include('head')
    </head>
    <body>
        <div id="app">
            <app-header></app-header>
            <router-view></router-view>
            <app-footer></app-footer>
        </div>
        @include('scripts')
    </body>
</html>
