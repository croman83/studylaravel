<?php

namespace App\Http\Controllers;

use View;
use Config;
use Auth;
use Redirect;
use LaravelLocalization;
use URL;
use Lang;
use DB;
use Illuminate\Http\Request;
use App;
use App\Categories;

class ViewController extends Controller
{
    public function __construct()
    {
        // во всех конструкторах необходимо кинуть локаль и список поддерживаемых локалей в шаблонизатор, чтобы реализовать переключатель языка. Для примера бросил здесь, но лучше где-нить в Controller::constructor'е
        View::share( 'locale', Lang::getLocale() );
        View::share( 'locales', LaravelLocalization::getSupportedLocales() );
    }


    public function index()
    {
        return view('welcome');
    }

    public function getCategories(Request $request)
    {
        $data['locale'] = App::getLocale();
        $cat = DB::table('categories')->select(
            'name_'.$data['locale'].' as name',
            'image',
            'id',
            'slug')->get();
        return $cat;
    }




}
