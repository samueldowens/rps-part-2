require_relative 'config/environment'

class GameApp < Sinatra::Base

  get '/' do
    redirect '/rps_game'
  end

  get '/rps_game' do
    erb :index
  end
  
  post '/result' do
     game = RPSGame.new(params["choice"])
     db = DB[:games]
     db.insert(:human_play => game.play.to_s, :computer_play => game.computer_play.to_s, :won => game.won?, :lost => game.lost?, :created_at => game.created_at)
     recent = db.reverse_order(:id).first

     redirect "rps_game_result/#{recent[:id]}"
  end

  get '/rps_game_result/:id' do
    db = DB[:games]
    @game = db[:id => params[:id].to_i]
    erb :game_result
  end

  get '/rps_game_results' do
    db = DB[:games]
    @games = db.reverse_order(:id).first(20)
    erb :game_results
  end



  # * POST /rps_game
  # - Form submissions should be sent here. The result of the game should
  #   be stored in the database. Users should be redirected to GET
  #   /rps_game_result/:id.

  # * GET /rps_game_result/:id
  # - Displays the result of the game with primary key :id.

  # * GET /rps_game_results
  # - A list of the last 20 game results ordered by most to least recent.

end
