require 'spec_helper'

describe "Viewing a list of reviews" do

  before do
    @user = create(:user)
    sign_in(@user)
  end

  it "shows the reviewes for a specific movie" do
    movie1 = create(:movie)
    review1 = movie1.reviews.create!(review_attributes(comment: "one one", user: @user))
    review2 = movie1.reviews.create!(review_attributes(comment: "two two one", user: @user))

    movie2 = create(:movie)
    review3 = movie2.reviews.create!(review_attributes(comment: "three three one", user: @user))

    visit movie_reviews_url(movie1)

    expect(page).to have_text(review1.comment)
    expect(page).to have_text(review2.comment)
    expect(page).not_to have_text(review3.comment)
  end
end
