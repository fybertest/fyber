require 'sinatra'

module Fyber
  class App < Sinatra::Base
    get '/' do
      'Fyber!'
    end
  end
end