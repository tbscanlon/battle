def sign_in_and_play
  visit '/'
  fill_in 'player-1', with: 'Tom'
  fill_in 'player-2', with: 'Verity'
  click_button('Play')
end

def players_attack
  click_button("Attack")
  click_button("Continue")
end

def both_players_attack_once
  sign_in_and_play
  2.times { players_attack }
end

def both_players_attack_ten_times
  sign_in_and_play
  19.times { players_attack }
end
