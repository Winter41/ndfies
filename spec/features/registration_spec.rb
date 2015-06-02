require 'rails_helper'

RSpec.feature 'User Registration' do
  let!(:user) { build :user }

  scenario 'with valid credentials' do

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: user.password

    click_button 'Create Account'

    expect(page).to have_content user.email
  end

  scenario 'with invalid credentials' do

    visit new_user_registration_path

    fill_in 'Email', with: "wat"
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: user.password

    click_button 'Create Account'

    expect(page).to have_content "Email is invalid"
  end

  scenario 'with unmatching password' do

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: "wat"

    click_button 'Create Account'

    expect(page).to have_content "doesn't match"
  end

end
