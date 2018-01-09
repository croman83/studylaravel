<template>
    <el-card>
        <el-row align="middle" type="flex" class="product-list">
            <h1>{{ $t('menu.products') }}</h1>
            <el-button class="categories-add"
                       icon="fa-plus-square-o"
                       @click="addProduct"
                       type="primary"
                       plain>Добавить</el-button>
        </el-row>
        <el-table :data="tableData" style="width: 100%">
            <el-table-column prop="id" label="id" sortable width="180">
            </el-table-column>
            <el-table-column prop="name" label="Name">
            </el-table-column>
            <el-table-column prop="category_id"
                             label="Category"
                             width="250"
                             :filters="revertedCat"
                             :filter-method="filterTag"
                             filter-placement="bottom-end">
                <template slot-scope="scope">
                    <el-tag type="info" size="medium" close-transition>{{scope.row.cats.name}}</el-tag>
                </template>
            </el-table-column>
            <el-table-column
                    align="right"
                    width="150"
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
    </el-card>
</template>
<script>
    export default{
        data(){
            return {
                tableData: [],
                categories:[],
            }
        },
        computed:{
            revertedCat(){
                var el = this.categories;
                var ret = [];
                el.forEach(item=>{
                    ret.push({
                        text:item.name,
                        value:item.id,
                    })
                });
                return ret;
            }
        },
        methods:{
            addProduct(){
                this.$router.push({
                    name:'addproduct'
                })
            },
            handleEdit(index, row) {
                this.$router.push({ name: 'product', params: { slug: row.slug }})
            },
            handleDelete(index, row) {
                this.$confirm('Удалить товар ?', 'Предупреждение', {
                    confirmButtonText: 'Да',
                    cancelButtonText: 'Нет',
                    type: 'warning'
                }).then(() => {
                    console.log(row)
                    var data = {
                        id : row.id,
                        type: 'deleteProduct',
                        slug:row.slug,
                        lang:'ru'
                    }
                    this.loading = true;
                    this.$http.post('products/delete',data,{headers:{'X-CSRF-TOKEN': this.token}})
                        .then(response=>{
                            this.loading = false;
                            this.getData();
                        }), response => {this.loading = false;  };
                }).catch(() => {

                });
            },
            filterTag(value, row) {
                return row.category_id === value;
            },
            getData(){
                var data = {
                    lang:config.locale
                };
                this.$http.post('get-products',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        console.log(response.data)
                        this.tableData = response.data.products;
                        this.categories = response.data.cat;
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
        &-list{
            margin-bottom:25px;
            button{
                margin:0 25px;
            }
            h1{
                margin-bottom:0;
            }
        }
    }
</style>