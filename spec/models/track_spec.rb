require "rails_helper"

RSpec.describe Track, type: :model do
  let!(:track) {create :track}

  describe "track" do
    it "validates presence of name true"do
      expect(track.name).to eq "Flowing"
    end

    it "validates presence of name false" do
      track.update(name: nil)
      expect(track.name).to eq nil
    end

    it "validates length if name true" do
      expect("#{track.name}".length).to be < 15
    end

    it "validates length of name false" do
      track.update(name: "John Nics Garcia")
      expect("#{track.name}".length).to be > 15
    end

  end

end
