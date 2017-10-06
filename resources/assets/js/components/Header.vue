<template>
    <div>
        <h2 v-text="$t('header')"></h2>
        <app-lang></app-lang>
        <div><a href="/login">Login</a></div>
    </div>
</template>
<script>
    import Lang from './Lang';
    export default {
        components:{
            appLang:Lang,
        }
    }
</script>