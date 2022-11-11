from aiohttp import web 
import myapp 

web.run_app(myapp.app, port=9000)
