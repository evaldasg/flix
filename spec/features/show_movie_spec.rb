require 'spec_helper'

describe "Viewing an individual movie" do

  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text("388,736,000.00")
  end

end
