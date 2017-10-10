<template>
    <div>

        <div class="admin-trans">
            <el-card>
                <!--<ul>-->
                    <!--<li v-for="(item,key,index) in trans">-->
                        <!--<b>{{ key }}</b>-->
                        <!--<ul v-if="typeof item === 'object'">-->
                            <!--<li v-for="(second,key,index) in item">-->
                                <!--<b>{{ key }}</b>-->
                                <!--<ul v-if="typeof second === 'object'">-->
                                    <!--<li v-for="(third,key,index) in second">-->
                                        <!--<b>{{ key }}</b>-->
                                        <!--<ul v-if="typeof item === 'object'">-->
                                            <!--<li></li>-->
                                        <!--</ul>-->
                                        <!--<span v-else><input type="text" :value="third"></span>-->
                                    <!--</li>-->
                                <!--</ul>-->
                                <!--<span v-else><input type="text" :value="second"></span>-->
                            <!--</li>-->
                        <!--</ul>-->
                        <!--<span v-else><input type="text" :value="item"></span>-->
                    <!--</li>-->
                <!--</ul>-->
                <!--<textarea :value="jtrans" @blur="trsend=JSON.parse($event.target.value)"></textarea>-->
                <el-input type="textarea" autosize v-model="jtrans" @blur="trsend=JSON.parse($event.target.value)"></el-input>
                <el-row type="flex" justify="space-between" align="middle" slot="header">
                    <h1 class="admin-title">{{ $t('title.translator') }}</h1>
                    <el-button :plain="true" type="info" icon="upload" @click="send">Save</el-button>
                </el-row>
            </el-card>
        </div>

    </div>
</template>
<script>
    import store from './../../store';
    export default {
        data(){
            return {
                trans: window.config.translations ? window.config.translations : {},
                jtrans:'',
                trsend:'',
                lang:store.state.locale
            }
        },
        methods:{

        },
        mounted(){
            this.jtrans =  JSON.stringify(this.trans,null,4);
        },
        methods:{
            send(){
                var data = {};
                data['trans'] = this.trsend;
                data['locales'] = this.lang;
                var _self = this;
                if(this.trsend !== ''){
                    axios.post('translate/save', data)
                        .then(function(response){
                            if(response.data.success){
                                _self.$message({
                                    message: _self.$t('notify.success'),
                                    type: 'success'
                                });
                                setTimeout(function () {
                                    window.location.reload();
                                },1500)
                            }else{
                                _self.$message({
                                    message: 'error',
                                    type: 'error'
                                });
                            }
                        });
                }

            }
        }
    }
</script>