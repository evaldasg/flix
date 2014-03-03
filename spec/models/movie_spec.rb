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

  it "requires a title" do
    movie = Movie.new(title: "")

    expect(movie.valid?).to be_false
    expect(movie.errors[:title].any?).to be_true
  end

  it "requires a description" do
    movie = Movie.new(description: "")

    expect(movie.valid?).to be_false
    expect(movie.errors[:description].any?).to be_true
  end

  it "requires a released on date" do
    movie = Movie.new(released_on: "")

    expect(movie.valid?).to be_false
    expect(movie.errors[:released_on].any?).to be_true
  end

  it "requires a duration" do
    movie = Movie.new(duration: "")

    expect(movie.valid?).to be_false
    expect(movie.errors[:duration].any?).to be_true
  end

  it "requires a description over 24 characters" do
    movie = Movie.new(description: "x" * 24)

    expect(movie.valid?).to be_false
    expect(movie.errors[:description].any?).to be_true
  end

  it "accepts a $0 total gross" do
    movie = Movie.new(total_gross: 0.00)

    expect(movie.valid?).to be_false
    expect(movie.errors[:total_gross].any?).to be_false
  end

  it "accepts a positive total gross" do
    movie = Movie.new(total_gross: 10000000.00)

    expect(movie.valid?).to be_false
    expect(movie.errors[:total_gross].any?).to be_false
  end

  it "rejects a negative total gross" do
    movie = Movie.new(total_gross: -1000000.00)

    expect(movie.valid?).to be_false
    expect(movie.errors[:total_gross].any?).to be_true
  end

  it "accepts properly formatted image file names" do
    file_names = %w[e.png movie.png movie.jpg movie.gif MOVIE.GIF]
    file_names.each do |fn|
      movie = Movie.new(image_file_name: fn)

      expect(movie.valid?).to be_false
      expect(movie.errors[:image_file_name].any?).to be_false
    end
  end

  it "rejects improperly formatted image file names" do
    file_names = %w[movie .jpg .png .gif movie.pdf movie.doc]
    file_names.each do |fn|
      movie = Movie.new(image_file_name: fn)

      expect(movie.valid?).to be_false
      expect(movie.errors[:image_file_name].any?).to be_true
    end
  end

  it "accepts any ratings that is in an approved list" do
    ratings = %w[G PG PG-13 R NC-17]
    ratings.each do |r|
      movie = Movie.new(rating: r)

      expect(movie.valid?).to be_false
      expect(movie.errors[:rating].any?).to be_false
    end
  end

  it "rejects any rating that is not in the approved list" do
    ratings = %w[R-13 R-16 N S R-18 R-21]
    ratings.each do |r|
      movie = Movie.new(rating: r)

      expect(movie.valid?).to be_false
      expect(movie.errors[:rating].any?).to be_true
    end
  end

  it "is valid with example attributes" do
    movie = Movie.new(movie_attributes)

    expect(movie.valid?).to be_true
  end

  it "accepts duration only integer and not more than 3 char. length" do
    durations = [0, 10, 999]
    durations.each do |d|
      movie = Movie.new(duration: d)

      expect(movie.valid?).to be_false
      expect(movie.errors[:duration].any?).to be_false
    end
  end

  it "rejects duration when length is more than 3 and when not integer" do
    durations = [3333, 44444, 55555, "3r4", "er", "e"]
    durations.each do |d|
      movie = Movie.new(duration: d)

      expect(movie.valid?).to be_false
      expect(movie.errors[:duration].any?).to be_true
    end
  end
end
