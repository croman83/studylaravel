<?php

// POST routes
Route::post('/list-products' ,'ApiController@getCategoryProducts');
Route::post('/product-details' ,'ApiController@getProductDetails');
Route::post('/get-services' ,'ApiController@getServices');

//



Route::group(['prefix' => LaravelLocalization::setLocale(),'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]], function() {
    Route::get('/', 'ViewController@index')->name('main');
    Route::get( 'set-language', [ 'as' => 'set-language', 'uses' => 'LangController@setLocale' ] );
    Route::post('get-categories' ,'ViewController@getCategories');


// Authentication Routes...
    Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
    Route::post('login', 'Auth\LoginController@login');
    Route::get('/logout', 'Auth\LoginController@logout')->name('logout');

// Registration Routes...
    Route::match(['get', 'post'], 'register', function () {
        return redirect('/');
    });
//    Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
//    Route::post('register', 'Auth\RegisterController@register');

// Password Reset Routes...
    Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
    Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('password/reset', 'Auth\ResetPasswordController@reset');


// admin routes
    Route::post('admin/translate/save', 'HomeController@translateSave');
    Route::post('admin/get-categories', 'HomeController@getCategories');
    Route::post('admin/delete-category', 'HomeController@deleteCategory');
    Route::post('admin/categories/foto', 'HomeController@categoryEditFoto');
    Route::post('admin/categories/add/foto', 'HomeController@categoryAddPhoto');
    Route::post('admin/categories/{slug}', 'HomeController@categoryInfo');
    Route::post('admin/get-products', 'HomeController@productsList');
    Route::post('admin/products/get-datacat', 'HomeController@addProductGet');
    Route::post('admin/products/foto', 'HomeController@productFotoAdd');
    Route::post('admin/products/{slug}', 'HomeController@products');


    Route::get('/admin/{vue?}','HomeController@index' )->where('vue', '[\/\w\.-]*')->name('admin');




// client routes
    Route::get('/{vue?}','ViewController@index')->where('vue', '[\/\w\.-]*');
});