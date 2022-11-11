<template>
	<div id="app">
		<router-view/>
	</div>
</template>

<script>
import Layout from './components/Layout';

export default {
	name: 'App',
	components: {
		Layout
	},
	data() {
		return {
		}
	}
}
</script>

<style lang="scss">

</style>
