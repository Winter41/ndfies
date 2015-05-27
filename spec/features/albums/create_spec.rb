require 'rails_helper'

RSpec.feature 'Create Artists', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}
  let!(:album)    { build :album, artist: artist }

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario 'with valid credentials' do
    visit new_artist_album_path artist

    fill_in "Album", with: album.name
    click_button "Create Album"

    expect(page).to have_text album.name
  end

  scenario 'with invalid credentials' do
    visit new_artist_album_path artist

    fill_in "Album", with: nil
    click_button "Create Album"

    expect(page).to have_text "New album for"
  end

end
