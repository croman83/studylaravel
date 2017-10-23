<?php

namespace App;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;

class Category extends Model

{
    use Sluggable;
    protected $table = 'categories';
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'name_en'
            ]
        ];
    }
    public function products()
    {
        return $this->hasMany('App\Product');
    }
    public function filters(){
        return $this->hasMany('App\Filter');
    }
}
