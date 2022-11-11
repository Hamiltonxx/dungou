from tools import generate_n_random_digit, send_email
from config import r, mysqlconfig 
from aiohttp import web 
import aiomysql
import json

async def send_code_email(request):
    data = await request.json()
    email = data["email"]
    emailcode = generate_n_random_digit(6)
    await send_email(email, emailcode)
    r.set(emailcode, email, ex=300)
    returntext = "请前往邮箱确认"
    
    return web.Response(text=returntext)

async def email_register(request):
    data = await request.json()
    email = data["email"]
    emailcode = data["emailcode"]
    password = data["password"]
    if not password:
        return web.Response(text="密码不能为空")
    if r.exists(emailcode) and r.get(emailcode)==email:
        conn = await aiomysql.connect(**mysqlconfig)
        cur = await conn.cursor()
        await cur.execute(f"SELECT * FROM user WHERE email='{email}'")
        res = await cur.fetchone()
        if res:
            returntext = "邮箱已被注册"
        else:
            await cur.execute(f"INSERT INTO user(email,password) VALUES('{email}','{password}')")
            await conn.commit()
            # user = await select_user_info(cur, email=email)
            user = {"email":email,"name":"","phone":""}
            returntext = json.dumps(user, ensure_ascii=False)
        conn.close()
    else:
        returntext = "无效或过期验证码"
    return web.Response(text=returntext)

async def email_login(request):
    data = await request.json()
    email, password = data["email"],data["password"]
    conn = await aiomysql.connect(**mysqlconfig)
    cur = await conn.cursor()
    await cur.execute(f'SELECT id,name,phone,email,role FROM user WHERE email="{email}" AND password="{password}"')
    d = await cur.fetchone()
    if d:
        user = {"id":d[0],"name":d[1],"phone":d[2],"email":d[3],"role":d[4]}
        returntext = json.dumps(user, ensure_ascii=False)
    else:
        returntext = "账号错误或不存在"
    conn.close()
    return web.Response(text=returntext)