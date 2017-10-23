<template>
    <header class="header">
        <div class="header-logo">
            <router-link to="/">
                <img src="/img/logo.png" alt="">
                <span>CuDrag</span>
            </router-link>
        </div>
        <div class="header-right">
            <div class="header-wish" :class="{active:favoritsLength > 0}">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     width="30px" height="30px" viewBox="-50 -50 610 610" style="enable-background:new -50 -50 510 510;" xml:space="preserve">
                    <g>
                        <path d="M255,489.6l-35.7-35.7C86.7,336.6,0,257.55,0,160.65C0,81.6,61.2,20.4,140.25,20.4c43.35,0,86.7,20.4,114.75,53.55
                            C283.05,40.8,326.4,20.4,369.75,20.4C448.8,20.4,510,81.6,510,160.65c0,96.9-86.7,175.95-219.3,293.25L255,489.6z"/>
                    </g>
                </svg>
                <div class="count" v-if="favoritsLength > 0">{{ favoritsLength }}</div>
            </div>
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
        <transition name="faderouterfront">
            <div class="header-layout"
                 @click="hide"
                 v-if="showmenu"></div>
        </transition>
        <transition mode="out-in"
                    :css="false"
                    v-on:leave="menuLeave"
                    v-on:enter="menuEnter">
            <app-menu v-if="showmenu"
                      @closemenu="hide"
                      v-click-out-side="hide"></app-menu>
        </transition>
    </header>
</template>
<script>
    import Lang from './Lang';
    import Menu from './Menu';
    import ClickOutside from 'vue-click-outside';
    export default {
        data(){
            return {
                showmenu:false,
                favorits:this.$store.state.favorits,
            }
        },
        computed:{
            favoritsLength(){
                return this.favorits.length;
            }
        },
        methods:{
            hide(){
                this.showmenu = false;
            },
            show(){
                this.showmenu = true;
            },
            menuEnter(el,done){
                Velocity(el,{
                    translateY:['0%','-100%'],
                },{
                    duration:300
                }).then(function () {
                    done()
                })
            },
            menuLeave(el,done){
                Velocity(el,{
                    translateY:['-100%','0%'],
                },{
                    duration:300
                }).then(function () {
                    done()
                })
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
            var _store = this;

            this.$store.watch(
                function (state) {
                    return state.favorits;
                },
                function () {
                    _store.favorits = _store.$store.state.favorits
                },
                {
                    deep: true
                }
            );
        }
    }
</script>