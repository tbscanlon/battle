require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect to('/play')
  end

  get '/play' do
    @player1_name = $game.player1.name
    @player2_name = $game.player2.name
    erb(:play)
  end

  get '/attack' do
    $game.attack
    $game.change_players
    erb(:attack)
  end

  run! if app_file == $PROGRAM_NAME
end
