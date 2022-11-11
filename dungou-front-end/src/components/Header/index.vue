<template>
    <div class="header">
        <div class="logo">
            <span>同济大学</span>
            <span>TONGJI UNIVERSITY</span>
        </div>
        <div class="user">
            <el-dropdown @command="handleClick">
                <span class="username">
                    {{ username }}<i class="el-icon-arrow-down el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item command="logout" style="color: red;">
                        <i class="el-icon-circle-close"></i>
                        退出登录
                    </el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </div>
    </div>
</template>

<script>
export default {
    name: 'COMPONENT_HEADER',
    data() {
        return {
            username: 'allen'
        }
    },
    methods: {
        /**
         * 点击下拉菜单
         */
        handleClick(command) {
            switch(command) {
                case 'logout':
                    this.logout();
                break;
            }
        },
        logout() {
            this
                .$confirm('确定退出本次登录吗？', '提示', {
                    confirmButtonText: '退出登录',
                    cancelButtonText: '取消',
                    type: 'error'
                })
                .then(() => {
                    this.$router.push('/login');
                })
                .catch(() => {});
        }
    }
}
</script>

<style lang="scss" scoped>
@import "../../style/var.scss";

.header {
    position: relative;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 60px;
    box-sizing: border-box;
    padding: 0 20px;
    background-image: linear-gradient( 135deg, #3C8CE7 10%, #00EAFF 100%);
    box-shadow: $base-shadow;
    .logo {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        color: #fff;
        font-weight: bold;
        span:nth-of-type(1) {
            font-size: 16px;
        }
        span:nth-of-type(2) {
            font-size: 12px;
        }
    }
    .username {
        color: #333;
        cursor: pointer;
    }
}
</style>