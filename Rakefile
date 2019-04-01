require_relative './config/environment'
require 'sinatra/activerecord/rake'

def reload
  load './config/environment.rb'
end

desc "Open a new console"
task :console do
  Pry.start # start pry with some environment
end
