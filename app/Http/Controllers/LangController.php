<?php

namespace App\Http\Controllers;
use View;
use Config;
use Auth;
use Redirect;
use LaravelLocalization;
use URL;
use Lang;
use Request;
use App;

class LangController extends Controller
{
    public function changeLangRu()
    {
        App::setLocale('ru');
        return back();
    }

    public function changeLangEn()
    {
        App::setLocale('en');
        return back();
    }

    public function setLocale()
    {
        $addrLOCALE     = Request::segment(1);
        $cfgLOCALE        = Config::get('app.locale');
        $segments         = Request::segments();
        $locales             = LaravelLocalization::getSupportedLocales();
        $locales             = array_keys( $locales );
        $setLocale         = null;

        if ( in_array( $addrLOCALE, $locales ) )
        {
            // локаль в адресе действительна
            // ставим её
            $setLocale = $addrLOCALE;
        }
        else
        {
            // локаль в адресе НЕ действительна
            // ставим дефолтную
            $setLocale = $cfgLOCALE;
        }

        if ( Auth::check() )
        {
            // пользователь авторизован
            // сохраняем в пользователя
            $user = Auth::getUser();
            $user->locale = $setLocale;
            $user->save();
        }

        // ставим локаль в адрес
        if ( !empty( $segments ) && $segments[1] == 'set-language' )
        {
            // ПОПЫТКА (!) уйти туда же откуда и пришли, заменив язык в адресе
            // TODO: не совсем уместно, но на уровне REST'a проблем возникнуть не должно
            $lc = implode('|',$locales);
            $back = URL::previous();
            $back = preg_replace( "#/([".$lc."].)#iu", "/{$setLocale}", $back );
            return Redirect::secure( $back );
        }
        else
        {
            // простой переход на главную страницу
            return Redirect::secure( '/'.$setLocale );
        }
    }
}
