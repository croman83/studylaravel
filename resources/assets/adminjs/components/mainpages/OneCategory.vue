<template>
    <div class="category-one" v-loading="loading">
        <el-card>
            <div class="category-back">
                <el-button type="info" plain icon="fa-arrow-circle-o-left" @click="goBack">Back</el-button>
            </div>
            <h1>{{ $t('change_category') }}</h1>
            <el-tabs tab-position="top" class="category-tab">
                <el-tab-pane :label="lang" v-for="lang in langs" :key="lang">
                    <el-row type="flex" align="middle">
                        <el-col :span="4">
                            <label for="">{{ $t('change_category') }}</label>
                        </el-col>
                        <el-col :span="8">
                            <el-input placeholder="Please input" v-model="data['name_'+lang]"></el-input>
                        </el-col>
                    </el-row>
                </el-tab-pane>
            </el-tabs>
            <el-row class="category-one_status">
                <el-col :span="4">
                    <label for="">{{ $t('category_status') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-switch v-model.number="status">
                    </el-switch>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="4">
                    <label for="">{{ $t('category_image') }}</label>
                </el-col>
                <el-col :span="8">
                    <el-upload
                            class="avatar-uploader"
                            action="foto"
                            :headers="{'X-CSRF-TOKEN':token}"
                            :show-file-list="false"
                            :data="{id:data.id}"
                            :on-success="handleAvatarSuccess"
                            :before-upload="beforeAvatarUpload">
                        <!--<img v-if="imageUrl" :src="imageUrl" class="avatar">-->
                        <div  v-if="imageUrl" class="avatar" :style="{backgroundImage:'url('+ imageUrl +')'}"></div>
                        <i  class="el-icon-plus avatar-uploader-icon" v-else></i>
                    </el-upload>
                </el-col>
            </el-row>
            <el-row>
                <el-button type="primary"
                           plain
                           @click="editCategory"
                           icon="el-icon-edit">{{ $t('save') }}</el-button>
            </el-row>
        </el-card>
    </div>
</template>
<script>
    import store from './../../store';
    export default{
        data(){
            return {
                data:{},
                token:document.head.querySelector('meta[name="csrf-token"]').content,
                langs:store.state.langs,
                imageUrl: '',
                status:false,
                loading:false,
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
            editCategory(){
                var data = {
                    lang: store.state.locale,
                    cat:this.data,
                    type:'edit'
                }
                this.loading = true;
                this.$http.post('',data)
                    .then(response=>{
                        console.log(response.data);
                        this.$message({
                            type:'success',
                            message:'Категория сохранена'
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
                        this.data = response.data.cat;
                        this.imageUrl = '/images/categories/'+this.data.image;
                        if(this.data.status === 1){
                            this.status = true;
                        }else{
                            this.status = false;
                        }
                    }), response => { };
            },
            goBack(){
                this.$router.push({name: 'categories'})
            },
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
            },
            beforeAvatarUpload(file) {
                const isJPG = file.type === 'image/jpeg';
                const isLt2M = file.size / 1024 / 1024 < 2;

                if (!isJPG) {
                    this.$message.error('picture must be JPG format!');
                }
                if (!isLt2M) {
                    this.$message.error('picture size can not exceed 2MB!');
                }
                return isJPG && isLt2M;
            }
        },
        mounted(){
            this.getData();
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
<style scoped lang="less">
    .category{
        &-tab{
            margin-bottom:25px;
        }
        &-one{
            &_status{
                margin-bottom:25px;
            }
        }
        &-back{
            margin-bottom:25px;
        }
    }
</style>