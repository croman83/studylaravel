<template>
    <div class="prt container">
        <e-title :square="true">
            <router-link to="/partners"><h4 class="prt-title">{{ $t('our_partners') }}</h4></router-link>
        </e-title>
        <div class="prt-wrap">
            <div class="prt-block"
                 :class="makeCol(index)"
                 v-for="(item,index) in partners" >
                <e-ramka>
                    <div class="img" :style="{backgroundImage:'url(/images/'+item.img+')'}"></div>
                </e-ramka>
                <div class="text">
                    <a :href="item.link" class="title">{{ item.title }}</a>
                    <div class="text-in">{{ item.text }}</div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                partners:[
                    {
                        title:'Cudrag.md',
                        img:'1.jpg',
                        link:'#',
                        text:'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).'
                    },
                    {
                        title:'ILoveU',
                        img:'2.jpg',
                        link:'#',
                        text:'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).'
                    },
                    {
                        title:'Event decor',
                        img:'3.jpg',
                        link:'#',
                        text:'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).'
                    }
                ]
            }
        },
        methods:{
            makeCol(index){
                let simb = false;
                if(index%2 === 0){
                    simb = true;
                }
                return {right:simb};
            }
        },
        components:{
            eTitle:require('./Title'),
            eRamka:require('./Ramka')
        }
    }
</script>
<style lang="less" scoped>
    .prt{
        margin:50px auto;
        padding-top:50px;
        &-title{
            font-size:30px;
            font-weight:100;
            text-transform:uppercase;
            line-height:1.2;
            margin:0;
            color:black;
            position: relative;
            overflow: hidden;
            &:hover{
                &:after{
                    right:0;
                }
            }
            &:after{
                content:'';
                position: absolute;
                width:100%;
                border-bottom:1px solid black;
                right:100%;
                top:70%;
                transition:all 0.3s;
            }
        }
        &-block{
            display: flex;
            flex-flow:row nowrap;
            margin:75px 0;
            &.right{
                &>div{
                    order:1;
                }
                .text{
                    order:2;
                }
            }
            &>div{
                width:30%;
                order:2;
            }
            .text{
                width:70%;
                order:1;
                padding:0 3vw;
                text-align: center;
                .title{
                    font-family: 'Gabriela', serif;
                    font-size:25px;
                    display: inline-block;
                    background-color: #ff99cc;
                    line-height:1.2;
                    margin-bottom:25px;
                    color:black;
                    &:before{
                        content:'«';
                    }
                    &:after{
                        content:'»';
                    }
                }
                &-in{
                    text-align: left;
                    font-size:16px;
                    font-weight:300;
                    line-height:1.375;
                    height:170px;
                    position: relative;
                    overflow: hidden;
                    &:after{
                        content:'';
                        position: absolute;
                        bottom:0;
                        left:0;
                        width:100%;
                        height: 50px;
                        background: linear-gradient(to top,white,transparent);
                        pointer-events: none;
                    }
                }
            }
            .img{
                height: 250px;
                background-repeat:no-repeat;
                background-position: center;
                background-size:cover;
            }
        }
    }
</style>