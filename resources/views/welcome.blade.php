<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        @include('head')
    </head>
    <body>
        <div id="app">
            <loading ref="loading"></loading>
            <app-header></app-header>
            <transition name="faderouterfront" mode="out-in">
                <router-view></router-view>
            </transition>
            <app-footer></app-footer>
        </div>
        @include('scripts')
    </body>
</html>
