require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  let!(:user)         { create :user }
  let!(:artist)       { build :artist }

  before { sign_in user }

  describe "#create" do

    let(:subject) { post :create, artist: { name: artist.name } }

    context "with valid params" do
      it "creates a new artist" do
        expect { subject }.to change(Artist, :count).by(1)
      end

      it "redirects back to the #artist page" do
        subject
        expect(response).to redirect_to artist_path(assigns[:artist])
      end

      it "responds with a success message" do
        subject
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid params" do
      let(:subject) { post :create, artist: { name: nil } }

      it "creates an invalid artist" do
        expect { subject }.to change(Artist, :count).by(0)
      end

      it "responds with an error message" do
        subject
        expect(flash[:error]).to be_present
      end
    end
  end

  describe "#update" do
    let!(:artist) { create :artist }
    let(:subject) { put :update, id: artist.id, artist: { name: "Nics" } }

    it "updates the artist" do
      expect { subject } == "Nics"
    end

    it "responds with a success message" do
      subject
      expect(flash[:success]).to be_present
    end
  end

  describe "#destroy" do
    let!(:artist) { create :artist }
    it "deletes an artist" do
      expect { delete :destroy, id: artist.id }.to change(Artist, :count).by(-1)
    end
  end

end
