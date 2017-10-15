<template>
    <div class="cat">
        <div class="cat-title container">
            <el-title :square="true">
                <h1 class="cat-title_head">{{ data.name }}</h1>
            </el-title>
        </div>
    </div>

</template>
<script>
    export default {
        data(){
            return {
                data:{},
            }
        },
        components:{
            elTitle:require('./../Elements/Title.vue')
        },
        methods:{
            getData(){
                var data = {
                    slug:this.$route.params.slug,
                    locale:config.locale,
                };
                this.$http.post('/list-products',data)
                    .then(response=>{
                        console.log(response.data)
                        this.data = response.data;
                    }), response => { };
            }
        },
        mounted(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    .cat{
        &-title{
            margin-top:50px;
            margin-bottom:50px;
            text-align: center;
            &_head{
                margin:0;
                line-height: 1.2;
                font-weight:400;
                font-family:'Gabriela', serif;
                font-size:40px;
            }
        }
    }
</style>