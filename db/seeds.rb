# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.create!([
    {
      title: "Frozen",
      rating: "PG",
      total_gross: 388736000.00,
      description: "Fearless optimist Anna teams up with Kristoff in an epic journey, encountering Everest-like conditions, and a hilarious snowman named Olaf in a race to find Anna's sister Elsa, whose icy powers have trapped the kingdom in eternal winter.",
      released_on: "27 November 2013",
      cast: "Kristen Bell, Idina Menzel, Jonathan Groff, Josh Gad",
      director: "Chris Buck, Jennifer Lee",
      duration: 102,
      image_file_name: "frozen.jpg"
    },
    {
      title: "Tangled",
      rating: "PG",
      total_gross: 200807262.00,
      description: "The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.",
      released_on: "24 November 2010",
      cast: "Mandy Moore, Zachary Levi, Donna Murphy, Ron Perlman",
      director: "Nathan Greno, Byron Howard",
      duration: 100,
      image_file_name: "tangled.jpg"
    },
    {
      title: "The Croods",
      rating: "PG",
      total_gross: 187165546.00,
      description: "After their cave is destroyed, a caveman family must trek through an unfamiliar fantastical world with the help of an inventive boy. Traveling across a spectacular landscape, the Croods discover an incredible new world filled with fantastic creatures -- and their outlook is changed forever. Written by DreamWorks Animation",
      released_on: "22 March 2013",
      cast: "Nicolas Cage, Emma Stone, Ryan Reynolds, Catherine Keener, Cloris Leachman",
      director: "Kirk De Micco, Chris Sanders",
      duration: 98,
      image_file_name: "croods.jpg"
    },
    {
      title: "Monsters University",
      rating: "G",
      total_gross: 268488329.00,
      description: "A look at the relationship between Mike and Sulley during their days at Monsters University -- when they weren't necessarily the best of friends. \"Monsters University\" unlocks the door to how Mike and Sulley overcame their differences and became the best of friends. Written by Disney/Pixar",
      released_on: "21 June 2013",
      cast: "Billy Crystal, John Goodman, Steve Buscemi, Helen Mirren",
      director: "Dan Scanlon",
      duration: 104,
      image_file_name: "monstersu.jpg"
    },
    {
      title: "Monsters, Inc.",
      rating: "G",
      total_gross: 289907418.00,
      description: "Monsters generate their city's power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley finds his world disrupted.",
      released_on: "2 November 2001",
      cast: "John Goodman, Billy Crystal, Mary Gibbs, Steve Buscemi",
      director: "Pete Docter, David Silverman",
      duration: 92,
      image_file_name: "monsters.jpg"
    },
    {
      title: "Ice Age: Dawn of the Dinosaurs",
      rating: "PG",
      total_gross: 196573705.00,
      description: "When Sid's attempt to adopt three dinosaur eggs gets him abducted by their real mother to an underground lost world, his friends attempt to rescue him. After the events of \"Ice Age: The Meltdown\", life begins to change for Manny and his friends",
      released_on: "1 July 2009",
      cast: "Eunice Cho, Karen Disher, Harrison Fahn, Maile Flanagan",
      director: "Carlos Saldanha, Mike Thurmeier",
      duration: 94,
      image_file_name: "iceage3.jpg"
    },
    {
      title: "The Croods 2",
      rating: "G",
      total_gross: 0.00,
      description: "Status: Treatment/Outline\nProduction Co: DreamWorks Animation\nCountry: USA\nLanguage: English\nDirectors: Kirk De Micco, Chris Sanders\nWriters: Kirk De Micco, Chris Sanders",
      released_on: "2017-03-03",
      cast: "",
      director: "Kirk De Micco, Chris Sanders",
      duration: 0,
      image_file_name: ""
    },
    {
      title: "Finding Dory",
      rating: "PG",
      total_gross: 0.0,
      description: "The plot of this movie, a sequel to Finding Nemo, is unknown.\nWriters: Andrew Stanton (characters), Victoria Strouse (screenplay).\nGenres: Animation | Adventure | Comedy | Family.\nProduction Co: Pixar Animation Studios, Walt Disney Pictures",
      released_on: "2016-06-16",
      cast: "Ellen DeGeneres, Albert Brooks, Diane Keaton",
      director: "Andrew Stanton",
      duration: 0,
      image_file_name: "dory.jpg"
    },
    {
      title: "Inside Out",
      rating: "PG",
      total_gross: 0.0,
      description: "A film told from the perspective of the emotions inside the mind of a little girl.\nWriters: Michael Arndt (screenplay), Pete Docter (story).\nStatus: Pre-production.\nThe Untitled Pixar Movie That Takes You Inside the Mind.",
      released_on: "2015-06-17",
      cast: "Amy Poehler, Bill Hader, Mindy Kaling, John Ratzenb...",
      director: "Pete Docter",
      duration: 0,
      image_file_name: "insideout.jpg"
    },
    {
      title: "Cars",
      rating: "G",
      total_gross: 244052771.00,
      description: "A hot-shot race-car named Lightning McQueen gets waylaid in Radiator Springs, where he finds the true meaning of friendship and family. Written by Claudio Carvalho, Rio de Janeiro, Brazil",
      released_on: "9 June 2006",
      cast: "Owen Wilson, Paul Newman, Bonnie Hunt, Larry the Cable Guy",
      director: "John Lasseter, Joe Ranft",
      duration: 117,
      image_file_name: "cars.jpg"
    }
])

User.create!([
  {
    name: "Roger Ebert",
    username: "roger",
    email: "roger@example.com",
    password: "secret",
    password_confirmation: "secret"
  },
  {
    name: "Gene Siskel",
    username: "gene",
    email: "gene@example.com",
    password: "secret",
    password_confirmation: "secret"
  },
  {
    name: "Peter Travers",
    username: "peter",
    email: "peter@example.com",
    password: "secret",
    password_confirmation: "secret"
  },
  {
    name: "Elvis Mitchell",
    username: "elvis",
    email: "elvis@example.com",
    password: "secret",
    password_confirmation: "secret"
  }
])

roger = User.find_by(name: "Roger Ebert")
gene = User.find_by(name: "Gene Siskel")
peter = User.find_by(name: "Peter Travers")
elvis = User.find_by(name: "Elvis Mitchell")

movie = Movie.find_by(title: 'Frozen')
movie.reviews.create!(user: roger, stars: 5, comment: "I laughed, I cried, I spilled my popcorn!")
movie.reviews.create!(user: gene, stars: 5, comment: "I'm a better reviewer than he is.")
movie.reviews.create!(user: peter, stars: 4, comment: "It's been years since a movie superhero was this fierce and this funny.")

movie = Movie.find_by(title: 'Tangled')
movie.reviews.create!(user: elvis, stars: 5, comment: "It's a bird, it's a plane, it's a blockbuster!")

movie = Movie.find_by(title: 'Frozen')
movie.fans << roger
movie.fans << gene
movie.fans << elvis

Genre.create!(name: "Action")
Genre.create!(name: "Comedy")
Genre.create!(name: "Drama")
Genre.create!(name: "Romance")
Genre.create!(name: "Thriller")
Genre.create!(name: "Fantasy")
Genre.create!(name: "Documentary")
Genre.create!(name: "Adventure")
Genre.create!(name: "Animation")
Genre.create!(name: "Sci-Fi")
