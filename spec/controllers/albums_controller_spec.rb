require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let!(:user)   { create :user }
  let!(:artist) { create :artist}
  let!(:album)  { build :album }

  before { sign_in user }

  describe "#create" do
    let(:subject) { post :create, album: { name: album.name }, artist_id: artist.id }

    context "with valid params" do
      it "creates a new album" do
        expect { subject }.to change(Album, :count).by(1)
      end

      it "redirects back to the #album page" do
        subject
        expect(response).to redirect_to artist_album_path(assigns[:artist], assigns[:album])
      end

      it "responds with a success message" do
        subject
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid params" do
      let(:subject) { post :create, album: {name: nil}, artist_id: artist.id }

      it "creates an invalid album" do
        expect { subject }.to change(Album, :count).by(0)
      end

      it "responds with an error message" do
        subject
        expect(flash[:error]).to be_present
      end
    end
  end

  #describe "#update" do
    #let!(:artist) { create :artist }
    #let!(:album)  { create :album }
    #let(:subject) { put :update, album: { name: "Nics" }, artist_id: artist.id }

    #it "updates the artist" do
      #expect { subject } == "Nics"
    #end

    #it "responds with a success message" do
      #subject
      #expect(flash[:success]).to be_present
    #end

  #end

  #describe "#destroy" do
    #let!(:artist) { create :artist }
    #let!(:album)  { create :album }
    #it "deletes an artist" do
      #expect { delete :destroy, artist_id: artist.id, album_id: album.id }.to change(Artist, :count).by(-1)
    #end
  #end

end

