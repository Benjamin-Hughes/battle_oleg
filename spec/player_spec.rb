require 'player'

describe 'Player' do
   subject(:bob) { Player.new("Bob") }

  it "checks player's name" do
    expect(bob.name).to eq "Bob"
  end

  describe "#points" do
    it "returns the current hit points" do
      expect(bob.points).to eq Player::DEFAULT_POINTS
    end
  end

  describe "#reduce_points" do
    it "reduces player's points" do
       srand(4)
      expect{bob.reduce_points}.to change {bob.points}.by(-11)
    end
  end
end
