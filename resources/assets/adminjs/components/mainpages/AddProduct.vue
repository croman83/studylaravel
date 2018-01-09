<template>
    <div class="product-one" v-loading="loading">
        <el-card>
            <div class="product-back">
                <el-button type="info" plain icon="fa-arrow-circle-o-left" @click="goBack">Back</el-button>
            </div>
            <h1>{{ $t('new_product') }}</h1>
            <el-tabs tab-position="top" class="category-tab">
                <el-tab-pane :label="lang" v-for="lang in langs" :key="lang">
                    <el-row type="flex" align="middle" class="category-tab_row">
                        <el-col :span="4">
                            <label for="">{{ $t('product.name') }}</label>
                        </el-col>
                        <el-col :span="8">
                            <el-input placeholder="Please input" v-model="data.product['name_'+lang]"></el-input>
                        </el-col>
                    </el-row>
                    <el-row type="flex" align="top" class="category-tab_row">
                        <el-col :span="4">
                            <label for="">{{ $t('product.description') }}</label>
                        </el-col>
                        <el-col :span="20">
                            <!--<el-input placeholder="Please input" v-model="data.product['description_'+lang]"></el-input>-->
                            <ckeditor
                                    :config="config"
                                    v-model="data.product['description_'+lang]"></ckeditor>
                        </el-col>
                    </el-row>
                    <el-row type="flex" align="top" class="category-tab_row">
                        <el-col :span="4">
                            <label for="">{{ $t('product.extra_description') }}</label>
                        </el-col>
                        <el-col :span="20">
                            <!--<el-input placeholder="Please input" v-model="data.product['description_'+lang]"></el-input>-->
                            <ckeditor
                                    :config="config"
                                    v-model="data.product['extra_description_'+lang]"></ckeditor>
                        </el-col>
                    </el-row>
                </el-tab-pane>
            </el-tabs>
            <el-row class="product-price" type="flex" align="middle" >
                <el-col :span="4">
                    <label for="">{{ $t('product.price') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-input placeholder="Please input" v-model.number="data.product['price']" type="number"></el-input>
                </el-col>
            </el-row>
            <el-row class="product-category" type="flex" align="middle">
                <el-col :span="4">
                    <label for="">{{ $t('product.choose_cat') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-select v-model="data.categoryId" placeholder="Select" @change="getTags">
                        <el-option
                                v-for="item in categoryList"
                                :key="item.id"
                                :label="item.name_ru"

                                :value="item.id">
                        </el-option>
                    </el-select>
                    <el-select
                            v-model="choosenTags"
                            multiple
                            collapse-tags
                            style="margin-left: 20px;"
                            placeholder="Tags">
                        <el-option
                                v-for="item in tags"
                                :key="item.id"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-col>
            </el-row>
            <el-row class="category-status">
                <el-col :span="4">
                    <label for="">{{ $t('category_status') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-switch v-model.number="status">
                    </el-switch>
                </el-col>
            </el-row>
            <el-row>
                <el-button type="primary"
                           plain
                           @click="saveProduct"
                           icon="el-icon-edit">{{ $t('save') }}</el-button>
            </el-row>
        </el-card>
    </div>
</template>
<script>
    import store from './../../store';
    import Ckeditor from 'vue-ckeditor2'
    export default{
        data(){
            return {
                data:{
                    product:{
                        id:'',
                        name_ru:'1',
                        name_en:'2',
                        name_ro:'3',
                        description_ru:'4',
                        description_en:'5',
                        description_ro:'6',
                        extra_description_ru:'7',
                        extra_description_en:'8',
                        extra_description_ro:'9',
                        price:0,
                    },
                    images:[],
                    status:0,
                    categoryId:1,
                },
                token:document.head.querySelector('meta[name="csrf-token"]').content,
                langs:store.state.langs,
                status:false,
                loading:false,
                config:store.state.editorConfig,
                categoryList:[],
                choosenTags:[],
                tags:[],

            }
        },
        components:{Ckeditor},
        computed:{

        },
        watch:{
            status(val){
                if(val){
                    this.data.status = 1;
                }else{
                    this.data.status = 0;
                }
            }
        },
        methods:{
            getTags(){
                this.choosenTags = [];
                this.getData();
            },
            saveProduct(){
                var data = {
                    lang: store.state.locale,
                    type:'add',
                    status:this.data.status,
                    info:this.data.product,
                    slug:'addnew',
                    category:this.data.categoryId,
                    tag:this.choosenTags
                }
                this.loading = true;
                this.$http.post('',data)
                    .then(response=>{
                        this.$message({
                            type:'success',
                            message:'Продукт создан'
                        });
                        this.loading = false;
                        this.goBack();

                    }), response => {
                    this.$message({
                        type:'error',
                        message:'Ошибка сервера'
                    });
                    this.loading = false;
                };
            },
            goBack(){
                this.$router.push({name: 'products-list'})
            },
            getData(){
                var data = {
                    lang:config.locale,
                    category:this.data.categoryId
                };
                this.$http.post('get-datacat',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        this.categoryList = response.data.categories;
                        this.tags = response.data.tags;
                    }), response => { };
            },

        },
        mounted(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    .product{
        &-images{
            margin-bottom:25px;
        }
        &-back{
            margin-bottom:25px;
        }
        &-price{
            margin-bottom:25px;
        }
        &-category{
            margin-bottom:25px;
        }
    }
    .category{
        &-tab{
            margin-bottom:25px;
            &_row{
                margin-bottom:25px;
            }
        }
        &-status{
            margin-bottom:25px;
        }
    }
</style>