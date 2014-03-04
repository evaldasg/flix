require 'spec_helper'

describe "Viewing a list of reviews" do

   it "shows the reviewes for a specific movie" do
    movie1 = Movie.create(movie_attributes(title: "Alladin"))
    review1 = movie1.reviews.create(review_attributes(name: "Giuliet"))
    review2 = movie1.reviews.create(review_attributes(name: "Milda"))

    movie2 = Movie.create(movie_attributes(title: "Bug's life"))
    review3 = movie2.reviews.create(review_attributes(name: "Paulina"))

    visit movie_reviews_url(movie1)

    expect(page).to have_text(review1.name)
    expect(page).to have_text(review2.name)
    expect(page).not_to have_text(review3.name)
   end
 end
