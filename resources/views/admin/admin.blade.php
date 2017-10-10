@extends('admin.layouts.app')

@section('content')
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
