require 'rails_helper'

RSpec.feature 'Edit Album', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}
  let!(:album)    { create :album, artist: artist }

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"
  end

  scenario 'with valid credentials' do
    visit edit_artist_album_path(artist, album)

    fill_in "Album", with: album.name
    click_button "Update Album"

    expect(page).to have_text album.name
  end

  scenario 'with invalid credentials' do
    visit edit_artist_album_path(artist, album)

    fill_in "Album", with: nil
    click_button "Update Album"

    expect(page).to have_text "Edit album"
  end

end
