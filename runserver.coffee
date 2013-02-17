require 'js-yaml'
mongoose = require 'mongoose'
server = require './src/server/server'

try
  config = require './config.yaml'

catch e
  console.error "#{e.name}: #{e.message}"
  process.exit 1

config.__dirname = __dirname

if config.db.username and config.db.password
  db = mongoose.createConnection "mongodb://#{config.db.username}:#{config.db.password}@#{config.db.host}:#{config.db.port}/#{config.db.database}"

else
  db = mongoose.createConnection "mongodb://#{config.db.host}:#{config.db.port}/#{config.db.database}"

[http, https] = server.createServer config, db

http.listen config.http.port
https.listen config.https.port