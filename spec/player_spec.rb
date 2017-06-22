require 'player'

describe Player do
  let(:player) { described_class.new('Tom', 100) }

  it 'returns a name' do
    expect(player.name).to eq 'Tom'
  end

  it 'starts with 100HP' do
    expect(player.hp).to eq 100
  end

  describe '#take_damage' do
    it 'reduces 10 points on attack' do
      player.take_damage(10)
      expect(player.hp).to eq 90
    end
  end
end
