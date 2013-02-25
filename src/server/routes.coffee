module.exports = (app) ->
  app.get '/:page', (req, res) ->
    res.redirect "/#/#{req.params.page}"