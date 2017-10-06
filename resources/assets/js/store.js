
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

const state = {
    locale:'en'
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