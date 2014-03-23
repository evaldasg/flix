require 'spec_helper'

describe "Navigating movies" do

  it "allows navigation from the detail page to the listng page" do

    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "Released"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from the listing page to the detail page" do

    movie = Movie.create(movie_attributes)

    visit movies_url

    within('h2') { click_link movie.title }

    expect(current_path).to eq(movie_path(movie))

  end

  it "allows navigation to 'Upcoming' listing page" do
    movie = Movie.create(movie_attributes)

    visit movies_url

    click_link 'Upcoming'

    expect(current_path).to eq(filtered_movies_path(:upcoming))
  end

  it "allows navigation to the 'Recently Added' movies listing page" do
    movie = Movie.create(movie_attributes)

    visit movies_url

    click_link 'Recently Added'

    expect(current_path).to eq(recently_added_path)
  end

  it "allows navigation to the 'Hits' listing page" do
    movie = Movie.create(movie_attributes)

    visit movies_url

    click_link 'Hits'

    expect(current_path).to eq(filtered_movies_path(:hits))
  end

  it "allows navigation from the detail page to 'Reviews' page for the movie" do
    user = create(:user)
    sign_in(user)

    movie = create(:movie)

    visit movie_url(movie)

    click_link 'Reviews'

    expect(current_path).to eq(movie_reviews_path(movie))
  end
end
