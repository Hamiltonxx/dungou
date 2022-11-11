import time 
from email.message import EmailMessage
import smtplib 
import random

from config import email_account, email_password

def nowstr():
    return time.strftime('%Y-%m-%d %H:%M:%S')

def generate_n_random_digit(n):
    return ''.join(["{}".format(random.randint(0, 9)) for num in range(0, n)])

async def send_email(to, randstr):
    msg = EmailMessage()
    now = nowstr()
    msg['Subject'] = f"平台验证码 - {now}"
    msg['From'] = 'service@yijianAR.com'
    msg['To'] = to 
    msg.set_content(f'您好:\n。\n您的验证码为\n\t{randstr}\n验证码5分钟有效。\n')

    s = smtplib.SMTP_SSL('smtp.yijianar.com',465)
    s.login(email_account, email_password)
    s.send_message(msg)
    s.quit()
    print("send email done")
