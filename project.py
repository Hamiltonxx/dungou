from config import mysqlconfig,prjcolumns
from aiohttp import web 
import aiomysql
import json
from openpyxl import load_workbook, Workbook

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

async def projects_export(request):
    # with open("projects_export.xlsx",'wb+') as f:
    wb = Workbook()
    sheet = wb.active
    sheet.append(("ID","工程名","施工单位","穿越地层","区间长度(m)","起止时间","盾构类型","盾构厂家/型号","土仓压力(MPa)","刀盘转速(r/min)","扭矩(kN.m)","推力(kN)","推进速度(mm/min)","土体改良","保压泵","双闸门","耐磨措施","平均进度(m/d)","刀具磨损","盾构直径(m)","盾构埋深(m)","稠度指数","开挖面水头(m)","渗透系数(cm/s)","等效石英含量(%)","限制粒径(mm)","最大粒径(mm)","省份"))
    conn = await aiomysql.connect(**mysqlconfig)
    cur = await conn.cursor()
    await cur.execute("SELECT * FROM project")
    d = await cur.fetchall()
    for r in d:
        sheet.append(r)
    wb.save("projects_export.xlsx")
    conn.close()
    return web.FileResponse("projects_export.xlsx")

async def projects_import(request):
    data = await request.post()
    input_file = data['projects'].file
    content = input_file.read()
    with open("projects.xlsx", 'wb+') as f:
        f.write(content)
    wb = load_workbook("projects.xlsx")
    sheet = wb.active
    conn = await aiomysql.connect(**mysqlconfig)
    cur = await conn.cursor()
    for row in sheet.iter_rows():
        print(row[0].value, row[1].value,row[4].value)
        sql=f"UPDATE project SET shield_diameter={row[1].value},shield_depth='{row[2].value}',consistency_index={row[3].value},excavation_head={row[4].value},permeability={row[5].value},equivalent_quartz={row[6].value},restricted_particle={row[7].value},max_particle={row[8].value} WHERE id={row[0].value}"
        print(sql)
        await cur.execute(sql)
    await conn.commit()
    conn.close()
    
    return web.Response(text="OK")
