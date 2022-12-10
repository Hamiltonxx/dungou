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

async def projects_search(request):
    data = await request.json()
    ground = data['ground'] if "groud" in data else 2
    shield_depth = data['shield_depth'] if "shield_depth" in data else ''
    shield_diameter = data['shield_diameter'] if "shield_diameter" in data else ''
    manufac_model = data['manufac_model'] if "manufac_model" in data else ''
    consistency_index = data['consistency_index'] if "consistency_index" in data else ''
    excavation_head = data['excavation_head'] if "excavation_head" in data else ''
    permeability = data['permeability'] if "permeability" in data else ''
    restricted_particle = data['restricted_particle'] if "restricted_particle" in data else ''
    max_particle = data['max_particle'] if "max_particle" in data else ''
    equivalent_quartz = data['equivalent_quartz'] if "equivalent_quartz" in data else ''
    province = data['province'] if "province" in data else ''

    conn = await aiomysql.connect(**mysqlconfig)
    cur = await conn.cursor()
    sql = f"SELECT * FROM project WHERE ground={ground} AND shield_depth LIKE '%{shield_depth}%' AND shield_diameter LIKE '%{shield_diameter}%' AND manufac_model LIKE '%{manufac_model}%' AND consistency_index LIKE '%{consistency_index}%' AND excavation_head LIKE '%{excavation_head}%' AND permeability LIKE '%{permeability}%' AND restricted_particle LIKE '%{restricted_particle}%' AND max_particle LIKE '%{max_particle}%' AND equivalent_quartz LIKE '%{equivalent_quartz}%' AND province LIKE '%{province}%'"
    await cur.execute(sql)
    d = await cur.fetchall()
    result = []
    for p in d:
        result.append(dict(zip(prjcolumns,p)))
    conn.close()
    return web.Response(text=json.dumps(result, ensure_ascii=False))
