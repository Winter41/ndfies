require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { create :artist}
  let!(:album)  { build :album, artist: artist}


  before { sign_in user }

  describe "#create" do
    context "with valid params" do
      let(:subject) { post :create, album: { name: album.name }, artist_id: artist.id }
      it "creates a new album" do
        expect { subject }.to change(Album, :count).by(1)
      end

      it "redirects back to the #album page" do
        subject
        expect(response).to redirect_to artist_album_path(assigns[:artist], assigns[:album])
      end

      it "responds with a success message" do
        subject
        expect(flash[:success].present?).to eq true
      end
    end

    context "with invalid params" do
      let(:subject) { post :create, album: {name: nil}, artist_id: artist.id }

      it "creates an invalid album" do
        expect { subject }.to change(Album, :count).by(0)
      end

      it "responds with an error message" do
        subject
        expect(flash[:error].present?).to eq true
      end
    end

  end

  describe "#update" do
    let!(:album)  { create :album, artist: artist }

    context "with valid params" do
      before { put :update, id: album.id, album: { name: "Nics" }, artist_id: artist.id }

      it "responds with a success message" do
        expect(flash[:success].present?).to eq true
      end
    end

    context "with invalid params" do
      before { put :update, id: album.id, album: { name: nil }, artist_id: artist.id }

      it "responds with an error message" do
        expect(flash[:error].present?).to eq true
      end
    end

  end

  describe "#destroy" do
    let!(:album)  { create :album, artist: artist}
    before { delete :destroy, id: album.id, artist_id: artist.id }

    it "responds after deletion" do
      expect(flash[:success].present?).to eq true
    end
  end

end


