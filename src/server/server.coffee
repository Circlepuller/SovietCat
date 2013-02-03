express = require 'express'
http = require 'http'

module.exports.createServer = () ->
	app = express()
	httpd = http.createServer app

	app.get '*', (req, res) -> res.write 'Hello, World!'

	return httpd