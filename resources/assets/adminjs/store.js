
import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

const state = {
    locale:'en',
    menuCollapse:false,
    langs:['ru','en','ro'],
    editorConfig:{
        toolbar:[
            { name: 'document', items: [ 'Source'] },
            // { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
            { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
            { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
            { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
            '/',
            { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
            { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
            { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
            { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
            '/',
            { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
            { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
            { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
        ],
        height:300,
    }
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