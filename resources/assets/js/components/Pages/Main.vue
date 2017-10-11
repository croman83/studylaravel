<template>
    <div>
        <app-slider></app-slider>
    </div>
</template>

<script>
    import Slider from './../Elements/Tslider';
    export default {
        mounted() {
            console.log('Component mounted.')
        },
        head:{
            title:{
                inner: 'It will be a pleasure',
                separator:' ',
            },
            meta: [
                { name: 'application-name', content: 'Name of my application' }
                ]
        },
        components:{
            appSlider:Slider,
        }
    }
</script>
