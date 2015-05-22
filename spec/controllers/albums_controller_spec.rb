require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { create :artist}
  let!(:album)  { build :album }

  before { sign_in user }

  describe "#create" do
    it "creates a new album" do
      expect {
        post :create, album: {name: album.name}, artist_id: artist.id
      }.to change(Album, :count).by(1)
    end

    it "redirects back to the #album page" do
        post :create, album: {name: album.name}, artist_id: artist.id
        expect(response).to redirect_to artist_album_path(assigns[:artist], assigns[:album])
    end

    it "responds with a success message" do
      post :create, album: {name: album.name}, artist_id: artist.id
      expect(flash[:success]).to be_present
    end

    it "creates an invalid album" do
      expect {
        post :create, album: {name: nil}, artist_id: artist.id
      }.to change(Album, :count).by(0)
    end

    it "responds with an error message" do
      post :create, album: {name: album.name*3}, artist_id: artist.id
      expect(flash[:error]).to be_present
    end

  end

end

