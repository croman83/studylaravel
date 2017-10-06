<template>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Example Component</div>

                    <div class="panel-body">
                        I'm an example component! Hi th
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
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
        }
    }
</script>
