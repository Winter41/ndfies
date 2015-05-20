require "rails_helper"

RSpec.describe Album, :type => :model do
  let!(:album) {create :album}

  describe "Album" do
    it "validates presence of name true"do
      expect(album.name).to eq "Oasis"
    end

    it "validates presence of name false" do
      album.update(name: nil)
      expect(album.name).to eq nil
    end

    it "validates length if name true" do
      expect("#{album.name}".length).to be < 15
    end

    it "validates length of name false" do
      album.update(name: "John Nics Garcia")
      expect("#{album.name}".length).to be > 15
    end


  end

end
