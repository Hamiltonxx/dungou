import Vue from 'vue';
import {
    Button,
    Checkbox,
    Loading,
    Message,
    Container,
    Header,
    Aside,
    Main,
    Menu,
    MenuItem,
    Dropdown,
    DropdownMenu,
    DropdownItem,
    MessageBox
} from 'element-ui';

    
Vue.use(Button);
Vue.use(Checkbox);
Vue.use(Container);
Vue.use(Header);
Vue.use(Aside);
Vue.use(Main);
Vue.use(Menu);
Vue.use(MenuItem);
Vue.use(Dropdown);
Vue.use(DropdownMenu);
Vue.use(DropdownItem);
Vue.use(Loading.directive);

Vue.prototype.$loading = Loading.service;
Vue.prototype.$message = Message;
Vue.prototype.$msgbox = MessageBox;
Vue.prototype.$alert = MessageBox.alert;
Vue.prototype.$confirm = MessageBox.confirm;
Vue.prototype.$prompt = MessageBox.prompt;
