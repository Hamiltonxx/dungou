import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

// 全局样式
import './style/common.scss';
// 按需引用 element-ui 组件
import './use-element';

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
