exports.index = (req, res)->
  res.render('index', title: 'Bootstrapping iOS', release: '0.5')

exports.echoParams = (req, res)->
  res.json(req.query)

exports.echoBody = (req, res)->
  res.json(req.body)
