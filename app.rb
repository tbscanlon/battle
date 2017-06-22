require 'sinatra/base'
require './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    p session[:player_1]
    p session[:player_2]
    redirect to('/play')
  end

  get '/play' do
    $one = Player.new(session[:player_1])
    $two = Player.new(session[:player_2])
    # p $one
    # p $two
    @player1_name = $one.name
    @player2_name = $two.name
    # @player_2_hp = session[:player_2_hp]
    erb(:play)
  end

  post '/attack' do
    # session[:player_2_hp] -= 10
    redirect to('/confirmation')
  end

  get '/confirmation' do
    erb(:attack)
  end

  run! if app_file == $0
end
