from aiohttp import web
import aiohttp_cors

from account import send_code_email

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
])

cors = aiohttp_cors.setup(app, defaults={
    "*": aiohttp_cors.ResourceOptions(expose_headers="*",allow_headers="*")
})
for route in list(app.router.routes()):
    cors.add(route)