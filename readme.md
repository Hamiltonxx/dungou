# 盾构 - 地层适应性

# WEB接口
正式服地址为 http://sh1.cirray.cn/api
## 获取验证码
```shell
curl -X POST -d '{"email":"aabbcc@163.com"}' http://localhost:9000/send_code_email
```
## Email注册
```shell
curl -X POST -d '{"email":"guozheng_huang@163.com","emailcode":"643350","password":"123456"}' http://localhost:9000/email_register
```
## Email登录
```shell
curl -X POST -d '{"email":"guozheng_huang@163.com","password":"123456"}' http://localhost:9000/email_login
```

# 后端开发
## 购买配置云服务器和域名
## 安装linux操作系统和软件
## 安装和配置mysql数据库
## 安装python环境和库
