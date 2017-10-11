<template>
    <div class="wrap">
        <div class="wrap-in">
            <slot></slot>
        </div>
    </div>
</template>
<script>
    export default {

    }
</script>
<style scoped lang="less">
    .wrap{
        display: inline-block;
        padding:3px 0;
        z-index:2;
        position:relative;
        background-color: #fff;
        &:before{
            content:'';
            position:absolute;
            width:100%;
            height:100%;
            border:1px solid black;
            z-index:-1;
            top:0;
            left:-1.5em;
        }
        &-in{
            display: inline-block;
            background-color: #fff;
        }
    }
</style>