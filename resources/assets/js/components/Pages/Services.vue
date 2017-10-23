<template>
    <div class="services">
        <h1 class="services-title">{{ $t('our_services') }}</h1>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                lang:config.locale,
                data:{},
            }
        },
        methods:{
            getData(){
                var data = {lang:this.lang};
                this.$http.post('/get-services',data,{headers:{'X-CSRF-TOKEN': this.token}})
                    .then(response=>{
                        console.log(response.data)
                        this.data = response.data;
                    }), response => { };
            }
        },
        mounted(){
            this.getData();
        }
    }
</script>