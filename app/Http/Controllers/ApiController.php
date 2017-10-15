<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Config;
use LaravelLocalization;
use URL;
use Lang;
use App;
use View;

class ApiController extends Controller
{
    public function getCategoryProducts(Request $request)
    {
        $input = $request->all();
        $loc = $input['locale'];
        $slg = $input['slug'];
        $cat_id = DB::table('categories')->where('slug',$slg)->select('id as id','name_'.$loc.' as name')->get();
        foreach ($cat_id as $item){
            $name = $item->name;
            $id = $item->id;
        }
        $pr = DB::table('products')->where('category_id',$id)->select(
            'name_'.$loc.' as name',
            'images',
            'price',
            'description_'.$loc.' as description',
            'slug',
            'id')->get();
        $data['products'] = $pr;
        $data['name'] = $name;
        $data['locale'] = $loc;
        return  $data;
    }

}
