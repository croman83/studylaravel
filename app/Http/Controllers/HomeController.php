<?php

namespace App\Http\Controllers;

use App\Productimage;
use Illuminate\Http\Request;
use Auth;
use Session;
use App\Category;
use App\Product;
use App\Filter;
use Illuminate\Support\Facades\DB;
use Input;
use File;
use Intervention\Image\ImageManagerStatic as Image;


class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('admin.admin');
    }

    public function translateSave(Request $request)
    {
        $input = $request->all();
        $newJsonString = json_encode($input['trans']);
        $locales = $input['locales'];
        $resources = resource_path();
        $file = $resources.'/lang/admin/'.$locales.'/'.$locales.'.json';
        $resp = file_put_contents($file, $newJsonString);
        if($resp){
            return ['success'=>true];
        }else{
            return ['success'=>false];
        }
    }

    public function getCategories(Request $request){
        $input = $request->all();
        $lang = $input['lang'];
        $data['categories'] = Category::where('parent_category',0)
            ->get()->toArray();
        return $data;
    }

    public function categoryInfo(Request $request,$slug){
        $input = $request->all();
        $lang = $input['lang'];
        if($input['type'] === 'get'){
            $data['cat'] = Category::where('slug',$slug)->first()->toArray();
            return $data;
        }
        elseif ($input['type'] === 'edit'){
            $input = $input['cat'];
            $category = Category::find($input['id']);
            $category['name_ru'] = $input['name_ru'];
            $category['name_ro'] = $input['name_ro'];
            $category['name_en'] = $input['name_en'];
            $category['status'] = $input['status'];
            $category->save();
        }
        elseif($input['type'] === 'cat-add'){
            if($request->hasFile('image')){
                $image = $request->file('image');
                $ext = $request->file('image')->getClientOriginalExtension();
                $image = Image::make($image)
                    ->resize(600, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                $image_name = str_random(15);
                $category = new Category;
                $category['image'] = $image_name.'.'.$ext;
                $category['name_ru'] = $input['name_ru'];
                $category['name_ro'] = $input['name_ro'];
                $category['name_en'] = $input['name_en'];
                $category['status'] = $input['status'];
                $category['parent_category'] = 0;
                $category->save();
                $image->save(public_path('/images/categories/'.$image_name.'.'.$ext));
                return ['success'=>'true'];
            }


        }
    }

    public function categoryEditFoto(Request $request)
    {
        $input = $request->all();
        if($request->hasFile('file')){
            $cat_id = $input['id'];
            $image = $request->file('file');
            $ext = $request->file('file')->getClientOriginalExtension();
            $image = Image::make($image)
                ->resize(600, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $image_name = str_random(15);
            $category = Category::find($cat_id);
            $old_image = $category->select('image')->first();
            $category['image'] = $image_name.'.'.$ext;
            $category->save();
            File::Delete(public_path('/images/categories/'.$old_image['image']));
            $image->save(public_path('/images/categories/'.$image_name.'.'.$ext));
        }
    }

    public function deleteCategory(Request $request)
    {
        $input = $request->all();
        $products = Product::where('category_id',$input['id'])->get();
        $data['count'] = count($products);
        if(!count($products)){
            $cat = Category::find($input['id']);
            $cat->delete();
            $data['categories'] = Category::where('parent_category',0)
                ->get()->toArray();
            return $data;
        }else{
            return $data;
        }
    }

    public function categoryAdd(Request $request){
        $input = $request->all();

//        if($request->hasFile('file')){
//            $image = $request->file('file');
//            $ext = $request->file('file')->getClientOriginalExtension();
//            $image = Image::make($image)
//                ->resize(600, null, function ($constraint) {
//                    $constraint->aspectRatio();
//                });
//            $image_name = str_random(15);
//            $category = Category::find($cat_id);
//            $old_image = $category->select('image')->first();
//            $category['image'] = $image_name.'.'.$ext;
//            $category->save();
//            File::Delete(public_path('/images/categories/'.$old_image['image']));
//            $image->save(public_path('/images/categories/'.$image_name.'.'.$ext));
//        }
    }

    public function productsList(Request $request){
        $input = $request->all();
        $lang = $input['lang'];
        $data['products'] = Product::select('id','name_'.$lang.' as name', 'slug','status','category_id')
            ->get()
            ->toArray();
        foreach($data['products'] as &$item){
            $item['cats'] = Category::where('id',$item['category_id'])->select('name_'.$lang.' as name')->first();
        }
        unset($item);
        $data['cat'] = Category::select('id','name_'.$lang.' as name')->get()->toArray();
        return $data;
    }

    public function products(Request $request)
    {
        $input = $request->all();
        $lang = $input['lang'];
        $slug = $input['slug'];
        if($input['type'] === 'get'){
            $data['product'] = Product::where('slug',$slug)->first();
            $data['cat'] = Category::all()->toArray();
            $data['images'] = Product::find($data['product']->id)->images()->get();

                $filters = DB::table('filter_product')->where('product_id',$data['product']->id)->toArray();
                $data['tags'] = $filters;
            return $data;
        }
        else if($input['type'] === 'deleteImage'){

            $product = Product::find($input['id'])->images();
            $product->where('image_thumb',$input['file']['name'])->delete();
            File::Delete(public_path('/images/products/'.$input['file']['name']));


            File::Delete(public_path('/images/products/thumb/thumb_'.$input['file']['name']));

        }
        else if($input['type'] === 'edit'){
            $product = Product::find($input['info']['id']);
            $product->name_ru = $input['info']['name_ru'];
            $product->name_en = $input['info']['name_en'];
            $product->name_ro = $input['info']['name_ro'];
            $product->description_ro = $input['info']['description_ro'];
            $product->description_en = $input['info']['description_en'];
            $product->description_ru = $input['info']['description_ru'];
            $product->extra_description_ro = $input['info']['extra_description_ro'];
            $product->extra_description_en = $input['info']['extra_description_en'];
            $product->extra_description_ru = $input['info']['extra_description_ru'];
            $product->category_id = $input['info']['category_id'];
            $product->price = $input['info']['price'];
            if($input['status']){
                $product->status = 1;
            }else{
                $product->status = 0;
            }

            $product->save();
        }
        else if($input['type'] === 'add'){

            $product = new Product;

            $product->name_ru = $input['info']['name_ru'];
            $product->name_en = $input['info']['name_en'];
            $product->name_ro = $input['info']['name_ro'];
            $product->description_ro = $input['info']['description_ro'];
            $product->description_en = $input['info']['description_en'];
            $product->description_ru = $input['info']['description_ru'];
            $product->extra_description_ro = $input['info']['extra_description_ro'];
            $product->extra_description_en = $input['info']['extra_description_en'];
            $product->extra_description_ru = $input['info']['extra_description_ru'];
            $product->price = $input['info']['price'];
            $product->category_id = $input['category'];
            if($input['status']){
                $product->status = 1;
            }else{
                $product->status = 0;
            }
            $product->save();
            foreach ($input['tag'] as $item){
                DB::table('filter_product')->insert([
                    ['filter_id' => $item,'product_id' => $product->id],
                ]);
            }
            unset($item);
        }
        else if($input['type'] === 'deleteProduct'){
            $product = Product::find($input['id']);
            $images = $product->images();
//            return $images->get();
            if($images->count()){
                foreach ($images->get() as $item){
                    $file = 'images/products/'.$item->image;
                    $file_thumb = 'images/products/thumb/thumb_'.$item->image;
                    if(File::isFile($file)){
                        \File::delete($file);
                        \File::delete($file_thumb);
                    }
                }
                unset($item);
            }
//            $images->each(function ($item, $key ){
//                $allimages[$key] = $item;
//            });
//            return 'false';
            $images->delete();
            $product->delete();

        }
    }

    public function productFotoAdd(Request $request)
    {
        $input = $request->all();
        if($input['type'] === 'add'){
            if($request->hasFile('file')){
                $image = $request->file('file');
                $ext = $request->file('file')->getClientOriginalExtension();
                $image = Image::make($image)
                    ->resize(1200, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                $image_thumb = Image::make($image)
                    ->resize(600, null, function ($constraint) {
                        $constraint->aspectRatio();
                    });
                $image_name = str_random(15);
                $product_image = new Productimage;
                $product_image['image'] = $image_name.'.'.$ext;
                $product_image['image_thumb'] = $image_name.'.'.$ext;
                $product_image['product_id'] = $input['id'];
                $product_image->save();
                $image->save(public_path('/images/products/'.$image_name.'.'.$ext));
                $image_thumb->save(public_path('/images/products/thumb/thumb_'.$image_name.'.'.$ext));
            }
        }

    }
    public function addProductGet(Request $request)
    {
        $input = $request->all();
        $categories = Category::where('status',1)->get();
        $data['categories'] = $categories;
        $filters = Category::find($input['category'])->filters()->select('id','name_'.$input['lang'].' as name','category_id')->get();
        $data['tags'] = $filters;
        return $data;

    }

}
