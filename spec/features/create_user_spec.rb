require "spec_helper"

describe "Creating a new user" do

  it "saves the user and shows the user's profile page" do
    visit root_url

    click_link 'Sign Up'

    expect(current_path).to eq(signup_path)

    fill_in 'Name', with: 'User'
    fill_in 'Username', with: 'Username'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'

    click_button 'Create Account'

    expect(current_path).to eq(user_path(User.last))

    expect(page).to have_text('User')
    expect(page).to have_text('Thanks for signing up!')
  end

  it "does not save the user if it's invalid" do
    visit signup_url

    expect {
      click_button 'Create Account'
    }.not_to change(User, :count)

    expect(page).to have_text('error')
  end
end
