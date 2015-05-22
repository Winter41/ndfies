require 'rails_helper'

RSpec.describe TracksController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { create :artist }
  let!(:album)  { create :album }
  let!(:track)  { build :track }

  before { sign_in user }

  describe "#create" do
    it "creates a new track" do
      expect {
        post :create, track: {name: track.name}, artist_id: artist.id, album_id: album.id
      }.to change(Track, :count).by(1)
    end

    it "redirects back to the #track page" do
        post :create, track: {name: track.name}, artist_id: artist.id, album_id: album.id
        expect(response).to redirect_to album_track_path(assigns[:album], assigns[:track])
    end

    it "responds with a success message" do
      post :create, track: {name: track.name}, artist_id: artist.id, album_id: album.id
      expect(flash[:success]).to be_present
    end

    it "creates an invalid track" do
      expect {
        post :create, track: {name: nil}, artist_id: artist.id, album_id: album.id
      }.to change(Track, :count).by(0)
    end

    it "responds with an error message" do
      post :create, track: {name: track.name*3}, artist_id: artist.id, album_id: album.id
      expect(flash[:error]).to be_present
    end

  end

end

