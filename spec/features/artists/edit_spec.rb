require 'rails_helper'

RSpec.feature 'Edit Artist', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario 'with valid credentials' do
    visit edit_artist_path artist

    fill_in "Artist", with: "Nics"
    click_button "Update Artist"

    expect(page).to have_text "Nics"
  end

  scenario 'with invalid credentials' do
    visit edit_artist_path artist

    fill_in "Artist", with: nil
    click_button "Update Artist"

    expect(page).to have_text "Edit Artist"
  end

end
