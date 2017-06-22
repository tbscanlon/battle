require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2)}
  let(:player1) do
    player1 = double(:player1)
    allow(player1).to receive(:take_damage) { 80 }
    player1
  end

  let(:player2) do
    player2 = double(:player2)
    allow(player2).to receive(:take_damage) { 90 }
    player2
  end


  describe '#attributes' do
    it 'has player1' do
      expect(game).to respond_to(:player1)
    end

    it 'has player2' do
      expect(game).to respond_to(:player2)
    end
  end

  describe '#change_players' do
    it {is_expected.to respond_to(:change_players) }

    context "Switching turns" do

      before do
        game.change_players
      end

      it 'switches to player 2' do
        expect(game.change_players).to eq false
      end

      it 'switches back to player 1' do
        game.change_players
        expect(game.change_players).to eq true
      end
    end
  end

  describe '#attack' do

    before do
      game.change_players
    end
    
    it { is_expected.to respond_to(:attack) }

    context "Player 1's Turn" do
      it 'attacks player 2' do
        expect(game.attack).to eq 90
      end
    end

    context "Player 2's turn" do
      it 'attacks player 1' do
        game.change_players
        expect(game.attack).to eq 80
      end
    end
  end
end
