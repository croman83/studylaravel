<template>
    <div class="product-slider">
        <div id="product-slider">
            <div v-for="(item,index) in images"
                 :data-src="'/images/products/'+item.image"
                 :key="'products-slide-'+index">
                <div class="product-slider_item"
                     :style="{backgroundImage:'url(/images/products/'+item.image+')'}"></div>
            </div>
        </div>
        <div class="product-slider_bottom">
            <div id="product-slider_bottom">
                <div v-for="(item,index) in images"
                     :key="'products-slide-image'+index"
                     class="bottom-slider"
                     :style="{backgroundImage:'url(/images/products/'+item.image+')'}"
                ></div>
            </div>
        </div>
    </div>
</template>
<script>
    import { tns } from 'tiny-slider/src/tiny-slider.module';
    var slider;
    export default {
        props:['images'],
        watch:{
            images(val){
                var _self = this;
                setTimeout(this.initSlider,100)
            }
        },
        methods:{
            initSlider(){
                slider = tns({
                    "container": "#product-slider",
                    "items": 1,
                    "slideBy": 'page',
                    "navContainer":'#product-slider_bottom',
                    "autoplay": false,
                    "controls":false,
                    loop:false,
                });
                var el = document.querySelector('.product-slider');
                el.style.opacity = 1;
                lightGallery(document.getElementById('product-slider'),{
                    download:false,
//                    fullscreen:false,
                });
            }
        },
        mounted(){

        }
    }
</script>
<style lang="scss">
    .tns-outer {
        padding: 0 !important; // remove padding: clientWidth = width + padding (0) = width
        [hidden] { display: none !important; }
        [aria-controls], [data-action] { cursor: pointer; }
        &.ms-touch {
            overflow-x: scroll;
            overflow-y: hidden;
            -ms-overflow-style: none; // Hides the scrollbar.
            -ms-scroll-chaining: none; // Prevents Metro from swiping to the next tab or app.
            -ms-scroll-snap-type: mandatory; // Forces a snap scroll behavior on your images.
            -ms-scroll-snap-points-x: snapInterval(0%, 100%); // Defines the y and x intervals to snap to when scrolling.
        }
    }
    .tns-slider {
        -webkit-transition: all 0s;
        -moz-transition: all 0s;
        transition: all 0s;
        > .tns-item {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    }

    .tns-horizontal.tns-subpixel {
        white-space: nowrap;
        > .tns-item {
            display: inline-block;
            vertical-align: top;
            white-space: normal;
        }
    }
    .tns-horizontal.tns-no-subpixel {
        &:after {
            content: '';
            display: table;
            clear: both;
        }
        > .tns-item {
            float: left;
            margin-right: -100%;
        }
    }
    .tns-no-calc {
        position: relative;
        left: 0;
    }

    .tns-gallery {
        position: relative;
        left: 0;
        // overflow: hidden;
        > .tns-item {
            position: absolute;
            left: -100%;
            -webkit-transition: opacity 0s;
            -moz-transition: opacity 0s;
            -webkit-transition: transform 0s, opacity 0s;
            -moz-transition: transform 0s, opacity 0s;
            transition: transform 0s, opacity 0s;
        }
    }
    .tns-lazy-img {
        -webkit-transition: opacity 0.6s;
        -moz-transition: opacity 0.6s;
        transition: opacity 0.6s;
        opacity: 0.6;
        &.loaded { opacity: 1; }
    }
    .tns-ah {
        -webkit-transition: height 0s;
        -moz-transition: height 0s;
        transition: height 0s;
    }
    .tns-ovh { overflow: hidden; }
    .tns-hdx { overflow-x: hidden; }
    .tns-hdy { overflow-y: hidden; }
    .tns-visually-hidden { position: absolute; left: -10000em; }
    .tns-transparent { opacity: 0; visibility: hidden; }

    .tns-fadeIn {
        opacity: 1;
        filter: alpha(opacity=100);
        z-index: 0;
    }
    .tns-normal, .tns-fadeOut {
        opacity: 0;
        filter: alpha(opacity=0);
        z-index: -1;
    }
</style>
<style lang="less" scoped>
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/variables.less";

    .product{
        &-slider{
            opacity:0;
            width:450px;
            grid-column: 1;
            grid-row:2 /span 4;
            margin-bottom:50px;
            &_item{
                height:520px;
                background-repeat:no-repeat;
                background-position: center;
                background-size:cover;
                cursor: pointer;
            }
            &_bottom{
                position: relative;
                &:after{
                    content:'';
                    right:-8px;
                    bottom:1px;
                    background-color: @color-pink;
                    position: absolute;
                    display:block;
                    .size(15px);
                    z-index:1
                }
            }
        }
    }
    #product-slider_bottom{
        .flex(row,wrap,flex-start,flex-start);
        width:~'calc(100% + 18px)';
        margin:0 -9px;
        position: relative;
        background-color: #fff;
        z-index:1;
        &:before{
            content:'';
            width:~'calc(100% - 20px)';
            height:~'calc(100% - 20px)';
            position: absolute;
            border:1px solid black;
            top:20px;
            right:0;
            z-index:-1;
        }
        &:after{
            content:'';
            position:absolute;
            width: ~'calc(100% - 10px)';
            height: ~'calc(100% - 10px)';
            background-color: #fff;
            z-index: -1;
            left: 5px;
            top: 5px;
        }
        .bottom-slider{
            width:~'calc(25% - 18px)';
            height: 100px;
            background-repeat:no-repeat;
            background-position: center;
            background-size:cover;
            margin:9px;
            outline:none;
            border:2px solid #dbdbdb;
            cursor: pointer;
            &.tns-nav-active{
                border-color:black;
            }
        }
    }
</style>