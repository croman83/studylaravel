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
                    <h2 class="cat-filter_title">{{ $t('chooseFilter') }}</h2>
                    <div class="block" v-for="(item,index) in data.filter">
                        <label :for="'catfilter'+item.id">
                            <input type="checkbox"
                                   :name="'catfilter'+item.id"
                                   :value="item.id"
                                   v-model="checkedFilter"
                                   :id="'catfilter'+item.id">
                            <span>{{ item.name }}</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="cat-block">
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
    export default {
        data(){
            return {
                data:{},
                checkedFilter:[],
            }
        },
        components:{
            elTitle:require('./../Elements/Title.vue'),
            elProduct:require('../Elements/ProductShort.vue')
        },
        watch:{
            checkedFilter(val){
                this.getData();
            }
        },
        methods:{
            test(e){
                console.log('test: ' + e)
            },
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
                        console.log(response.data)
                        this.data = response.data;
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
            width:25%;
            background-color: antiquewhite;
            min-height:75vh;
        }
        &-block{
            width:70%;
            &_wrapper{
                display:flex;
                flex-flow:row wrap;
            }
        }
    }
</style>