<template>
    <div class="header-fix">
        <div class="header-fix_up">
            <app-lang></app-lang>
            <div class="close" @click="closemenu">
                <span>{{ $t('menu.close') }}</span>
                <svg version="1.1" width="25px" height="25px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                    <g>
                        <path d="M505.943,6.058c-8.077-8.077-21.172-8.077-29.249,0L6.058,476.693c-8.077,8.077-8.077,21.172,0,29.249
                            C10.096,509.982,15.39,512,20.683,512c5.293,0,10.586-2.019,14.625-6.059L505.943,35.306
                            C514.019,27.23,514.019,14.135,505.943,6.058z"/>
                    </g>
                    <g>
                        <path d="M505.942,476.694L35.306,6.059c-8.076-8.077-21.172-8.077-29.248,0c-8.077,8.076-8.077,21.171,0,29.248l470.636,470.636
                            c4.038,4.039,9.332,6.058,14.625,6.058c5.293,0,10.587-2.019,14.624-6.057C514.018,497.866,514.018,484.771,505.942,476.694z"/>
                    </g>
                </svg>
            </div>
        </div>
        <div class="header-fix_down">
            <ul>
                <li>
                    <router-link class="first" to="/">{{ $t('menu.main') }}</router-link>
                </li>
                <li @mouseenter="showUl($event)"
                    @mouseleave="hideUl($event)"
                    >
                    <router-link class="first" to="/category">{{ $t('menu.catalog') }}</router-link>
                    <div class="inner">
                        <div class="inner-wrapper">
                            <ul class="inner-ul">
                                <li v-for="(item,index) in categories"
                                    v-if="item.parent_category === 0">
                                    <router-link :to="{name:'category',params:{slug:item.slug}}">{{ item.name }}</router-link>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li @mouseenter="showUl($event)"
                    @mouseleave="hideUl($event)">
                    <router-link class="first" :to="{name:'service'}">{{ $t('menu.service') }}</router-link>
                    <div class="inner">
                        <div class="inner-wrapper">
                            <ul class="inner-ul">
                                <li v-for="(item,index) in categories" v-if="item.parent_category === 1">
                                    <router-link :to="{name:'services',params:{slug:item.slug}}">{{ item.name }}</router-link>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <router-link class="first" to="/test">{{ $t('menu.works') }}</router-link>
                </li>
                <li>
                    <router-link class="first" to="/about">{{ $t('menu.about') }}</router-link>
                </li>
                <li>
                    <router-link class="first" to="/contacts">{{ $t('menu.contacts') }}</router-link>
                </li>
                <li>
                    <router-link class="first" to="/partners">{{ $t('menu.partners') }}</router-link>
                </li>
            </ul>
        </div>
    </div>
</template>
<script>
    import Lang from './Lang';
    export default {
        data(){
          return {
              categories:JSON.parse(config.categories)
          }
        },
        methods:{
            closemenu(){
                this.$emit('closemenu');
            },
            showUl(event){
                var e = event || window.event;
                var el = e.currentTarget;
                var ul = el.querySelector('.inner');
                if(ul){
                    Velocity(ul,'slideDown',{
                        duration:200,
                    });

                }
            },
            hideUl(event){
                var e = event || window.event;
                var el = e.currentTarget;
                var ul = el.querySelector('.inner');
                if(ul){
                    Velocity(ul,'slideUp',{
                        duration:200,
                    });
                }
            }
        },
        components:{
            appLang:Lang,
        },
    }
</script>