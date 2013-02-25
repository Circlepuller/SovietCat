module.exports = (app) ->
  app.post '/api/login', (req, res) ->
    res.send req.body

  app.get '/:page', (req, res) ->
    res.redirect "/#/#{req.params.page}"