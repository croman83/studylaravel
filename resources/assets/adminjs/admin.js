require('./bootstrap');

window.Vue = require('vue');
Vue.config.productionTip = false;

import Vuex from 'vuex';
Vue.use(Vuex);

import VueRouter from 'vue-router'
Vue.use(VueRouter);

import VueI18n from 'vue-i18n';
Vue.use(VueI18n);

// import store from './store';

const { locale, translations } = window.config

const i18n = new VueI18n({
    locale,
    messages: {
        [locale]: translations
    }
})

Vue.config.productionTip = false;

// Vue.component('App', require('./components/App.vue'));

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-default/index.css';
import Main from './components/AMain.vue'
import AHeader from './components/AHeader.vue'
// import Footer from './components/Footer.vue'
// import PageNotFound from './components/PageNotFound.vue'
Vue.use(ElementUI);





const Home1 = { template: '<div><a href="/foo">bar</a>home</div>' }
const Foo1 = { template: '<div><router-link to="test">test</router-link></a>Foo</div>' }
const Bar1 = { template: '<div>Bar</div>' }



const router = new VueRouter({
    mode: 'history',
    base: locale + '/admin',
    routes: [
        { path: `/`, component: Main },
        { path: '/foo', component: Foo1 },
        { path: '/bar', component: Bar1 },
        { path: '/test', component: Home1 },
        // { path: '/{any}/*', component: PageNotFound },
    ]
});

// const app = new Vue({
//     router,
//     i18n,
//     store,
//     components:{
//         appHeader:Header,
//         appFooter:Footer,
//     }
// });


if( document.getElementById('admin') ){
    const app = new Vue({
        router,
        i18n,
        // store,
        components:{
            appHeader:AHeader,
        }
    }).$mount('#admin');
}