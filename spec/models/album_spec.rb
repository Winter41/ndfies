require "rails_helper"

RSpec.describe Album, :type => :model do
  artist = Album.new(name: "Oasis")

  describe "Album" do
    it "validates presence of name true"do
      artist.save
      expect(artist.name).to eq "Oasis"
    end

    it "validates presence of name false" do
      artist.update(name: nil)
      artist.save
      expect(artist.name).to eq nil
    end
  end

end
