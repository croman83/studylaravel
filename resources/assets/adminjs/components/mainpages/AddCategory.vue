<template>
    <div class="add">
        <el-card>
            <h1 class="add-title">{{ $t('addcategory') }}</h1>
            <el-tabs tab-position="top" class="add-tab">
                <el-tab-pane :label="lang" v-for="lang in langs" :key="lang">
                    <el-row type="flex" align="middle">
                        <el-col :span="4">
                            <label for="">{{ $t('name_category') }}</label>
                        </el-col>
                        <el-col :span="8">
                            <el-input :placeholder="$t('name_category')" v-model="data['name_'+lang]"></el-input>
                        </el-col>
                    </el-row>
                </el-tab-pane>
            </el-tabs>
            <el-row class="category-one_status">
                <el-col :span="4">
                    <label for="">{{ $t('category_status') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-switch v-model.number="data.status">
                    </el-switch>
                </el-col>
            </el-row>
            <el-row class="category-one_add">
                <el-col :span="4">
                    <label for="">{{ $t('category_image') }}</label>
                </el-col>
                <el-col :span="8">
                    <div v-if="!image">
                        <input type="file" @change="onFileChange">
                    </div>
                    <div class="add-row"  v-else>
                        <img :src="image" class="add-image"/>
                        <el-button type="text" @click="removeImage">Remove image</el-button>
                    </div>
                </el-col>
            </el-row>
            <el-row>
                <el-button plain @click="sendData">{{ $t('save') }}</el-button>
            </el-row>
        </el-card>
    </div>
</template>
<script>
    import store from './../../store';
    export default {
        data(){
            return {
                data:{
                    name_ru:'',
                    name_ro:'',
                    name_en:'',
                    status:false,
                    image:'',
                },
                token:document.head.querySelector('meta[name="csrf-token"]').content,
                langs:store.state.langs,
                loading:false,
                image:'',
            }
        },
        methods:{
            sendData(){
                var formData = new FormData();
                formData.append('image',this.data.image);
                formData.append('lang',this.$store.state.locale);
                formData.append('type','cat-add');
                formData.append('name_ru',this.data.name_ru);
                formData.append('name_ro',this.data.name_ro);
                formData.append('name_en',this.data.name_en);
                formData.append('status',this.data.status ? 1 : 0);

                this.$http.post('',formData,{headers:{
                    'X-CSRF-TOKEN': this.token,
                    'Content-Type': 'multipart/form-data'
                }})
                    .then(response=>{
                        if(response.data.success && response.data.success === 'true'){
                            this.$message({
                                type:'success',
                                message:'Категория создана'
                            });
                        }
                    }), response => { };
            },
            getData(){
                var data = {
                    lang:this.$store.state.locale,
                    type:'get-cat'
                };
                this.$http.post('',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        console.log(response.data)
                        this.categories = response.data.categories;
                    }), response => { };
            },
            onFileChange(e) {
                var files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                this.createImage(files[0]);
                this.data.image = files[0];
            },
            createImage(file) {
                var image = new Image();
                var reader = new FileReader();
                var vm = this;

                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
            },
            removeImage: function (e) {
                this.image = '';
            }

        }
    }
</script>
<style>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
        background-repeat:no-repeat;
        background-position: center;
        background-size:cover
    }
</style>
<style lang="less" scoped>
    .add{
        &-tab{
            margin-bottom:25px;
        }
        &-image{
            width:150px;
        }
        &-row{
            display: flex;
            flex-flow:column nowrap;
            align-items:flex-start;
        }
    }
    .category{
        &-one{
            &_status{
                margin-bottom:25px;
            }
            &_add{
                margin-bottom:25px;
            }
        }
    }
</style>