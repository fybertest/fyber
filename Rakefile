require 'sinatra/asset_pipeline/task'
require './app'

Sinatra::AssetPipeline::Task.define! Fyber::App

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)