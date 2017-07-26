require 'bundler'
Bundler.require

require_relative '../lib/patient'
require_relative '../lib/doctor'
require_relative '../lib/appointment'

DB = {:conn => SQLite3::Database.new("db/niftyhospital.db")}
Pry.start
