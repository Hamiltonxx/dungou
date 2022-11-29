# 盾构 - 地层适应性
地址为 http://dungou.cirray.cn

# WEB接口
正式服地址为 http://sh1.cirray.cn:9000
模型训练相关地址为 https://dev.yijianar.com:8441
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
## 训练模型(预处理)
```shell
curl -F filename=@abc_train.csv -F project_name=aaa https://dev.yijianar.com:8441/Upload_Train
```
可能需要等待两分钟训练模型。结果会返回 /csv_6/aaa_train.csv. 自行拼接成 https://dev.yijianar.com:8441/datafile/csv_6/aaa_train.csv 下载
## 下载预处理后文件
```shell
curl https://dev.yijianar.com:8441/datafile/csv_6/aaa_train.csv
```
## 训练进度查询
开始训练后，前端作5秒一次的进度轮询。

# 后端开发
## 购买配置云服务器和域名
## 安装linux操作系统和软件
```shell
sudo apt install redis-server
sudo apt install nginx
```
## 安装网络服务
```shell
sudo apt install trojan
sudo vim /etc/trojan/config.json
sudo apt install proxychains-ng
sudo vim /etc/proxychains4.conf
  socks5 127.0.0.1 1080
proxychains4 curl ifconfig.me
```
## 安装python环境和库
```shell
python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
```

# 前端开发
## 安装node环境
```shell
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm ls-remote
nvm install 19.0.1
```
