<template>
    <div class="header-lang">
        <ul>
            <li v-for="item in langset"
                :class="{active:item === lang}">
                <a :href="'/'+item+'/set-language'">{{item}}</a>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                lang: window.config.locale,
                langset:['ru','en','ro']
            }
        }
    }
</script>