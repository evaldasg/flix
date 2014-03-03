require 'spec_helper'

describe "Creating a new movie" do

  it "saves the movie and shows the new movie's details" do
    visit movies_url
    click_link 'Add New Movie'

    expect(current_path).to eq(new_movie_path)

    fill_in 'Title', with: 'New Title'
    fill_in 'Description', with: 'Super great film and very fun of course'
    fill_in 'Rating', with: "PG"
    fill_in 'Total gross', with: '75000000'
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in 'Cast', with: "The award-winning cast"
    fill_in 'Director', with: "123"
    fill_in 'Image file name', with: "movie.png"

    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Title')


  end
end
