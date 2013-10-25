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
     result = RPSGameResult.new({human_play: game.play.to_s, computer_play: game.computer_play.to_s, won: game.won?, lost: game.lost?, created_at: Time.now})
     redirect 'rps_game_result/#{result.id}'
  end

  get '/rps_game_result/:id' do
    binding.pry
    ds = DB[:rps_game]
    @game = ds.where(:id=>params[:id])
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
