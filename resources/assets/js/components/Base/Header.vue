<template>
    <header class="header">
        <div class="header-logo">
            <router-link to="/">
                <img src="/img/logo.png" alt="">
                <span>CuDrag</span>
            </router-link>
        </div>
        <div class="header-right">
            <div class="header-menu" @click="show">
                <span>{{ $t('menu.menu') }}</span>
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 width="50px" height="30px" viewBox="0 0 344.339 344.339" style="enable-background:new 0 0 344.339 344.339;"
                 xml:space="preserve">
                <g>
                    <rect y="46.06" width="344.339" height="29.52"/>
                </g>
                <g>
                    <rect y="156.506" width="344.339" height="29.52"/>
                </g>
                <g>
                    <rect y="268.748" width="344.339" height="29.531"/>
                </g>
            </svg>
            </div>
        </div>
        <transition name="fadeup" mode="out-in" >
            <app-menu v-if="showmenu"
                      @closemenu="hide"
                      v-click-out-side="hide"></app-menu>
        </transition>
    </header>
</template>
<script>
    import Lang from './Lang';
    import Menu from './Menu';
    import ClickOutside from 'vue-click-outside'
    export default {
        data(){
            return {
                showmenu:false,
            }
        },
        methods:{
            hide(){
                this.showmenu = false;
            },
            show(){
                this.showmenu = true;
            }
        },
        components:{
            appLang:Lang,
            appMenu:Menu,
        },
        directives:{
            clickOutSide:ClickOutside,
        },
        mounted(){
            this.popupItem = this.$el;
        }
    }
</script>