import redis 

mysqlconfig = {
    "host": "sh1.cirray.cn",
    "user": "hamilton",
    "password": "poiu0987",
    "db": "dungou"
}
redisconfig = {
    "host": "localhost",
    "port": 6379,
    "decode_responses": True 
}
pool = redis.ConnectionPool(**redisconfig)
r = redis.Redis(connection_pool=pool)

email_account = "service@yijianAR.com"
email_password = "Yijian2018"

prjcolumns = ["id","name","constru","ground","length","period","shield_type","manufac_model","soil_pressure","cutter_speed","torque","thrust","advance_speed","soil_improvement","pressure_pump","double_gate","wear_resistant","average_progress","tool_wear","shield_diameter","shield_depth","consistency_index","excavation_head","permeability","equivalent_quartz","restricted_particle","max_particle","province"]
