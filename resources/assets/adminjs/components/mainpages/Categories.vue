<template>
    <el-card>
        <div class="categories">
            <el-row type="flex" align="middle" class="categories-head">
                <h1 class="categories-title">{{ $t('menu.category') }}</h1>
                <el-button class="categories-add"
                           icon="fa-plus-square-o"
                           @click="addCategory"
                           type="primary"
                           plain>Добавить</el-button>
            </el-row>
            <el-row>
                <el-table
                        :data="categories"
                        v-loading="loading"
                        style="width: 100%">
                    <el-table-column
                            label="id"
                            width="80">
                        <template slot-scope="scope">
                            <span>{{ scope.row.id }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                            label="Name">
                        <template slot-scope="scope">
                            <span>{{ scope.row.name_ru }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                            label="Image"
                            align="center">
                        <template slot-scope="scope">
                            <el-row type="flex" align="middle" justify="center">
                                <img :src="'/images/categories/' + scope.row.image" alt="" style="height:50px;">
                            </el-row>
                            <!--<span>{{ scope.row.name_ru }}</span>-->
                        </template>
                    </el-table-column>
                    <el-table-column
                            align="right"
                            label="Operations">
                        <template slot-scope="scope">
                            <el-button
                                    size="mini"
                                    @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
                            <el-button
                                    size="mini"
                                    type="danger"
                                    @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-row>
        </div>
    </el-card>
</template>
<script>
    import store from './../../store';
    export default{
        store,
        data(){
            return {
                categories:[],
                loading:false,
            }
        },
        methods: {
            handleEdit(index, row) {
                console.log(index, row);
                this.$router.push({ name: 'category', params: { slug: row.slug }})
            },
            handleDelete(index, row) {
                this.$confirm('Удалить категорию ?', 'Предупреждение', {
                    confirmButtonText: 'Да',
                    cancelButtonText: 'Нет',
                    type: 'warning'
                }).then(() => {
                    this.deleteCat(row.id);
                }).catch(() => {

                });
            },
            deleteCat(id){
                var data = {
                    lang:this.$store.state.locale,
                    id:id
                };
                this.loading = true;
                this.$http.post('delete-category',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        console.log(response.data)
                        this.loading = false;
                        if(response.data.count > 0){
                            this.$message({
                                type: 'error',
                                message: 'Категория содержит продукты'
                            });
                        }else{
                            this.categories = response.data.categories;
                            this.$message({
                                type: 'success',
                                message: 'Категория удалена'
                            });
                        }
                    }), response => {
                    this.loading = false;
                };
            },
            getData(){
                var data = {
                    lang:this.$store.state.locale
                };
                this.$http.post('get-categories',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        console.log(response.data)
                        this.categories = response.data.categories;
                    }), response => { };
            },
            addCategory(){
                this.$router.push({
                    name:'addcategory'
                })
            }
        },
        mounted(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    .categories{
        &-head{
            margin-bottom:25px;
        }
        &-add{
            margin:0 25px;
        }
        &-title{
            margin-bottom:0;

        }
    }
</style>