<template>
    <div>
        <app-slider></app-slider>
        <app-new></app-new>
        <app-partners></app-partners>
    </div>
</template>

<script>
    import Slider from './../Elements/Tslider';
    import newproduct from './../Elements/Newproduct';
    import Partners from './../Elements/Partners_main';
    export default {
        mounted() {
            console.log('MainPage mounted.')
        },
        head:{
            title:{
                inner: 'Decor CuDrag',
                separator:' ',
            },
            meta: [
                { name: 'application-name', content: 'CuDrag' }
                ]
        },
        components:{
            appSlider:Slider,
            appNew:newproduct,
            appPartners:Partners,
        }
    }
</script>
