from tools import generate_n_random_digit, send_email
from config import r 
from aiohttp import web 

async def send_code_email(request):
    data = await request.json()
    email = data["email"]
    emailcode = generate_n_random_digit(6)
    await send_email(email, emailcode)
    r.set(emailcode, email)
    returntext = "请前往邮箱确认"
    
    return web.Response(text=returntext)