require 'rails_helper'

RSpec.feature 'Delete Album', type: :feature do
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
    visit artist_path artist

    expect{ click_link "Delete" }.to change(Album, :count).by(-1)

  end

end
