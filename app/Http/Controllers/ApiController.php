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
        $pr = DB::table('products')->
        where('category_id',$id)->
        select(
            'name_'.$loc.' as name',
            'price',
            'description_'.$loc.' as description',
            'slug',
            'id')->
            orderBy('created_at','asc')->skip( $input['page'] * 5 - 5 )->take(5)->
        get();
        $product_total = DB::table('products')->
        where('category_id',$id)->count();
        $product = [];
        $i = 0;
        foreach ($pr as $item){
            $base = DB::table('productimages')->
                where('product_id',$item->id)->
                select('image')->
            get();
            $product[$i]['images'] = $base;
            $product[$i]['info'] = $item;
            $i++;
        }
        $data['products'] = $product;
        $data['name'] = $name;
        $data['locale'] = $loc;
        $data['product_total'] = $product_total;
        return  $data;
    }

}
