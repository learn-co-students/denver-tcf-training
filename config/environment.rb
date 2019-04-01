# require 'pry'
# require 'sqlite3'
# require_relative '../lib/dog.rb'

require 'bundler/setup'
Bundler.require

# load my files
# require_rel '../lib'
require_all 'lib'

# DB = SQLite3::Database.new('db/test.sqlite3')
# DB.results_as_hash = true
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/test.sqlite3"
)
