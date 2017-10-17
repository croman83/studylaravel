
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

import {Pagination, PaginationEvent} from 'vue-pagination-2';
Vue.component('pagination', Pagination);

let token = document.head.querySelector('meta[name="csrf-token"]');
var VueResource = require('vue-resource');
Vue.use(VueResource);
// Vue.http.headers.common['X-CSRF-TOKEN'] = token;
Vue.http.interceptors.push(function(request, next) {
    request.headers.set('X-CSRF-TOKEN', token.content);
    next();
});
Vue.http.headers.common['Access-Control-Allow-Origin'] = '*';

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

import Header from './components/Base/Header.vue'
import Footer from './components/Base/Footer.vue'
import Loading from './components/Elements/Loading.vue'
import Dots from './components/Elements/Dots.vue'

import Main from './components/Pages/Main.vue'
import Categories from './components/Pages/Categories.vue'
import PageNotFound from './components/Pages/PageNotFound.vue'
import OneCategory from './components/Pages/OneCategory.vue'



import store from './store';


const Home1 = { template: '<div><a href="/foo">bar</a>home</div>' }
const Foo1 = { template: '<div><router-link to="test">test</router-link></a>Foo</div>' }
const Bar1 = { template: '<div>Bar</div>' }



const router = new VueRouter({
    mode: 'history',
    base: locale,
    routes: [
        { path: `/`, component: Main },
        { path: '/category', component: Categories },
        { path: '/category/:slug', component: OneCategory, props:true , name:'category' },
        { path: '/product/:slug', component: OneCategory, props:true , name:'product' },
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
        loading:Loading,
        appDots:Dots,
    },
    mounted(){
        this.$loading = this.$refs.loading;
    }
    }).$mount('#app');


router.beforeEach((to, from, next) => {
    router.app.$loading.start();
    router.app.$refs.header.hide();
    setTimeout(next,300);
});
router.afterEach((to, from) => {
    router.app.$loading.finish();
    setTimeout(function () {
        router.app.$refs.dots.makeDots();
    },700)
});




window.Vue.directive('Clickoutside',{
    bind: function(el, binding, vNode) {
        // Provided expression must evaluate to a function.
        if (typeof binding.value !== 'function') {
            const compName = vNode.context.name
            let warn = `[Vue-click-outside:] provided expression '${binding.expression}' is not a function, but has to be`
            if (compName) { warn += `Found in component '${compName}'` }

            console.warn(warn)
        }
        // Define Handler and cache it on the element
        const bubble = binding.modifiers.bubble
        const handler = (e) => {
            if (bubble || (!el.contains(e.target) && el !== e.target)) {
                binding.value(e)
            }
        }
        el.__vueClickOutside__ = handler

        // add Event Listeners
        document.addEventListener('click', handler)
    },

    unbind: function(el, binding) {
        // Remove Event Listeners
        document.removeEventListener('click', el.__vueClickOutside__)
        el.__vueClickOutside__ = null

    }
});

