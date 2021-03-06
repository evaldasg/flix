require 'spec_helper'

describe "Creating a new movie" do
  before do
      admin = create(:user, admin: true)
      sign_in(admin)
      @genres = create_list(:genre, 3)
  end

  it "saves the movie and shows the new movie's details" do
    visit movies_url
    click_link 'Add New Movie'

    expect(current_path).to eq(new_movie_path)

    fill_in 'Title', with: 'New Title'
    fill_in 'Description', with: 'Super great film and very fun of course'
    select 'PG-13', :from => "movie_rating"
    fill_in 'Total gross', with: '75000000.00'
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    fill_in 'Cast', with: "The award-winning cast"
    fill_in 'Director', with: "123"
    fill_in 'Image file name', with: "movie.png"
    fill_in 'Duration', with: '100'
    check(@genres[0].name)
    check(@genres[1].name)

    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))

    expect(page).to have_text('New Title')
    expect(page).to have_text('Movie successfully created!')
    expect(page).to have_text(@genres[0].name)
    expect(page).to have_text(@genres[1].name)
    expect(page).not_to have_text(@genres[2].name)
  end

  it "does not save the movie if it's invalid" do
    visit new_movie_url

    expect {
      click_button 'Create Movie'
    }.not_to change(Movie, :count)

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('error')
  end
end
