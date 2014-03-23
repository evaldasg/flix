require 'spec_helper'

describe "Viewing an individual movie" do

  it "shows the movie's details" do
    movie = Movie.create(movie_attributes(total_gross: 388736000.00))

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text("388,736,000")

    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")

  end

  it "shows the total gross if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 600000000))

    visit movie_url(movie)

    expect(page).to have_text("$600,000,000")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 45000000))

    visit movie_url(movie)

    expect(page).to have_text("Flop!")
  end

  it "shows the movie's fans and genres in the sidebar" do
    movie = create(:movie)

    user = create(:user)
    movie.fans << user

    genre = create(:genre)
    movie.genres << genre

    visit movie_url(movie)

    within("aside#sidebar") do
      expect(page).to have_text(user.name)
      expect(page).to have_text(genre.name)
    end
  end

  it "includes the movie's title in the page title" do
    movie = create(:movie)

    visit movie_url(movie)

    expect(page).to have_title("Top Animations - #{movie.title}")
  end
end
