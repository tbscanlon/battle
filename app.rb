require 'sinatra/base'
require './lib/player'
require './lib/game'

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
    $game.change_players
    erb(:play)
  end

  get '/attack' do
    $game.attack
    erb(:attack)
  end

  run! if app_file == $PROGRAM_NAME
end
