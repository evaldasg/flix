require "spec_helper"

describe "Signing out" do
  it "removes the user id from the session" do
    user = create(:user)

    sign_in(user)

    click_link 'Sign Out'

    expect(page).to have_text('signed out')
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
  end
end
