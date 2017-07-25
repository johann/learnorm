require 'bundler'
Bundler.require


require_relative '../lib/patient'

DB = {:conn => SQLite3::Database.new("db/hospital.rb")}
