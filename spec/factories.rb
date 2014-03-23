FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "evo#{n}" }
    sequence(:username) { |n| "evi#{n}" }
    password "password"
    password_confirmation "password"
    email { "#{name}@example.com" }
    admin false
  end

  factory :movie do
    sequence(:title) { |n| "Frozen#{n}" }
    rating "PG"
    total_gross 388736000.00
    description "Fearless optimist Anna teams up with Kristoff in an epic journey, encountering Everest-like conditions, and a hilarious snowman named Olaf in a race to find Anna's sister Elsa, whose icy powers have trapped the kingdom in eternal winter."
    released_on '27 November 2013'
    cast "Kristen Bell, Idina Menzel, Jonathan Groff, Josh Gad"
    director "Chris Buck, Jennifer Lee"
    duration 102
    image_file_name "frozen.jpg"

    factory :movie_with_review do
      after(:create) do |movie|
        create(:review, movie: movie)
      end
      after(:build) do |movie|
        build(:review, movie: movie)
      end
    end
  end

  factory :review do
    stars 5
    sequence(:comment) { |n| "I laughed and cried, it was very great.#{n}" }
    movie
    user
  end

  factory :genre do
    sequence(:name) { |n| "Name#{n}" }
  end
end
