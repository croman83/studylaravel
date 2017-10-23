<template>
    <ul class="breadcrumbs" :class="itemClass">
        <li>
            <router-link :to="{name:'home'}">{{ $t('menu.main') }}</router-link>
        </li>
        <slot></slot>
    </ul>
</template>
<script>
    export default {
        props:['itemClass']
    }
</script>
