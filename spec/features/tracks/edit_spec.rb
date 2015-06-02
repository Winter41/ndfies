require 'rails_helper'

RSpec.feature 'Edit Track', type: :feature do
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
    visit edit_album_track_path(album, track)

    fill_in "Track", with: "Nics"
    click_button "Update Track"

    expect(page).to have_text "Nics"
  end

  scenario 'with invalid credentials' do
    visit edit_album_track_path(album, track)

    fill_in "Track", with: nil
    click_button "Update Track"

    expect(page).to have_text "Edit track"
  end

end
