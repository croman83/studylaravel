<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
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


}
