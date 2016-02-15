require 'rubygems'
require 'bundler'
Bundler.require

require './models/asana'

require './app'

use Rack::MethodOverride
run AsanasApp