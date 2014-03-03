require 'spec_helper'

describe "Viewing the list of movies" do

  it "shows the movies" do
    movie1 = Movie.create(movie_attributes)
    movie2 = Movie.create(title: "Tangled",
                          rating: "PG",
                          total_gross: 200807262.00,
                          description: "The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.",
                          released_on: "24 November 2010",
                          cast: "Mandy Moore, Zachary Levi, Donna Murphy, Ron Perlman",
                          director: "Nathan Greno, Byron Howard",
                          duration: 100,
                          image_file_name: "tangled.jpg")
    movie3 = Movie.create(title: "The Croods",
                          rating: "PG",
                          total_gross: 187165546.00,
                          description: "After their cave is destroyed, a caveman family must trek through an unfamiliar fantastical world with the help of an inventive boy. Traveling across a spectacular landscape, the Croods discover an incredible new world filled with fantastic creatures -- and their outlook is changed forever. Written by DreamWorks Animation",
                          released_on: "22 March 2013",
                          cast: "Nicolas Cage, Emma Stone, Ryan Reynolds, Catherine Keener, Cloris Leachman",
                          director: "Kirk De Micco, Chris Sanders",
                          duration: 98,
                          image_file_name: "croods.jpg")

    visit movies_url

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text(movie1.released_on.year)
    expect(page).to have_text("388,736,000")

    expect(page).to have_text(movie1.cast)
    expect(page).to have_text(movie1.duration)
    expect(page).to have_selector("img[src$='#{movie1.image_file_name}']")
  end

  it "does not show a movie that hasn't yet been released" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    visit movies_url

    expect(page).not_to have_text(movie.title)
  end
end
