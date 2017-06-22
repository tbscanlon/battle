require './app.rb'

feature Battle do
  describe 'index.erb' do
    before do
      visit '/'
    end

    it 'shows an expected string' do
      expect(page).to have_content 'Welcome to Battle'
    end

    it 'Prompts the user to enter names' do
      expect(page).to have_content 'Enter your Names'
    end

    describe 'Player Name Form' do
      it 'has a text field for player 1' do
        expect { find_field('player-1') }.to_not raise_error
      end

      it 'has a text field for player 2' do
        expect { find_field('player-2') }.to_not raise_error
      end

      it 'has a submit button' do
        expect { find_button('Play') }.to_not raise_error
      end
    end
  end

  describe 'play.erb' do
    before do
      sign_in_and_play
    end

    it 'displays player names' do
      expect(page).to have_content 'Verity'
    end

    it "displays Player 1's hit points" do
      expect(page).to have_content 'Player 1 HP: 100'
    end

    it "displays Player 2's hit points" do
      expect(page).to have_content 'Player 2 HP: 100'
    end
  end

  describe 'attacking players' do
    before do
      sign_in_and_play
      click_button('Attack')
    end

    it 'gives an attack confirmation' do
      expect(page).to have_content 'Attack reduced other player\'s HP by 10'
    end

    it 'should allow the player to continue' do
      expect { find_button('Continue') }.to_not raise_error
    end
  end

  describe "Changing Turns" do
    before do
      both_players_attack_once
    end

    it 'reduces player 1\'s HP by 10' do
      expect(page).to have_content 'Player 1 HP: 90'
    end

    it 'reduces player 2\'s HP by 10' do
      expect(page).to have_content 'Player 2 HP: 90'
    end
  end
end
