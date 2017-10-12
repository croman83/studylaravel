<template>
    <div class="np">
        <el-title :center="true" :square="true">
            <h2 class="np-title">{{ $t('new_products') }}</h2>
        </el-title>
        <div class="np-wrap container">
            <div class="np-ram">
                <div class="block" v-for="(item,index) in categories">
                    <el-ramka :key="'ctg'+index">
                        <div class="block-in" :style="{backgroundImage:'url(/images/'+item.img+')'}">

                        </div>
                        <h4 class="block-title" v-text="item.name"></h4>
                    </el-ramka>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                categories:[
                    {
                        img:'1.jpg',
                        link:'#',
                        name:'Wedding'
                    },
                    {
                        img:'2.jpg',
                        link:'#',
                        name:'Events'
                    },
                    {
                        img:'3.jpg',
                        link:'#',
                        name:'Decor'
                    },
                    {
                        img:'2.jpg',
                        link:'#',
                        name:'Paper'
                    },
                ]
            }
        },
        components:{
            elTitle: require('./Title'),
            elRamka: require('./Ramka'),
        }
    }
</script>
<style lang="less" scoped>
    .np{
        text-align: center;
        &-title{
            margin:0;
            font-weight:100;
            font-size:30px;
            text-transform: uppercase;
            line-height:1.2;
        }
        &-wrap{
            text-align:left;
            margin:50px auto;
            .block{
                width:25%;
                padding:15px;
                cursor: pointer;
                &:hover{
                    .block-in{
                        filter:blur(2px);
                    }
                    .block-title{
                        box-shadow: 0 0 20px 20px #fff;
                    }
                }
                &-in{
                    background-repeat:no-repeat;
                    background-position: center;
                    background-size:cover;
                    height: 320px;
                    position: relative;
                    transition:all 0.5s;
                }
                &-title{
                    font-size:30px;
                    transition:all 0.5s;
                    margin:0;
                    font-weight: 300;
                    background-color: #fff;
                    position: absolute;
                    bottom:25%;
                    right:0;
                    text-align: center;
                    line-height:1.2;
                    z-index:2;
                }
            }
        }
        &-ram{
            display: flex;
            flex-flow:row wrap;
            justify-content: center;
            position: relative;
            height:385px;
            z-index:1;
            &:after{
                content:'';
                width:~'calc(100% - 45px)';
                height:~'calc(100% - 45px)';
                background-color: #fff;
                top:20px;
                left:20px;
                position:absolute;
                z-index:-2;
            }
            &:before{
                content:'';
                width:~'calc(100% - 55px)';
                height:~'calc(100% - 55px)';
                border:1px solid black;
                top:45px;
                left:45px;
                position:absolute;
                z-index:-2;
            }
        }
    }
</style>
