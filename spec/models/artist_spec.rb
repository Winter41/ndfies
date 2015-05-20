require "rails_helper"

RSpec.describe Artist, :type => :model do
  artist = Artist.create(name: "Nico Garcia")

  describe "Artist" do
    it "validates presence of name true"do
      expect(artist.name).to eq "Nico Garcia"
    end

    it "validates presence of name false" do
      artist.update(name: nil)
      expect(artist.name).to eq nil
    end


  end

end
