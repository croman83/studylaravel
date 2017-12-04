
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

const state = {
    locale:'en',
    menuCollapse:false,
    langs:['ru','en','ro']
}

const getters = {
    getUser: state => {
        return state.user
    }
}

const mutations = {
    changeLocale(state,payload) {
        state.locale = payload;
        console.log(state,payload);
    },
    collapseMenu(state,payload){
        state.menuCollapse = payload;
    }
}

const actions = {
    setUser(context, data) {
        context.commit('setUser', data)
    }
}

export default new Vuex.Store({
    state,
    getters,
    mutations,
    actions
})