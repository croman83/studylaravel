<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Product extends Model
{
    use Sluggable;
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'name_en'
            ]
        ];
    }
    public function category()
    {
        return $this->belongsTo('App\Category');
    }
    public function images(){
        return $this->hasMany('App\Productimage');
    }
    public function filters(){
        return $this->hasMany('App\Filter');
    }
}
