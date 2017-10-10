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

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-default/index.css';
Vue.use(ElementUI);

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







const router = new VueRouter({
    mode: 'history',
    base: locale + '/admin',
    routes: [
        { path: `/`, component: Dashboard },
        { path: '/settings', component: Settings },
        { path: '/translate', component: Translator },
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