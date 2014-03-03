def movie_attributes(overrides ={})
  {
    title: "Frozen",
    rating: "PG",
    total_gross: 388736000.00,
    description: "Fearless optimist Anna teams up with Kristoff in an epic journey, encountering Everest-like conditions, and a hilarious snowman named Olaf in a race to find Anna's sister Elsa, whose icy powers have trapped the kingdom in eternal winter.",
    released_on: "27 November 2013",
    cast: "Kristen Bell, Idina Menzel, Jonathan Groff, Josh Gad",
    director: "Chris Buck, Jennifer Lee",
    duration: "102",
    image_file_name: "frozen.jpg"
  }.merge(overrides)
end
