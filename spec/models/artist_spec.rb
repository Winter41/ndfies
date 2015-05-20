require "rails_helper"

RSpec.describe Artist, :type => :model do
  let!(:artist) {create :artist}

  describe "Artist" do
    it "validates presence of name true"do
      expect(artist.name).to eq "Winter"
    end

    it "validates presence of name false" do
      artist.update(name: nil)
      expect(artist.name).to eq nil
    end

    it "validates length if name true" do
      expect("#{artist.name}".length).to be < 15
    end

    it "validates length of name false" do
      artist.update(name: "John Nics Garcia")
      expect("#{artist.name}".length).to be > 15
    end


  end

end
