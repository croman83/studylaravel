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
use App\Category;

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
        $cat = Category::where([
            ['status',1],
        ])
            ->select([
                'name_'.App::getLocale().' as name',
                'parent_category',
                'slug',
                'id'
            ])
            ->get()->toJson();
        return view('welcome',compact('cat'));
    }

    public function getCategories(Request $request)
    {
        $category = $request->input('category');
        $data['locale'] = App::getLocale();
        $cat = DB::table('categories')
            ->where([
                ['status',1],
                ['parent_category',$category]
            ])
            ->select(
            'name_'.$data['locale'].' as name',
            'image',
            'id',
            'slug')->get();

        return $cat;
    }




}
