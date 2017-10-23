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
use App\Product;
use App\Category;
use App\Filter;

class ApiController extends Controller
{
    public $c_id = 0;
    public function getCategoryProducts(Request $request)
    {
        $input = $request->all();

        $loc = $input['locale'];

        $slg = $input['slug'];

        $this->c_id = Category::where('slug',$slg)->first();

        $f_array = $input['filter'];
        $temp2 = collect([]);
        foreach ($f_array as $item2){
            $temp = Filter::find($item2)->products()->get();

            foreach ($temp as $item){
                $temp2->push($item['id']);
            }
        }
        $temp2->collapse()->all();
        if(count($f_array)){
            $pr = Category::find($this->c_id['id'])
                ->products()
                ->whereIn('id',$temp2)
                ->select(
                    'name_'.$loc.' as name',
                    'price',
                    'description_'.$loc.' as description',
                    'slug',
                    'id')->
                orderBy('created_at','asc')->skip( $input['page'] * 5 - 5 )->take(5)->
                get();
        }else{
            $pr = DB::table('products')->
            where('category_id',$this->c_id->id)->
            select(
                'name_'.$loc.' as name',
                'price',
                'description_'.$loc.' as description',
                'slug',
                'id')->
            orderBy('created_at','asc')->skip( $input['page'] * 5 - 5 )->take(5)->
            get();
        }


        $product_total = count($pr);

        $filter = Category::find($this->c_id['id'])
            ->filters()
            ->select(
                'name_'.$loc.' as name',
                'id'
            )
            ->get();

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


        $data['filter'] = $filter;
        $data['products'] = $product;
        $data['name'] = $this->c_id['name_'.$loc];
        $data['locale'] = $loc;
        $data['product_total'] = $product_total;
        return  $data;
    }
    public function getProductDetails(Request $request)
    {
        $input = $request->all();

        $lang = $input['locale'];

        $product = Product::where('slug',$input['slug'])
            ->select(
                'name_'.$lang.' as name',
                    'price',
                    'description_'.$lang.' as description',
                    'extra_description_'.$lang.' as extra_description',
                    'slug',
                    'favorit',
                    'id')
            ->first();

        $cat = Product::find($product['id'])
            ->category()
            ->select('name_'.$lang.' as name','slug')
            ->get();

        $img = Product::find($product['id'])
            ->images()
            ->select('image','image_thumb')
            ->get();

        return ['product'=>$product,'images'=>$img,'cat'=>$cat,'session'=>session()];
    }
    public function favorit(Request $request)
    {
        $input = $request->all();
    }
}
