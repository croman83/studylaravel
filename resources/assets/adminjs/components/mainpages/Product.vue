<template>
    <div class="product-one" v-loading="loading">
        <el-card>
            <div class="product-back">
                <el-button type="info" plain icon="fa-arrow-circle-o-left" @click="goBack">Back</el-button>
            </div>
            <h1>{{ $t('change_product') }}</h1>
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
            <el-row class="product-images">
                <el-col :span="4">
                    <label for="">{{ $t('product.images') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-upload
                            action="foto"
                            list-type="picture-card"
                            :headers="{'X-CSRF-TOKEN':token}"
                            :data="{id:data.product.id,type:'add'}"
                            :file-list="productImages"
                            :on-preview="handlePictureCardPreview"
                            :on-success="handleReload"
                            :on-remove="handleRemove">
                        <i class="el-icon-plus"></i>
                    </el-upload>
                    <el-dialog :visible.sync="dialogVisible" size="tiny">
                        <img width="100%" :src="dialogImageUrl" alt="">
                    </el-dialog>
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
                           @click="editProduct"
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
                        id:''
                    },
                    images:[]
                },
                token:document.head.querySelector('meta[name="csrf-token"]').content,
                langs:store.state.langs,
                status:false,
                loading:false,
                dialogImageUrl: '',
                dialogVisible: false,
                config:store.state.editorConfig
            }
        },
        components:{Ckeditor},
        computed:{
            productImages(){
                var el = this.data.images;
                var ret = [];
                el.forEach(item=>{
                    ret.push({
                        name:item.image,
                        url:'/images/products/thumb/thumb_'+item.image,
                    })
                });
                return ret;
            }
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
            handleReload(){
                // hack to get filenames
//              window.location.reload()
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
                var data = {
                    lang: store.state.locale,
                    type:'deleteImage',
                    file:file,
                    slug:this.data.product.slug,
                    id:this.data.product.id,
                }
                console.log(data);
                this.loading = true;
                this.$http.post('',data)
                    .then(response=>{
                        console.log(response.data);
                        this.$message({
                            type:'success',
                            message:'Изображение удалено'
                        });
                        this.loading = false;

                    }), response => {
                    this.$message({
                        type:'error',
                        message:'Ошибка сервера'
                    });
                    this.loading = false;
                };
            },
            handlePictureCardPreview(file) {
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
            },
            editProduct(){
                var data = {
                    lang: store.state.locale,
                    type:'edit',
                    status:this.status,
                    info:this.data.product,
                    slug:this.data.product.slug,
                }
                this.loading = true;
                this.$http.post('',data)
                    .then(response=>{
                        this.$message({
                            type:'success',
                            message:'Продукт сохранен'
                        });
                        this.loading = false;

                    }), response => {
                    this.$message({
                        type:'error',
                        message:'Ошибка сервера'
                    });
                    this.loading = false;
                };
            },
            getData(){
                var data = {
                    lang: store.state.locale,
                    slug:this.$route.params.slug,
                    type:'get'
                }
                this.$http.post('',data)
                    .then(response=>{
                        this.data = response.data;
                        if(response.data.product.status){
                            this.status = true;
                        }else{
                            this.status = false;
                        }

                    }), response => { };
            },
            goBack(){
                this.$router.push({name: 'products-list'})
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