<template>
  <div class="services">
    <h1 class="services-title">{{ $t('our_services') }}</h1>
    <div class="services-wrapper">
      <div class="block"
           :class="{right : index % 2 !== 0}"
           v-for="(item,index) in data.services">
        <div class="block-img">
          <app-ramka>
            <div class="img"
                 :style="{backgroundImage:'url(/images/services/'+item.image+')'}">
              <router-link :to="{name:'services',params:{slug:item.slug}}"></router-link>
            </div>
          </app-ramka>
        </div>
        <div class="block-text">
          <div class="block-title">
            <app-title :center="true" :square="true">
              <h2 class="title">
                <router-link :to="{name:'services',params:{slug:item.slug}}">{{ item.name }}</router-link>
              </h2>
            </app-title>
          </div>
          <div class="text">{{ item.short_description}}</div>
          <div class="block-more">
            <router-link :to="{name:'services',params:{slug:item.slug}}">{{ $t('read_more') }}</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data(){
      return {
        lang: config.locale,
        data: {},
      }
    },
    methods: {
      getData(){
        var data = {lang: this.lang};
        this.$http.post('/get-services', data, {headers: {'X-CSRF-TOKEN': this.token}})
          .then(response => {
            console.log(response.data)
            this.data = response.data;
          }), response => {
        };
      }
    },
    components: {
      appRamka: require('./../Elements/Ramka.vue'),
      appTitle:require('./../Elements/Title.vue')
    },
    mounted(){
      this.getData();
    }
  }
</script>
<style lang="less" scoped>
  @import '../../../less/styles/variables';
  @import '../../../less/styles/lesshat';

  .services {
    width: 80%;
    margin: 0 auto;
    &-title {
      font-family: @font-gabriela;
      font-size: 25px;
      font-weight: normal;
      margin: 25px auto 50px auto;
      width: 90%;

    }
    .block {
      .flex(row, wrap, space-between, flex-start);
      margin: 45px 0;
      position: relative;
      padding:45px 0;
      &:before{
        content:'';
        .size(100%);
        border:1px solid @color-light-gray;
        border-left-width:0;
        position:absolute;
        top:0;
        left:25px;
        pointer-events: none;
      }
      &.right {
        &:before{
          left:-25px;
          border-right:0;
          border-left-width:1px;
          pointer-events: none;
        }
        .block-img {
          order: 2;
        }
        .block-text {
          order: 1;
          text-align: right;
        }
      }
      &-img {
        width: 20%;
        order: 1;
        .img {
          height: 250px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: cover;
          a {
            display: block;
            height: 100%;
            pointer-events: all;
          }
        }
      }
      &-title{
        text-align: center;
        margin-bottom:25px;
        .title{
          text-align:center;
          font-family:@font-gabriela;
          font-size:20px;
          font-weight:normal;
          line-height:1.2;
          margin-bottom:0;
          a{
            color:black;
            &:hover{
              color:@color-pink;
            }
          }
        }
      }
      &-text {
        width: ~'calc(80% - 25px)';
        order: 2;
        .text{
          width:80%;
          margin:0 auto 15px auto;
          text-align:left;
          font-size:16px;
          font-weight:300;
          line-height:25px;
        }
      }
      &-more{
        text-align:center;
        a{
          color:black;
          font-family:@font-gabriela;
          background-color: @color-pink;
          padding:2px 4px;
        }
      }
    }
  }
</style>