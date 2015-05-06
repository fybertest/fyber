require 'sinatra'
require 'dotenv'


Dotenv.load

module Fyber
  class App < Sinatra::Base
    get '/' do
      'Fyber!'
    end
  end
end