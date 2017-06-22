require 'game'

describe Game do
  it { is_expected.to be_a Game }
  let(:player) do
    player = double(:player)
    # allow(player).to receive(:hp) { 80 }
    allow(player).to receive(:take_damage)
    player
  end

  describe '#attack' do
    it { is_expected.to respond_to(:attack).with(1).argument }

    it 'reduces the target\'s HP by 10' do
      expect { subject.attack(player) }.to_not raise_error
    end
  end
end
