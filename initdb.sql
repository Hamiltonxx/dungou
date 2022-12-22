CREATE DATABASE IF NOT EXISTS dungou CHARACTER SET utf8 COLLATE utf8_unicode_ci;

use dungou;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32),
    password VARCHAR(255),
    phone VARCHAR(16),
    email VARCHAR(64),
    role VARCHAR(16),
    registerdate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64),
    constru VARCHAR(32),
    ground INT,
    length INT,
    starttime DATE,
    endtime DATE,
    shield_type VARCHAR(16),
    manufac_model VARCHAR(64),
    soil_pressure VARCHAR(16),
    cutter_speed VARCHAR(16),
    torque VARCHAR(16),
    thrust VARCHAR(16),
    advance_speed VARCHAR(16),
    soil_improvement VARCHAR(255),
    pressure_pump VARCHAR(16),
    double_gate VARCHAR(16),
    wear_resistant VARCHAR(16),
    average_progress DOUBLE,
    tool_wear VARCHAR(16),
    shield_diameter DOUBLE,
    shield_depth VARCHAR(16),
    consistency_index DOUBLE,
    excavation_head DOUBLE,
    permeability DOUBLE,
    equivalent_quartz DOUBLE,
    restricted_particle DOUBLE,
    max_particle DOUBLE 
);

INSERT INTO project VALUES(1,"武汉地铁3号线香港路站~惠济二路站","腾达建设有限公司",2,980,"2014.11~2015.04","土压","奥村/LX-08","0.15~0.18","1.2~1.5","2200~2500","12000~15000","25~45","开挖面注入泥浆及泡沫，总注入比为20%~40%，根据实际出土效果进行调整","无","无","无",12,"轻微磨损",6.14,"9.9~13.8",0.25,5,0.0174,52.56,0.13,0.5);
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(2,"武汉地铁3号线赵家条站~罗家庄站","腾达建设有限公司",2,1058,"2014.06~2015.01","土压","上海隧道/STEC-C1","0.15~0.2","0.7~0.9","3000~4000","15000~18000","15~25","开挖面注入水或泡沫，注入比为3%~5%","无","无","无",7.5,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(3,"武汉地铁6号线金银湖站~环湖西路站","上海城建市政（集团）有限公司",2,950,"2015.03~2015.08","土压","小松/TM-625","0.12~0.16","1~1.2","2200~2700","10000~14000","30~50","加泥，使用10%~15%的膨润土净浆，注入量为3~5方/环","无","无","无",15,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(4,"西安地铁2号线行政中心站~凤城五路站","中铁一局集团有限公司",2,1046,"2008.05~2008.07","土压","小松/TM-614","0.15~0.2","1.0","1800~2100","9000~14000","35~60","膨润土泥浆，膨润土:泥浆=1:10,注入率20%;泡沫剂，发泡液浓度2%，发泡倍率15，注入率20%~40%","无","无","无",17.1,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(5,"西安地铁3号线延平门站~科技路站","中铁隧道集团",2,1324,"2013.11~2014.05","土压","中铁装备/CTE6250","","1~1.3","2500~2900","10000~12000","20~25","采用膨润土泥浆和泡沫进行改良","无","无","刀盘圆环及辐条顶端补焊耐磨钢板，堆焊耐磨层",7.3,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(6,"北京地铁4号线颐和园站~圆明园站","中铁隧道集团",2,1528,"2006.01~2006.05","土压","中铁隧道","0.11~0.15","","8000~10000","5500~8000","45~75","采用膨润土泥浆和泡沫进行改良","无","无","刀具镶嵌耐磨合金块",14.7,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(7,"北京地铁5号线宋家庄站~刘家窑站","北京城建集团",2,1356,"2004.09~2005.01","土压","日立","0.1~0.15","1~1.2","","","40~60","无","无","无","无",11.3,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(8,"北京地铁6号线新华大街站~玉带河大街站","中铁十二局集团有限公司",2,1207,"2013.01~2013.09","土压","北方重工","0.12","1~1.2","2600~3100","14000~18000","55~80","采用泡沫剂和聚合物添加剂进行改良，注入比约70~80%","无","无","无",5.6,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(9,"徐州地铁1号线彭城广场站~文化宫站","中建五局有限公司",2,722,"2017.05~2017.10","土压","徐工集团/S1009","0.18~0.23","1.3~1.6","1700~2000","10000~15000","60~80","开挖面注入膨润土和泡沫，螺旋机内注入高分子材料","无","控制螺旋机闸门开口小于300mm","螺旋机叶片轴前部镶焊合金耐磨块",9.6,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(10,"徐州地铁1号线徐州火车站~站东广场站","中建五局有限公司",2,536,"2016.09~2016.12","土压","徐工集团/S1010","0.1~0.15","1.5~1.6","2100~2500","10000~12000","30~40","开挖面注入膨润土和泡沫，螺旋机内注入高分子材料","无","有","对刀盘面板及螺旋机叶片进行耐磨处理",6,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(11,"济南地铁1号线玉符河站~王府庄站","中铁十四局集团有限公司",2,1300,"2016.07~2017.02","土压","中铁装备/CTE6640","0.18~0.25","0.9~1","1200~1700","9000~12000","20~76","采用泡沫剂和水进行改良，盾壳外注入膨润土泥浆进行润滑","有","有","前端叶片上加装复合材料耐磨块",6.7,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(12,"济南地铁1号线某标段","中铁十八局集团有限公司",2,1562,"","土压","铁建重工/ZTE6650","0.17~0.22","0.6~1","1500~1900","6000~10000","30~40","采用泡沫剂和水进行改良，盾壳外注入膨润土泥浆进行润滑","有","有","前端叶片上加装复合材料耐磨块",10.4,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(13,"广州地铁2号线体育大厦站~广州火车站","中铁隧道集团",2,907,"2001.05~2001.09","土压","海瑞克","","1.6~2.2","3200~4000","12000~16000","30~50","开挖面注入泡沫，注入比为30%~60%；土仓注入膨润土，注入比约为20%~30%","无","无","无",7.7,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(14,"广州地铁4号线大学城南~新造站","中铁隧道集团",2,1200,"2004.7~2005.8","土压","小松","0.1~0.15","1.6~1.8","","9000~10000","20~30","向开挖面和土仓内注入泡沫，注入比为30%~60%；螺旋输送机内注入膨润土泥浆","无","无","无",7.6,"换刀一次");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(15,"广州地铁14号线嘉和望岗站~东平站","广东华隧建设集团",2,1890,"2015.10~2017.11","土压","海瑞克/S471","","","3200~3700","20000~25000","","开挖面注入泡沫，注入比为30%~60%；土仓注入膨润土","无","无","刀盘刀具进行耐磨保护处理",6,"换刀一次");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(16,"广佛线季华园~同济路站","",2,1100,"","土压","三菱/1638","0.15~0.22","1~1.2","","9000~13000","30~40","开挖面注入TAC高分子聚合物，注入比为5%~10%","无","无","无",5.7,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(17,"深圳地铁2号线湖贝站~黄贝岭站","中铁六局集团有限公司",2,934,"","土压","海瑞克","","1.2~1.5","2800~3200","","20~40","无","无","无","刀盘面板采用耐磨板，刀盘背部外圈和搅拌棒堆焊网状耐磨条",NULL,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(18,"深圳地铁9号线鹿丹村~人民南站","中建五局有限公司",2,729,"2014.03~2014.09","土压","中铁装备/CTE6250","","1.5~1.6","2100~2500","11000~12000","30~40","采用泡沫及膨润土泥浆进行改良","有","有","刀盘面板采用复合耐磨板覆盖，螺旋机前端叶片上加装复合材料耐磨块",4.8,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(19,"深圳地铁9号线深湾站~深圳湾公园站","中建八局有限公司",2,1207,"2013.10~2014.04","土压","中铁装备/CTE6250","","1.2~1.5","1200~2500","10000~18000","30~40","采用泡沫及膨润土泥浆进行改良","有","有","刀盘面板采用复合耐磨板覆盖，螺旋机前端叶片上加装复合材料耐磨块",6.7,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(20,"深圳地铁9号线上梅林站~梅村站","中建交通建设集团有限公司",2,630,"2014.10~2015.02","土压","维尔特/M161310","","1.3~1.5","1000~1300","8000~13000","35~50","采用泡沫及膨润土泥浆进行改良","无","无","无",5,"轻微磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(21,"深圳地铁9号线园岭站~红岭站","中建交通建设集团有限公司",2,696,"","土压","海瑞克/S292","","1.1~1.6","2000~3000","10000~15000","25~40","采用泡沫及膨润土泥浆进行改良","无","无","无",3.7,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(22,"深圳地铁9号线红岭站~红岭南站","中建交通建设集团有限公司",2,776,"","土压","海瑞克/ S472","","1.3~1.5","2300~2800","12000~16000","30~40","采用泡沫及膨润土泥浆进行改良","无","无","无",5.3,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(23,"深圳地铁9号线红岭南站~鹿丹村站","中建交通建设集团有限公司",2,459,"","土压","卡特彼勒","","1.1~1.4","1500~3000","10000~15000","25~35","采用泡沫及膨润土泥浆进行改良","无","无","无",5,"中度磨损");
INSERT INTO project(id,name,constru,ground,length,period,shield_type,manufac_model,soil_pressure,cutter_speed,torque,thrust,advance_speed,soil_improvement,pressure_pump,double_gate,wear_resistant,average_progress,tool_wear) VALUES(24,"深圳地铁11号线车公庙站~红树湾站","中铁隧道集团",2,5500,"2013.05~2014.09","土压","中铁装备/CTE6950","","0.9~1.5","2000","20000","30~50","采用泡沫及膨润土泥浆进行改良，泡沫原液比例1%，注入比30%；膨润土泥浆注入比为5%","无","无","无",12,"中度磨损");

alter table project add column province varchar(16);
alter table project add column pics varchar(16);

alter table project add cutter_dia DOUBLE,add cutter_type VARCHAR(16),add open_ratio FLOAT,add yuwei INT,add xianxing INT,add qiexiao INT,add guadao INT,add chaowa INT,add driver VARCHAR(16),add max_rotating FLOAT,add rated_torque INT,add break_torque INT,add foam INT,add bentonite INT,add max_thrust INT,add max_advance INT,add screw_type VARCHAR(16),add screw_dia FLOAT,add max_size VARCHAR(16),add max_capac FLOAT,add screw_tor FLOAT,add screw_speed FLOAT;
alter table project add shuangren INT after chaowa;
alter table project add danren INT after shuangren;
