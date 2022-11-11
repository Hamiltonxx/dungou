<template>
    <div class="layout">
        <template v-if="layout">
            <el-container>
                <!-- 头部 -->
                <el-header>
                    <header-dom />
                </el-header>
                <el-container>
                    <!-- 菜单 -->
                    <el-aside width="200px">
                        <nav-dom />
                    </el-aside>
                    <!-- 主体 -->
                    <el-main>
                        <slot />
                    </el-main>
                </el-container>
            </el-container>
        </template>

        <!-- 不适用 layout 布局 -->
        <template v-else>
            <slot />
        </template>
    </div>
</template>

<script>
import HeaderDom from '../Header';
import NavDom from '../Nav';

export default {
    name: 'COMPONENT_LAYOUT',
    components: {
        HeaderDom,
        NavDom
    },
    data() {
		return {
			layout: true,
		}
	},
    watch: {
		$route: {
			handler (to) {
				this.layout = to.meta.layout;
			},
			immediate: true
		}
	},
}
</script>

<style lang="scss" scoped>
@import "../../style/var.scss";

.layout {
    width: 100%;
    height: 100%;
    :deep(.el-header) {
        padding: 0;
    }
    :deep(.el-container) {
        height: 100%;
        box-shadow: $base-shadow;
    }
    :deep(.el-main) {
        width: 100%;
        min-height: 100%;
        padding-bottom: 80px;
        background-color: #f2f3f4;
    }
}
</style>