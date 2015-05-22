require 'rails_helper'

RSpec.describe TracksController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { create :artist }
  let!(:album)  { create :album }
  let!(:track)  { build :track }

  before { sign_in user }

  describe "#create" do
    context "with valid track params" do
      let(:subject) { post :create, track: {name: track.name}, artist_id: artist.id, album_id: album.id }

      it "creates a new track" do
        expect { subject }.to change(Track, :count).by(1)
      end

      it "redirects back to the #track page" do
        subject
        expect(response).to redirect_to album_track_path(assigns[:album], assigns[:track])
      end

      it "responds with a success message" do
        subject
        expect(flash[:success].present?).to eq true
      end
    end

    context "with invalid track params" do
      let(:subject) { post :create, track: {name: nil}, artist_id: artist.id, album_id: album.id }

      it "creates an invalid track" do
        expect { subject }.to change(Track, :count).by(0)
      end

      it "responds with an error message" do
        subject
        expect(flash[:error].present?).to eq true
      end
    end

  end

  describe "#update" do
    let!(:track)  { create :track, album: album }

    context "with valid params" do
      before { put :update, id: track.id, track: { name: "Nics" }, album_id: album.id }

      it "responds with a success message" do
        expect(flash[:success].present?).to eq true
      end
    end


    context "with invalid params" do
      before  { put :update, id: track.id, track: { name: nil }, album_id: album.id }

      it "responds with a failure messages" do
        expect(flash[:error].present?).to eq true
      end
    end

  end

  describe "#destroy" do
    let!(:track)  { create :track, album: album}
    before { delete :destroy, id: track.id, album_id: album.id }

    it "respond after deletion" do
      expect(flash[:success].present?).to eq true
    end
  end

end

