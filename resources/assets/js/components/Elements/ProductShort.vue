<template>
    <div class="product">
        <el-ramka>
            <div class="product-image"
                 :class="{'no-image':!char.images.length}"
                 :style="{backgroundImage: img}">
                <router-link :to="{ name: 'product', params: { slug: char.info.slug }}"></router-link>
            </div>
        </el-ramka>
        <div class="product-title">
            <router-link :to="{ name: 'product', params: { slug: char.info.slug }}">
                {{ char.info.name }}
            </router-link>
        </div>
        <div class="product-price"><span>{{ char.info.price }}</span>{{ $t('price') }}</div>
    </div>
</template>
<script>
    export default {
        props:['char'],
        components:{
            elRamka:require('./Ramka.vue'),
        },
        computed:{
            img(){
                if(this.char.images.length){
                    return 'url(/images/products/'+this.char.images[0].image+')';
                }else{
                    return 'url(/img/no_photo.png)';
                }
            }
        }
    }
</script>
<style lang="less" scoped>
    .product{
        width:~'calc(25% - 30px)';
        margin:15px;
        margin-bottom:35px;
        transition:all 0.3s;
        transform:scale(1);
        &-image{
            height:250px;
            background-repeat:no-repeat;
            background-position: center;
            background-size:cover;
            &.no-image{
                background-size:100px;
                background-color: whitesmoke;
            }
            a{
                display: block;
                height:100%;
                pointer-events:all;
            }
        }
        &-title{
            text-align: center;
            a{
                font-family: 'Gabriela', serif;
                color:black;
                font-size:19px;
                line-height:1.2;
            }
        }
        &-price{
            text-align: center;
            font-family: 'Gabriela',serif;
            font-size:14px;
            span{
                font-size:18px;
                margin-right:5px;
            }
        }
    }
</style>