module.exports = (app) ->
  app.post '/api/login', (req, res) ->
    req.session.loggedIn = req.body.remember

    res.send req.body

  app.get '/:page', (req, res) ->
    res.redirect "/#/#{req.params.page}"