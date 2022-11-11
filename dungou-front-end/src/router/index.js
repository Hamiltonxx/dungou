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
	{
		path: '/register',
		name: 'Register',
		component: () => import(/* webpackChunkName: "Register" */ '../views/Register'),
		meta: {
			layout: false,
		}
	},
	{
		path: '/',
		redirect: '/main'
	},
	{
		path: '/main',
		name: 'Main',
		component: () => import(/* webpackChunkName: "Main" */ '../views/Main'),
		meta: {
			layout: true,
			pageIndex: 1
		}
	},
	{
		path: '/appraisal',
		name: 'Appraisal',
		component: () => import(/* webpackChunkName: "Appraisal" */ '../views/Appraisal'),
		meta: {
			layout: true,
			pageIndex: 2
		}
	},
	{
		path: '/prediction',
		name: 'Prediction',
		component: () => import(/* webpackChunkName: "Prediction" */ '../views/Prediction'),
		meta: {
			layout: true,
			pageIndex: 3
		}
	},
	{
		path: '/gauging',
		name: 'Gauging',
		component: () => import(/* webpackChunkName: "Gauging" */ '../views/Gauging'),
		meta: {
			layout: true,
			pageIndex: 4
		}
	},
];

const router = new VueRouter({
  routes
});

export default router
