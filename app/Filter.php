<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Filter extends Model
{
    //

    public function products()
    {
        return $this->belongsToMany('App\Product');
    }

    public function categories()
    {
        return $this->belongsToMany('App\Category');
    }
}
