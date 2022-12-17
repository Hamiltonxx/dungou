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
## 工程数据列表
```shell
curl http://sh1.cirray.cn:9000/projects
```
字段英文名分别对应: ID,工程名,施工单位,穿越地层,区间长度(m),起止时间,盾构类型,盾构厂家/型号,土仓压力(MPa),刀盘转速(r/min),扭矩(kN.m),推力(kN),推进速度(mm/min),土体改良,保压泵,双闸门,耐磨措施,平均进度(m/d),刀具磨损,盾构直径(m),盾构埋深(m),稠度指数,开挖面水头(m),渗透系数(cm/s),等效石英含量(%),限制粒径(mm),最大粒径(mm)  
其中, [土仓压力,刀盘转速,扭矩,推力,推进速度] 合为 运行参数. [土体改良,保压泵,双闸门,耐磨措施] 合为 施工措施, [平均进度,刀具磨损] 合为 施工效果。
## 列表查询
```shell
curl -X POST -d '{"shield_diameter":"6.14"}' http://sh1.cirray.cn:9000/projects_search
```
参数为 ground,shield_depth,shield_diameter,manufac_model,consistency_index,excavation_head,permeability,restricted_particle,max_particle,equivalent_quartz,province  
都是非必需  
都改成文字搜索框  
注意，厂家和型号只要一个就行，就是manufac_model, 改成厂家型号
## 数据导入
```shell
curl -F projects=@myprojects.xlsx http://localhost:9000/projects_import
```
## 数据导出
```shell
curl http://localhost:9000/projects_export
```
是二进制流，需要前端做另存为工作

## 新增一条数据
```shell
curl -X POST -d '{"name":"测试工程","length":1000}' http://localhost:9000/projects_add
```
name和length为必需，其他参数为空时可以不传。
## 删除多条数据
```
curl -X POST -d '{"ids":[25,26]}' http://localhost:9000/projects_delete 
curl -X POST -d '{"ids":[27]}' http://localhost:9000/projects_delete
```
## 更新一条数据
```
curl -X POST -d '{"id":28,"name":"改后名字","constru":"曦辉","ground":2,"length":1000,"period":"12~13","shield_type":"测试类型","manufac_model":"测试型号","soil_pressure":"abc","cutter_speed":"100~200","torque":"20~30","thrust":"asdh","advance_speed":"50~60","soil_improvement":"有","pressure_pump":"djs","double_gate":"有","wear_resistant":"有","average_progress":10,"tool_wear":"有","shield_diameter":40,"shield_depth":"10~20","consistency_index":10,"excavation_head":5,"permeability":0.01,"equivalent_quartz":80,"restricted_particle":100,"max_particle":200,"province":"浙江","pics":["http://hello.com/a.png"]}' http://localhost:9000/projects_update
```

## 训练模型(预处理)
```shell
curl -F filename=@abc_train.csv -F project_name=aaa https://dev.yijianar.com:8441/Upload_Train
```
可能需要等待两分钟训练模型。结果会返回 /data/csv_6/aaa_train.csv. 
## 下载文件
```shell
# 下载csv
curl -X POST -d '{"filepath":"/data/csv_6/aaa_train.csv"}' https://dev.yijianar.com:8441/file
# 下载图片
curl -X POST -d '{"filepath":"/pics/abc_evaluate.jpg"}' https://dev.yijianar.com:8441/file
```
## 进度查询
开始训练/评价任务后，前端作2秒一次的进度轮询。当进度为100%时停止轮询。
```shell
# 训练进度
curl -X POST -d '{"project_name":"aaa","task":"train"}' https://dev.yijianar.com:8441/progress
# 评价进度
curl -X POST -d '{"project_name":"aaa","task":"evaluate"}' https://dev.yijianar.com:8441/progress
# 预测进度
curl -X POST -d '{"project_name":"abc","task":"predict"}' https://dev.yijianar.com:8441/progress
```
## 适应性评价
```shell
curl -F filename=@pingjia.csv -F project_name=abc https://dev.yijianar.com:8441/SGSI_Evaluate
```
## 适应性预测
```shell
curl -F filename=@312.csv -F project_name=abc -F Do=6 -F Di=5.25 -F Dc=6.14 https://dev.yijianar.com:8441/SGSI_Prediction
```
参数 Do为管片外径，Di为管片内径，Dc为刀盘直径

# 后端开发
## 购买配置云服务器和域名
## 安装linux操作系统和软件
```shell
sudo apt install redis-server
sudo apt install nginx
sudo apt install mysql-server
```
## 装机
Nvidia RTX显卡驱动安装  
CUDA 深度学习环境安装
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
## 数据录入

# 前端开发
## 安装node环境
```shell
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm ls-remote
nvm install 19.0.1
```
