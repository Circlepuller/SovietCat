#connect_mongo = require 'connect_mongo'
express = require 'express'
fs = require 'fs'
http = require 'http'
https = require 'https'

module.exports.createServer = (config, db) ->
  app = express()

  app.set 'views', "#{config.__dirname}/src/jade"
  app.set 'view engine', 'jade'

  app.use express.logger()
  app.use express.compress()
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.methodOverride()
  app.use express.responseTime()

  app.use express.staticCache() # Can greatly improve performance at expense of memory
  app.use express.static "#{config.__dirname}/public"

  app.use express.favicon()

  app.configure 'development', () ->
    app.use express.errorHandler
      dumpExceptions: true
      showStack: true

  app.configure 'production', () ->
    app.use express.errorHandler()

  app.use app.router # routes.coffee should be created before running this file!

  return [
    http.createServer app
    https.createServer
      key: fs.readFileSync "#{config.__dirname}/#{config.https.key}"
      cert: fs.readFileSync "#{config.__dirname}/#{config.https.cert}"
    , app
  ]