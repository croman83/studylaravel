<template>
    <div class="footer-contacts">
        <address class="footer-address">
            <img src="/img/logo.png" alt="" class="footer-address_logo">
            <ul>
                <li>Stefan cel Mare 64, Chisinau, R.Moldova</li>
                <li>(+373) 69 00 33 55</li>
            </ul>
        </address>
        <div id="footer-map"></div>
    </div>
</template>
<script>
    const Mix = require('./../../mixins');
    export default {
        data(){
            return {
                mapPosition:{lat:47.0148715,lng:28.7354937}
            }
        },
        methods:{
            initmap(){
                window.map = new google.maps.Map(document.getElementById('footer-map'), {
                    center: this.mapPosition,
                    zoom: 14
                });
                var marker = new google.maps.Marker({
                    position: this.mapPosition,
                    map: window.map
                });
            }
        },
        mounted(){
            Mix.WGL(this.initmap);
        }
    }
</script>
<style scoped lang="less">
    #footer-map{
        height:250px;
        background-color: whitesmoke;
    }
</style>