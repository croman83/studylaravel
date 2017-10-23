<template>
    <label :for="id">
        <input type="checkbox"
               :id="id"
               :value="value"
               @change="onInput"
               :name="name">
        <slot></slot>
    </label>
</template>
<script>
    export default {
        props:['name','value','id'],
        methods:{
            onInput(event) {
//                alert(event.target.value);
                console.log(event.target.value)
            }
        }
    }
</script>