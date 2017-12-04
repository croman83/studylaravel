require('./bootstrap');

window.Vue = require('vue');
Vue.config.productionTip = false;

import Vuex from 'vuex';
Vue.use(Vuex);
import store from './store';

import VueRouter from 'vue-router'
Vue.use(VueRouter);

import VueI18n from 'vue-i18n';
Vue.use(VueI18n);

let token = document.head.querySelector('meta[name="csrf-token"]');
var VueResource = require('vue-resource');
Vue.use(VueResource);
// Vue.http.headers.common['X-CSRF-TOKEN'] = token;
Vue.http.interceptors.push(function(request, next) {
    request.headers.set('X-CSRF-TOKEN', token.content);
    next();
});
Vue.http.headers.common['Access-Control-Allow-Origin'] = '*';


import ElementUI from 'element-ui';
import 'element-ui/lib/theme-default/index.css';
import ruLocale from 'element-ui/lib/locale/lang/en';

import localeEl from 'element-ui/lib/locale';
localeEl.use(ruLocale);
Vue.use(ElementUI,{ruLocale});

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



import AHeader from './components/AHeader.vue'
import Loading from './components/Loading.vue'
import Sidebar from './components/Sidebar.vue'
import PageNotFound from './components/PageNotFound.vue'

import Dashboard from './components/mainpages/Dashboard.vue'
import Settings from './components/mainpages/Settings.vue'
import Translator from './components/mainpages/Translator.vue'
import Categories from './components/mainpages/Categories.vue'
import Category from './components/mainpages/OneCategory.vue'
import AddCategory from './components/mainpages/AddCategory.vue'
import ProductsList from './components/mainpages/ProductsList.vue'
import Product from './components/mainpages/Product.vue'







const router = new VueRouter({
    mode: 'history',
    base: locale + '/admin',
    routes: [
        { path: `/`, component: Dashboard },
        { path: '/settings', component: Settings },
        { path: '/translate', component: Translator },
        { path: '/categories', component: Categories,name:'categories' },
        { path: '/categories/add', component: AddCategory,name:'addcategory' },
        { path: '/categories/:slug', component: Category, props:true , name:'category' },
        { path: '/products', component: ProductsList, props:true , name:'products-list' },
        { path: '/products/:slug', component: Product, props:true , name:'product' },
        { path: '/*', component: PageNotFound },
    ]
});



const app = new Vue({
    router,
    i18n,
    store,
    components:{
        appHeader:AHeader,
        loading:Loading,
        sideBar:Sidebar,
    },
    mounted(){
        this.$loading = this.$refs.loading;
    }
}).$mount('#admin');

router.beforeEach((to, from, next) => {
    router.app.$loading.start();
    next()
});
router.afterEach((to, from) => {
    router.app.$loading.finish()
})