require 'sinatra'
require 'dotenv'
require 'slim'

Dotenv.load

module Fyber
  class App < Sinatra::Base
    get '/' do
      slim :index
    end
  end
end