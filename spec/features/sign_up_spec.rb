require 'spec_helper'

describe "the sign up process", :type => :feature do
  it "registers a new user" do
    visit '/users/sign_up'
    within('#new_user') do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
