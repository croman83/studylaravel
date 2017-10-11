<template>
    <div class="base">
        <div class="sliderMain-menu">
            <el-title><h4 class="title">{{ $t('we_done') }}</h4></el-title>
            <ul class="ul">
                <li v-for="(item,index) in slider"
                    :class="{active:index === slider_index}"
                    @click="changeSlide(index)">
                    <span>{{ item.name }}</span>
                </li>
            </ul>
        </div>
        <div class="sliderMain-wrapper">
            <div class="sliderMain">
                <el-ramka v-for="(item,index) in slider" :key="'slide' + index">
                    <div :style="{backgroundImage : 'url(/images/' + item.img + ')'}" class="sliderMain-slide">
                        <router-link to="" class="sliderMain-title">{{ item.title }}</router-link>
                    </div>
                </el-ramka>
            </div>
        </div>
    </div>
</template>
<script>
    import { tns } from 'tiny-slider/src/tiny-slider.module';
    import ramka from './Ramka';
    import titl from './Title';
    var sliderMain;
    export default {
        data(){
            return {
                slider:[
                    {
                        title:'This is the best wedding',
                        img:'1.jpg',
                        link:'#',
                        name:'Wedding'
                    },
                    {
                        title:'This is the best event',
                        img:'2.jpg',
                        link:'#',
                        name:'Events'
                    },
                    {
                        title:'This is the best decor',
                        img:'3.jpg',
                        link:'#',
                        name:'Decor'
                    }
                ],
                slider_index:0,
            }
        },
        methods:{
            initSlider(){
                sliderMain = tns({
                    "container": '.sliderMain',
                    "items": 1,
                    "slideBy": 'page',
                    "autoplay": false,
                    "controls":false,
                    "nav":false,
                    "gutter":30,
                    "loop":false,
//                    "animateOut": "rollOut",
//                    "speed": 1000,
                });
            },
            changeSlide(index){
                sliderMain.goTo(index);
            },
            currentIndex(){
                var _self = this;
                sliderMain.events.on('indexChanged', function (info) {
                    _self.slider_index = info.index;
                    console.log(info)

                });
            },
            
        },
        components:{
            elRamka:ramka,
            elTitle:titl,
        },
        mounted(){
            this.initSlider();

            this.currentIndex();
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
    .base{
        display: flex;
        flex-flow:row nowrap;
        justify-content: space-between;
        align-items: center;
        width:90%;
        max-width:1480px;
        margin:50px auto;
    }
    .sliderMain{
        &-wrapper{
            width:70%;
        }
        &-slide{
            height:580px;
            background-position: center;
            background-repeat:no-repeat;
            background-size:cover;
            position: relative;
            pointer-events: all;
        }
        &-menu{
            .title{
                font-size:18px;
                text-transform:uppercase;
                font-weight:300;
                margin:0;
                line-height:1;
            }
            .ul{
                margin:25px 0;
                padding:0;
                list-style:none;
                li{
                    font-size:18px;
                    font-weight:300;
                    margin:12px 0;
                    cursor:pointer;
                    &.active{
                        span{
                            background-color: #ff99cc;
                        }
                    }
                }
            }
        }
        &-title{
            font-family:'Gabriela', serif;
            font-size:40px;
            line-height:1.2;
            padding:3px 10px;
            background-color: #fff;
            position: absolute;
            top:20%;
            right:0;
            color:black;
            text-align: center;
            z-index:2;
            &:before{
                content:'-';
            }
        }
    }
</style>