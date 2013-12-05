exports.index = (req, res)->
  res.render('index', title: 'Bootstrapping iOS', release: '0.7')

exports.echoParams = (req, res)->
  res.json(req.query)

exports.echoBody = (req, res)->
  res.json(req.body)

exports.echoParamsWait = (req, res)->
  setTimeout(()->
    res.json(req.query)
  , 5000)
