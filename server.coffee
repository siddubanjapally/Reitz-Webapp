express = require 'express'
http = require 'http'
path = require 'path'
request = require 'request'
routes = require './server/routes.js'
apis = require './server/apis.js'
app = express()
app.set 'port',process.env.PORT || 8888

app.configure ->
  app.set "view engine", "jade"
  app.set "views", __dirname + "/client/views"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.json()
  app.use express.static(path.join(__dirname + '/client'))
  app.use app.router
app.get('/', routes.index)
app.get('/customer/:name', routes.customer)

app.post '/api/logindata',apis.logindata
app.post('/api/postdata',apis.postdata)
app.get('*', routes.index)

http.createServer(app).listen app.get('port'),() ->
   console.log 'Express server listening on port ' + app.get('port')
