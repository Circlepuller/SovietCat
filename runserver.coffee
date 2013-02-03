server = require './src/server/server'

httpd = server.createServer()

httpd.listen 8001