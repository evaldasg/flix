require 'spec_helper'

describe "Viewing the list of users" do

  it "shows the users" do
    user1 = User.create!(user_attributes(name: "User1", email: "user1@e.com"))
    user2 = User.create!(user_attributes(name: "User2", email: "user2@e.com"))
    user3 = User.create!(user_attributes(name: "User3", email: "user3@e.com"))

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
  end
end
