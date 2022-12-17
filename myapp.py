from aiohttp import web
import aiohttp_cors

from account import send_code_email, email_register, email_login
from project import projects, projects_search, projects_import, projects_export, projects_add,projects_delete,projects_update

async def helloworld(request):
    if request.body_exists:
        data = await request.json()
        return web.json_response(data)
    else:
        return web.Response(text="Hello World")

app = web.Application()
app.add_routes([web.get('/helloworld',helloworld),
                web.post('/helloworld',helloworld),
                web.post('/send_code_email',send_code_email),
                web.post('/email_register',email_register),
                web.post('/email_login',email_login),
                web.get('/projects',projects),
                web.post('/projects_search',projects_search),
                web.post('/projects_import',projects_import),
                web.get('/projects_export',projects_export),
                web.post('/projects_add',projects_add),
                web.post('/projects_delete',projects_delete),
                web.post('/projects_update',projects_update),

])

cors = aiohttp_cors.setup(app, defaults={
    "*": aiohttp_cors.ResourceOptions(expose_headers="*",allow_headers="*")
})
for route in list(app.router.routes()):
    cors.add(route)