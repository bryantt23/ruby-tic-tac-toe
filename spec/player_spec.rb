require_relative "../lib/player"

RSpec.describe Player do
  describe "#initialize" do
    it "sets the symbol" do
      player = Player.new("X")
      expect(player.symbol).to eq("X")
    end

    it "can also set a name" do
      player = Player.new("O", "Alice")
      expect(player.symbol).to eq("O")
      expect(player.name).to eq("Alice")
    end
  end
end
