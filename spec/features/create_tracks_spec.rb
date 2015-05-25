require 'rails_helper'

RSpec.feature 'Create Artists', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}
  let!(:album)    { create :album, artist: artist }
  let!(:track)    { build :track, album: album }

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario 'with valid credentials' do
    visit new_album_track_path album

    fill_in "Track", with: track.name
    click_button "Create Track"

    expect(page).to have_text track.name
  end

  scenario 'with invalid credentials' do
    visit new_album_track_path album

    fill_in "Track", with: nil
    click_button "Create Track"

    expect(page).to have_text "New track for"
  end

end
