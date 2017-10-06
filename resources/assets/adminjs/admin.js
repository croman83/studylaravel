

require('./bootstrap');

window.Vue = require('vue');
Vue.config.productionTip = false;

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// Vue.component('App', require('./components/App.vue'));
// import App from './components/App.vue'

if( document.getElementById('admin') ){
    const app = new Vue({
        el: '#admin',
        components:{
            // 'apps':App,
        },
        mounted(){
            console.log('app mounted')
        }
    });
}
