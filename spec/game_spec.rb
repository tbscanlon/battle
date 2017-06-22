require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2)}
  let(:player1) do
    player1 = double(:player1)
    allow(player1).to receive(:take_damage)
    player1
  end

  let(:player2) do
    player2 = double(:player2)
    allow(player2).to receive(:take_damage)
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

  describe '#attack' do
    it { is_expected.to respond_to(:attack).with(1).argument }

    it 'reduces the target\'s HP by 10' do
      expect { game.attack(player2) }.to_not raise_error
    end
  end
end
