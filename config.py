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

