express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
appygram = require 'appygram'

app = express()
# Add Connect Assets
app.use assets()
# Set the public folder as static assets
app.use express.static(process.cwd() + '/public')
# Set View Engine
app.set 'view engine', 'jade'
# Set Appygram credentials and init
app.use app.router
appygram.setApiKey('cb96a697cec9bb9c1a57db549bb3d1b00129a7af')
appygram.format = 'text'
app.use appygram.errorHandler

# Get root_path return index view
app.get '/', (req, resp) -> 
  resp.render 'index'

app.get '/test_error', (req, resp)->
  require 'test_appygram_message_handler_blah_blah'
# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."

