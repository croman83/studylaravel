<template>
    <div class="cat">
        <div class="cat-title container">
            <el-title :square="true">
                <h1 class="cat-title_head">{{ data.name }}</h1>
            </el-title>
        </div>
        <div class="cat-wrapper">
            <div class="cat-side">
                <div class="cat-filter">
                    <div class="cat-filter_category">
                        <h2 class="cat-filter_title">{{ $t('categories') }}</h2>
                        <div class="block"
                             v-for="item in categories"
                             v-if="item.parent_category === data.name_id">
                            <router-link :to="{name:'category' , params:{slug:item.slug}}">{{ item.name }}</router-link>
                        </div>
                    </div>
                    <h2 class="cat-filter_title" v-if="data.filter.length">{{ $t('chooseFilter') }}</h2>
                    <div class="block" v-for="(item,index) in data.filter">
                        <label :for="'catfilter'+item.id" class="checkbox-input">
                            <input type="checkbox"
                                   :name="'catfilter'+item.id"
                                   :value="item.id"
                                   hidden
                                   v-model="checkedFilter"
                                   :id="'catfilter'+item.id">
                            <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <polygon class="svg1" points="226.4,283.284 134.616,192.636 74.096,259.316 233.48,416.708 512,73.084 444.792,13.812 "/>
                                <polygon class="svg2" points="274.04,149.996 274.04,109.996 0,109.996 0,498.188 345.88,498.188 345.88,409.204
                                    305.88,409.204 305.88,458.188 40,458.188 40,149.996 "/>
                            </svg>
                            <span>{{ item.name }}</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="cat-block">
                <div class="cat-block_noproducts"
                     v-cloak
                     key="no_product1">{{ $t('no_products') }}</div>
                <transition-group tag="div"
                                  name="list-complete"
                                  mode="out-in"
                                  appear
                                  class="cat-block_wrapper">
                    <el-product :char="item"
                                v-for="(item,index) in data.products"
                                :key="'product'+item.info.id"
                    ></el-product>
                </transition-group>
                <div class="cat-pagination">
                    <pagination for="category"
                                :chunk="10"
                                class="pagination-block"
                                :records="parseInt(data.product_total)"
                                :count-text="'Showing {from} to {to} of {count} records| | '"
                                :per-page="5"></pagination>
                </div>
            </div>
        </div>
    </div>

</template>
<script>
    import {Pagination, PaginationEvent} from 'vue-pagination-2';
    import Menu from './../Base/Menu.vue';
    export default {
        data(){
            return {
                data:{
                    filter:[],
                    products:[],
                },
                checkedFilter:[],
                no_product:false,
                categories:JSON.parse(config.categories)
            }
        },
        components:{
            elTitle:require('./../Elements/Title.vue'),
            elProduct:require('../Elements/ProductShort.vue'),
            elCheck:require('./../Elements/Checkbox.vue'),
        },
        watch:{
            checkedFilter(val){
                this.getData();
            }
        },
        methods:{

            animateScroll(){
                Velocity(document.body, "scroll", {offset: "0", mobileHA: false});
            },
            getData(page = 1){
                var data = {
                    slug:this.$route.params.slug,
                    locale:config.locale,
                    page:page,
                    filter:this.checkedFilter,
                };
                this.$http.post('/list-products',data)
                    .then(response=>{
                        this.data = response.data;
                        var el = document.querySelector('.cat-block_noproducts');
                        if(response.data.products.length > 0){
                            setTimeout(function () {
                                el.style.display = 'none';
                            },300)
                        }else{
                            setTimeout(function () {
                                el.style.display = 'block';
                            },300)
                        }
                    }), response => { };
            }
        },
        mounted(){
            this.getData();
            var _self = this;
            PaginationEvent.$on('vue-pagination::category', function(page) {
                _self.getData(page);
                _self.animateScroll();
            });
        }
    }
</script>
<style lang="less" scoped>
    @import '../../../less/styles/variables';
    @import '../../../less/styles/lesshat';
    .cat{
        margin-bottom:50px;
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
        &-wrapper{
            display: flex;
            justify-content: space-between;
            width:85%;
            margin:0 auto;
        }
        &-side{
            width:20%;
            min-height:50vh;
            padding:0 15px;
        }
        &-block{
            width:75%;
            &_wrapper{
                display:flex;
                flex-flow:row wrap;
            }
            &_noproducts{
                font-family:@font-gabriela;
                font-size:18px;
                display:none;
                margin-bottom:100px;
            }
        }
        &-filter{
            &_title{
                font-family: @font-gabriela;
                font-weight:normal;
                font-size:20px;
                margin-bottom:2em;
            }
            .block{
                margin-bottom:5px;
                padding-left:10px;
            }
            &_category{
                margin-bottom:50px;
                a{
                    font-family: @font-gabriela;
                    font-size:16px;
                    line-height: 1.2;
                    color:black;
                    margin-bottom:5px;
                }
            }
        }
    }
</style>