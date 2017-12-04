<template>
    <div class="">
        <el-menu :default-active="currentActive"
                 class="el-menu-vertical-demo"
                 :router="true"
                 :collapse="isCollapse">
            <el-menu-item index="/">
                <i class="el-icon-menu"></i>
                <span slot="title">{{ $t('menu.dashboard') }}</span>
            </el-menu-item>
            <el-submenu index="2">
                <template slot="title">
                    <i class="el-icon-menu"></i>
                    <span slot="title">{{ $t('menu.catalog') }}</span>
                </template>
                <el-menu-item-group>
                    <span slot="title">{{ $t('menu.catalog') }}</span>
                    <el-menu-item index="/categories">{{ $t('menu.category') }}</el-menu-item>
                    <el-menu-item index="/tags">{{ $t('menu.tags') }}</el-menu-item>
                    <el-menu-item index="/products">{{ $t('menu.products') }}</el-menu-item>
                </el-menu-item-group>
                <el-menu-item-group :title="$t('menu.services')">
                    <el-menu-item index="2-3">item three</el-menu-item>
                </el-menu-item-group>
                <el-submenu index="2-4">
                    <span slot="title">item four</span>
                    <el-menu-item index="2-4-1">item one</el-menu-item>
                </el-submenu>
            </el-submenu>
            <el-menu-item index="/translate">
                <i class="el-icon-fa-globe"></i>
                <span slot="title">{{ $t('menu.translate') }}</span>
            </el-menu-item>
            <el-menu-item index="/settings">
                <i class="el-icon-setting"></i>
                <span slot="title">{{ $t('menu.settings') }}</span>
            </el-menu-item>
        </el-menu>
    </div>
</template>
<script>
    import store from '../store';
    export default {
        store,
        data(){
            return {
                currentActive:'',
            }
        },
        computed:{
            isCollapse(){
                return store.state.menuCollapse;
            },

        },
        mounted(){
            this.currentActive = this.$router.currentRoute.path;

        }

    }
</script>