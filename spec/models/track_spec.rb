require "rails_helper"

RSpec.describe Track, :type => :model do
  artist = Track.new(name: "Clear")

  describe "Track" do
    it "validates presence of name true"do
      artist.save
      expect(artist.name).to eq "Clear"
    end

    it "validates presence of name false" do
      artist.update(name: nil)
      artist.save
      expect(artist.name).to eq nil
    end
  end

end
