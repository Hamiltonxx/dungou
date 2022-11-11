<template>
    <div class="nav">
        <el-menu
            :default-active="active"
            background-color="#409EFF"
            text-color="#fff"
            active-text-color="#ffd04b"
        >
            <el-menu-item index="1" @click="handleToPage('/main')">
                <i class="el-icon-s-operation"></i>
                <span slot="title">盾构选型</span>
            </el-menu-item>
            <el-menu-item index="2" @click="handleToPage('/appraisal')">
                <i class="el-icon-c-scale-to-original"></i>
                <span slot="title">适应性评价</span>
            </el-menu-item>
            <el-menu-item index="3" @click="handleToPage('/prediction')">
                <i class="el-icon-data-analysis"></i>
                <span slot="title">适应性预测</span>
            </el-menu-item>
            <el-menu-item index="4" @click="handleToPage('/gauging')">
                <i class="el-icon-cpu"></i>
                <span slot="title">适应性检测</span>
            </el-menu-item>
        </el-menu>
    </div>
</template>

<script>
export default {
    name: 'COMPONENT_NAV',
    data() {
        return {
            active: '1'
        }
    },
    created() {
        this.active = String(this.$route.meta.pageIndex);
    },
    methods: {
        handleToPage(path) {
            this.$router.push(path);
        }
    }
}
</script>

<style lang="scss" scoped>
.nav {
    width: 200px;
    height: 100%;
    :deep(.el-menu) {
        height: 100%;
    }
    :deep(.el-menu-item i) {
        color: #fff;
    }
    :deep(.is-active) {
        background-color: rgb(51,126,204) !important;
    }
}
</style>