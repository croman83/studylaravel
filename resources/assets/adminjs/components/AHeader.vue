<template>
    <header class="header">
        <div class="header-left">
            <i class="el-icon-menu header-icon"></i>
        </div>
        <div class="header-right">
            <div class="header-user">
                <b v-text="name"></b>
            </div>
            <div class="header-logout">
                <span @click="logout"><img src="/img/logout.svg" alt=""></span>
            </div>
        </div>
    </header>
</template>
<script>
    export default {
        props:['name'],
        methods:{
            logout(){
                console.log('logout')
                axios.post(`logout`)
                    .then(response => {
                        window.location.replace('/');
                    })
                    .catch(e => {
                        alert('error connection')
                    })
            }
        }
    }
</script>