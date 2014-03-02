require 'spec_helper'

describe "Viewing the list of movies" do

  it "shows the movies" do
    movie1 = Movie.create(title: "Frozen",
                          rating: "PG",
                          total_gross: 388736000.00,
                          description: "Fearless optimist Anna teams up with Kristoff in an epic journey, encountering Everest-like conditions, and a hilarious snowman named Olaf in a race to find Anna's sister Elsa, whose icy powers have trapped the kingdom in eternal winter.",
                          released_on: "27 November 2013")
    movie2 = Movie.create(title: "Tangled",
                          rating: "PG",
                          total_gross: 200807262.00,
                          description: "The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.",
                          released_on: "24 November 2010")
    movie3 = Movie.create(title: "The Croods",
                          rating: "PG",
                          total_gross: 187165546.00,
                          description: "After their cave is destroyed, a caveman family must trek through an unfamiliar fantastical world with the help of an inventive boy.",
                          released_on: "22 March 2013")

    visit movies_url

    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text(movie1.released_on.year)
    expect(page).to have_text("388,736,000")
  end

end
