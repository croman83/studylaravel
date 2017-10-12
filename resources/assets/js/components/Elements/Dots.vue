<template>
    <div>
        <div :class="'dot dot_'+n" v-for="n in c"></div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                c : 0,
            }
        },
        methods:{
            makeDots(){
                this.c = parseInt(document.body.clientHeight / 500) * 2;
                console.log(document.body.clientHeight)
            }
        },
        mixins:[
            require("vue-mixins/getDocumentHeight"),
        ],
        mounted(){
            this.makeDots();
        }
    }
</script>
<style scoped lang="less">
    .dot{
        position:absolute;
        width:15px;
        height:15px;
        background-color: #ff99cc;
        &_1{
            top:100px;
            right:5%;
        }
        &_2{
            top:340px;
            left:5%;
        }
        &_3{
            top:680px;
            right:7%;
        }
        &_4{
            top:900px;
            left:8%;
        }
        &_5{
            top:1110px;
            right:0%;
        }
        &_6{
            top:1630px;
            left:2%;
        }
        &_7{
            top:1720px;
            right:11%;
        }
        &_8{
            top:2100px;
            left:3%;
        }
    }
</style>