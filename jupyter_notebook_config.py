c = get_config()

c.NotebookApp.ip = '*'

c.NotebookApp.open_browser = False

c.NotebookApp.password = ''

# c.NotebookApp.port = 8888

c.NotebookApp.token = ''

c.NotebookApp.keyfile = '/home/dev/projects/cert/developer.yijianar.com.key'
c.NotebookApp.certfile = '/home/dev/projects/cert/developer.yijianar.com.pem'

c.NotebookApp.tornado_settings={'headers': {'Content-Security-Policy': ""}}