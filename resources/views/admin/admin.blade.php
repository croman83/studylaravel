@extends('admin.layouts.app')

@section('content')
{{--<div class="container">--}}
    {{--<div class="row">--}}
        {{--<div class="col-md-8 col-md-offset-2">--}}
            {{--<div class="panel panel-default">--}}

                {{--<div class="panel-body">--}}
                    {{--@if (session('status'))--}}
                        {{--<div class="alert alert-success">--}}
                            {{--{{ session('status') }}--}}
                        {{--</div>--}}
                    {{--@endif--}}

                    {{--You are logged in!--}}
                {{--</div>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
{{--</div>--}}
    <loading ref="loading"></loading>
    <app-header name="{{ Auth::user()->name }}"></app-header>
    <div class="admin-wrapper">
        <div class="admin-sidebar">
            <side-bar></side-bar>
        </div>
        <div class="admin-content">
            <transition name="faderouter" mode="out-in">
                <router-view></router-view>
            </transition>
        </div>
    </div>

@endsection
