import Vue from 'vue';
import {
    Button,
    Checkbox,
    Loading,
    Message,
} from 'element-ui';

    
Vue.use(Button);
Vue.use(Checkbox);
Vue.use(Loading.directive);

Vue.prototype.$loading = Loading.service;
Vue.prototype.$message = Message;