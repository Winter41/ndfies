require 'rails_helper'

RSpec.feature 'Delete Artist', type: :feature do
  let!(:user)     { create :user }
  let!(:artist)   { create :artist}

  background do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"
  end

  scenario 'with valid credentials' do
    visit artists_path artist

    expect{ click_link "Delete" }.to change(Artist, :count).by(-1)

  end

end
