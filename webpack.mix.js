let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.js('resources/assets/js/app.js', 'public/js')
    .version()
    .less('resources/assets/less/app.less', 'public/css')
    .version()
    .browserSync({
        proxy: 'studylaravel.dev'
    });

mix.js('resources/assets/adminjs/admin.js', 'public/js')
    .version()
    .less('resources/assets/less/admin.less', 'public/css')
    .version();