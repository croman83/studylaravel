
window.Vue = require('vue');
require('./bootstrap');


import Vuex from 'vuex';
Vue.use(Vuex);

import VueRouter from 'vue-router'
Vue.use(VueRouter);

import VueHead from 'vue-head';
Vue.use(VueHead);

import VueI18n from 'vue-i18n';
Vue.use(VueI18n);


const { locale, translations } = window.config

const i18n = new VueI18n({
    locale,
    messages: {
        [locale]: translations
    }
})

Vue.config.productionTip = false;

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// Vue.component('App', require('./components/App.vue'));
import Main from './components/Main.vue'
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'
import PageNotFound from './components/PageNotFound.vue'



import store from './store';


const Home1 = { template: '<div><a href="/foo">bar</a>home</div>' }
const Foo1 = { template: '<div><router-link to="test">test</router-link></a>Foo</div>' }
const Bar1 = { template: '<div>Bar</div>' }



const router = new VueRouter({
    mode: 'history',
    base: locale,
    routes: [
        { path: `/`, component: Main },
        { path: '/foo', component: Foo1 },
        { path: '/bar', component: Bar1 },
        { path: '/test', component: Home1 },
        { path: '/{any}/*', component: PageNotFound },
    ]
});

const app = new Vue({
    router,
    i18n,
    store,
    components:{
        appHeader:Header,
        appFooter:Footer,
    }
    }).$mount('#app');
