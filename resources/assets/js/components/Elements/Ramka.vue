<template>
    <div class="ramka">
        <div class="ramka-in">
            <div class="ramka-out">
                <slot></slot>
            </div>
        </div>
    </div>
</template>
<script>
    export default {

    }
</script>
<style lang="less" scoped>
    .ramka{
        position: relative;
        padding:16px;
        &-out{
            position: relative;
            top:15px;
            left:15px;
            pointer-events: none;
            filter:saturate(2);
            &:before{
                content:'';
                position: absolute;
                width:100%;
                height: 100%;
                display: block;
                left:-15px;
                top:-15px;
                border:1px solid black;
                z-index:1;
                background-color: rgba(255,255,255,0.25);
            }
        }
        &-in{
            position:relative;
            top:-15px;
            left:-15px;
            &:before{
                content:'';
                width:25px;
                height:25px;
                display: block;
                position: absolute;
                top:0;
                left:0;
                background-color: #ff99cc;
            }
            &:after{
                content:'';
                width:25px;
                height:25px;
                display: block;
                position: absolute;
                bottom:1px;
                right:1px;
                background-color: #ff99cc;
            }
        }
    }
</style>