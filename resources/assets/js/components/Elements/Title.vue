<template>
    <div class="wrap" :class="{'square':square,'center':center}">
        <div class="wrap-in">
            <slot></slot>
        </div>
    </div>
</template>
<script>
    export default {
        props:{
            center:{
                default:false
            },
            square:{
                default:false
            }
        }
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
        &.square:after{
            content:'';
            width:15px;
            height: 15px;
            background-color: #ff99cc;
            position: absolute;
            top:1px;
            left:~'calc(-1.5em + 1px)';
        }
        &-in{
            display: inline-block;
            background-color: #fff;
        }
    }
</style>