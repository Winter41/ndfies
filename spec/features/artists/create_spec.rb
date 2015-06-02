require 'rails_helper'

RSpec.feature 'Create Artist', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { build :artist }

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"
  end

  scenario 'with valid credentials' do
    visit new_artist_path

    fill_in "Artist", with: artist.name
    click_button "Create Artist"

    expect(page).to have_text artist.name
  end

  scenario 'with invalid credentials' do
    visit new_artist_path

    fill_in "Artist", with: nil
    click_button "Create Artist"

    expect(page).to have_text "New Artist"
  end

end
