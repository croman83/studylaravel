
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

const state = {
    locale:'en',
    favorits:localStorage.getItem('favorits') ? JSON.parse(localStorage.getItem('favorits')) : [],
}

const getters = {
    getUser: state => {
        return state.user
    },
    favoritsCount (state) {
        return state.favorits
    }
}

const mutations = {
    changeLocale(state,payload) {
        state.locale = payload;
        console.log(state,payload);
    },
    changeFavorits(state,payload){
        state.favorits = payload;
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