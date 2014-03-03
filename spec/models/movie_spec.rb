require 'spec_helper'

describe "A movie" do
  it "is a flop if the total gross is less than $50M" do
    movie = Movie.new(total_gross: 45000000)

    expect(movie).to be_flop
  end

  it "is not a flop if the total gross is greater than $50M" do
    movie = Movie.new(total_gross: 50000000)

    expect(movie).not_to be_flop
  end

  it "is released when the released on date is in the past" do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))

    expect(Movie.released).to include(movie)
  end

  it "is not released when the released on date is in the future" do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))

    expect(Movie.released).not_to include(movie)
  end

  it "returns released movies ordered with the most recently-released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end

  it "returns upcoming movies ordered with most soonest upcoming movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.from_now))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.from_now))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.from_now))

    expect(Movie.upcoming).to eq([movie3, movie2, movie1])
  end

  it "returns hits movies where total gross is greater than $200M ordered with the bigest gross" do
    movie1 = Movie.create(movie_attributes(total_gross: 200000001))
    movie2 = Movie.create(movie_attributes(total_gross: 300000001))
    movie3 = Movie.create(movie_attributes(total_gross: 400000001))

    expect(Movie.hits).to eq([movie3, movie2, movie1])
  end

  it "returns flops movies where total gross is less than $50M ordered with the bigest gross" do
    movie1 = Movie.create(movie_attributes(total_gross: 20000001))
    movie2 = Movie.create(movie_attributes(total_gross: 30000001))
    movie3 = Movie.create(movie_attributes(total_gross: 40000001))

    expect(Movie.flops).to eq([movie3, movie2, movie1])
  end

  it "returns the 3 recently added movies" do
    movie1 = Movie.create(movie_attributes)
    movie2 = Movie.create(movie_attributes)
    movie3 = Movie.create(movie_attributes)
    movie4 = Movie.create(movie_attributes)

    expect(Movie.recently_added).to eq([movie4, movie3, movie2])
  end
end
