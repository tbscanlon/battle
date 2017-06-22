def sign_in_and_play
  visit '/'
  fill_in 'player-1', with: 'Tom'
  fill_in 'player-2', with: 'Verity'
  click_button('Play')
end

def both_players_attack_once
  sign_in_and_play
  click_button("Attack")
  click_button("Continue")
  click_button("Attack")
  click_button("Continue")
end
