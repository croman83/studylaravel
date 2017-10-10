<template>
    <header class="header">
        <div class="header-left">
            <i class="el-icon-menu header-icon" @click="collapseMenu"></i>
        </div>
        <div class="header-right">
            <div class="header-lang">
                <a href="/ru/set-language">RU</a>
                <a href="/ro/set-language">RO</a>
                <a href="/en/set-language">EN</a>
            </div>
            <div class="header-user">
                <b v-text="name"></b>
            </div>
            <div class="header-logout">
                <a href="/logout" ><img src="/img/logout.svg" alt=""></a>
            </div>
        </div>
    </header>
</template>
<script>
    import store from './../store';
    export default {
        props:['name'],
        methods:{
            collapseMenu(){
                if(this.menuState){
                    store.commit('collapseMenu',false);
                }else{
                    store.commit('collapseMenu',true)
                }
            }
        },
        computed:{
            menuState(){
                return store.state.menuCollapse
            }
        }
    }
</script>