require 'rails_helper'

RSpec.feature 'Delete Track', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}
  let!(:album)    { create :album, artist: artist }
  let!(:track)    { create :track, album: album }

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"
  end

  scenario 'with valid credentials' do
    visit artist_album_path(artist, album)

    expect{ click_link "Delete" }.to change(Track, :count).by(-1)

  end

end
