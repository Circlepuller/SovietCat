require 'js-yaml'
server = require './src/server/server'

try
  config = require './config.yaml'

catch e
  console.error "#{e.name}: #{e.message}"
  process.exit 1

config.__dirname = __dirname

[http, https] = server.createServer(config)

http.listen 8001
https.listen 8002