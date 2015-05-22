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
        expect(flash[:success].present?).to eq true
      end
    end

    context "with invalid params" do
      let(:subject) { post :create, artist: { name: nil } }

      it "creates an invalid artist" do
        expect { subject }.to change(Artist, :count).by(0)
      end

      it "responds with an error message" do
        subject
        expect(flash[:error].present?).to eq true
      end
    end
  end

  describe "#update" do
    let!(:artist) { create :artist }

    context "with valid params" do
      before { put :update, id: artist.id, artist: { name: "Nics" } }

      it "responds with a success message" do
        expect(flash[:success].present?).to eq true
      end

    end
    context "with invalid params" do
      before { put :update, id: artist.id, artist: { name: nil } }

      it "responds with a error message" do
        expect(flash[:error].present?).to eq true
      end
    end

  end

  describe "#destroy" do
    let!(:artist) { create :artist }
    before { delete :destroy, id: artist.id }

    it "respond after deletion" do
      expect(flash[:success].present?).to eq true
    end
  end

end
