<template>
	<div class="wrapper">
        <div class="title">
            <h1>盾构-土层适应性评价系统</h1>
            <h2>集盾构选型、评价以及预测一体的交互平台</h2>
        </div>
        <div class="login">
            <div class="box">
                <div class="welcome">WELCOME</div>
                <div class="form">
                    <h2>登录</h2>
                    <div class="input-box">
                        <span :class="['placeholder', focus.username ? 'focus' : '']">
                            用户名
                        </span>
                        <input type="text" v-model="form.username" 
                            @focus="handleInput('username', 'focus')"
                            @blur="handleInput('username', 'blur')" />
                    </div>
                    <div class="input-box">
                        <span :class="['placeholder', focus.password ? 'focus' : '']">
                            密码
                        </span>
                        <input type="password" v-model="form.password" 
                        @focus="handleInput('password', 'focus')"
                        @blur="handleInput('password', 'blur')" />
                    </div>
                    <div class="ctrl">
                        <el-checkbox v-model="remember">记住密码</el-checkbox>
                        <p>没有账号？立即注册</p>
                    </div>
                    <el-button :loading="loading" type="primary" class="submit" @click="handleSubmit">登录</el-button>
                </div>
            </div>
        </div>
	</div>
</template>

<script>
export default {
	name: 'VIEW_LOGIN',
    data() {
        return {
            loading: false,
            remember: true,
            form: {
                username: '',
                password: '',
            },
            focus: {
                username: false,
                password: false,
            }
        }
    },
    methods: {
        handleSubmit() {
            this
                .validForm()
                .then(() => {
                    this.loading = true;

                })
                .catch(() => {
                    this.$message.error('请填写完整后进行登录!');
                })
        },
        validForm() {
            return new Promise((resolve, reject) => {
                const { username, password } = this.form;
                if (username && password) resolve();
                reject(); 
            })
        },
        /**
         * 输入数据
         */
        handleInput(name, event) {
            if (event === 'focus') {
                this.focus[name] = true
            } else {
                this.focus[name] = this.form[name].length !== 0;
            }
        }
    }
}
</script>

<style lang="scss" scoped>
@import "../../style/var.scss";

.wrapper {
    display: flex;
    justify-content: center;
    width: 100%;
    height: 100%;
    min-height: 500px;
    background-image: linear-gradient( 135deg, #3C8CE7 10%, #00EAFF 100%);
    .title {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        width: 50%;
        height: 100%;
        box-sizing: border-box;
        padding-left: 10%;
        color: #fff;
        h1 {
            font-size: 50px;
            margin-bottom: 50px;
        }
    }
    .login {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 50%;
        height: 100%;
        .box {
            position: relative;
            width: 450px;
            height: 350px;
            background-color: #fff;
            border-radius: $base-radius;
            box-shadow: $base-shadow;
            .welcome {
                position: absolute;
                top: -20px;
                left: -100px;
                width: 200px;
                height: 390px;
                box-sizing: border-box;
                padding-left: 30px;
                padding-top: 100px;
                font-weight: bold;
                color: #fff;
                background-image: linear-gradient( 135deg, #3C8CE7 10%, #00EAFF 100%);
                border-radius: 0 50% 50% 0;
                box-shadow: $base-shadow;
                &:after {
                    display: block;
                    margin-top: 10px;
                    width: 50px;
                    height: 2px;
                    content: '';
                    background-color: #fff;
                }
            }
            .form {
                display: flex;
                justify-content: center;
                align-items: flex-start;
                flex-direction: column;
                width: 290px;
                height: 100%;
                margin-left: 130px;
                h2 {
                    font-size: 28px;
                    font-weight: normal;
                }
                .input-box {
                    position: relative;
                    margin-top: 30px;
                    width: 100%;
                    height: 35px;
                    border-bottom: 1px solid #ccc;
                    input {
                        position: absolute;
                        z-index: 2;
                        font-size: 16px;
                        width: 100%;
                        height: 100%;
                        border: none;
                        background-color: transparent;
                        outline: none;
                    }
                    .placeholder {
                        position: absolute;
                        top: 50%;
                        transform: translateY(-50%);
                        color: #999;
                        font-size: 14px;
                        transition: all 150ms linear;
                    }
                    .focus {
                        top: -8px;
                    }
                }
            }
            .ctrl {
                margin-top: 8px;
                display: flex;
                justify-content: space-between;
                width: 100%;
                p {
                    display: inline-block;
                    font-size: 14px;
                    cursor: pointer;
                    color: #3C8CE7;
                    text-decoration: underline;
                }
            }
            .submit {
                margin-top: 20px;
                width: 100%;
            }
        }
    }
}
</style>
