require 'sinatra'
require 'sinatra/asset_pipeline'
require 'sinatra/formkeeper'
require 'dotenv'
require 'slim'
require 'bootstrap-sass'

Dotenv.load

module Fyber
  class App < Sinatra::Base
    register Sinatra::AssetPipeline
    register Sinatra::FormKeeper

    form_messages File.expand_path(File.join(File.dirname(__FILE__), 'config', 'form_messages.yml'))

    get '/' do
      slim :index
    end

    post '/' do
      form do
        filters :strip
        field :uid, present: true
        field :pub, present: false
        field :page, present: true, int: { gt: 0 }
      end

      unless form.failed?
      end

      slim :index
    end
  end
end