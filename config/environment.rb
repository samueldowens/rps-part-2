require 'bundler/setup'

Bundler.require


DB = Sequel.connect('sqlite://db/rps_game.db', integer_booleans: true)

require_relative '../models/rps_game'
require_relative '../models/rps_game_result'

require './app'
