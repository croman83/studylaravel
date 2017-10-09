<template>
    <div class="admin-sidebar">
        <ul class="admin-menu">
            <li>
                <router-link to="/">
                    <i class="fa fa-desktop"></i>
                    {{ $t('dashboard') }}
                </router-link>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {

    }
</script>