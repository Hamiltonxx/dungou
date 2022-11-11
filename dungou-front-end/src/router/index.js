import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

const routes = [
	{
		path: '/login',
		name: 'Login',
		component: () => import(/* webpackChunkName: "Login" */ '../views/Login'),
		meta: {
			layout: false,
		}
	},
];

const router = new VueRouter({
  routes
});

export default router
