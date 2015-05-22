require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { build :artist }

  before { sign_in user }

  describe "#create" do
    it "creates a new artist" do
      expect {
        post :create, artist: {name: artist.name}
      }.to change(Artist, :count).by(1)
    end

    it "redirects back to the #artist page" do
        post :create, artist: {name: artist.name}
        expect(response).to redirect_to artist_path(assigns[:artist])
    end

    it "responds with a success message" do
      post :create, artist: {name: artist.name}
      expect(flash[:success]).to be_present
    end

    it "creates an invalid artist" do
      expect {
        post :create, artist: {name: artist.name*3}
      }.to change(Artist, :count).by(0)
    end

    it "responds with an error message" do
      post :create, artist: {name: artist.name*3}
      expect(flash[:error]).to be_present
    end

  end

end

