from config import mysqlconfig,prjcolumns
from aiohttp import web 
import aiomysql
import json

async def projects(request):
    conn = await aiomysql.connect(**mysqlconfig)
    cur = await conn.cursor()
    await cur.execute(f'SELECT * FROM project')
    d = await cur.fetchall()
    result = []
    for p in d:
        result.append(dict(zip(prjcolumns,p)))
    conn.close()
    return web.Response(text=json.dumps(result, ensure_ascii=False))