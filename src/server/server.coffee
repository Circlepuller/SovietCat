#connect_mongo = require 'connect_mongo'
express = require 'express'
fs = require 'fs'
http = require 'http'
https = require 'https'

module.exports.createServer = (config) ->
  app = express()

  app.use express.static "#{config.__dirname}/public"
  app.use express.logger 'dev'
  app.set 'views', "#{config.__dirname}/src/jade"
  app.set 'view engine', 'jade'
  app.use app.router # routes.coffee should be created before running this file!

  return [
    http.createServer app
    https.createServer
      key: fs.readFileSync "#{config.__dirname}/#{config.key}"
      cert: fs.readFileSync "#{config.__dirname}/#{config.cert}"
    , app
  ]