require 'rails_helper'

RSpec.feature 'User Session' do
  let!(:user) { create :user }

  scenario 'with valid credentials' do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content user.email
  end

  scenario 'with invalid email' do
    visit new_user_session_path

    fill_in "Email", with: "wat"
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content "Log in"
  end

  scenario 'with invalid password' do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "wat"

    click_button "Log in"

    expect(page).to have_content "Log in"
  end



end
