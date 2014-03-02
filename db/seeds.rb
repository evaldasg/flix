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
    released_on: "27 November 2013"
    },
    {
      title: "Tangled",
      rating: "PG",
      total_gross: 200807262.00,
      description: "The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.",
      released_on: "24 November 2010"
    },
    {
      title: "The Croods",
      rating: "PG",
      total_gross: 187165546.00,
      description: "After their cave is destroyed, a caveman family must trek through an unfamiliar fantastical world with the help of an inventive boy.",
      released_on: "22 March 2013"
    },
    {
      title: "Monsters University",
      rating: "G",
      total_gross: 268488329,
      description: "A look at the relationship between Mike and Sulley during their days at Monsters University -- when they weren't necessarily the best of friends.",
      released_on: "21 June 2013"
    },
    {
      title: "Monsters, Inc.",
      rating: "G",
      total_gross: 289907418,
      description: "Monsters generate their city's power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley finds his world disrupted.",
      released_on: "2 November 2001"
    },
    {
      title: "Ice Age: Dawn of the Dinosaurs",
      rating: "PG",
      total_gross: 196573705,
      description: "When Sid's attempt to adopt three dinosaur eggs gets him abducted by their real mother to an underground lost world, his friends attempt to rescue him.",
      released_on: "1 July 2009"
    },
    {
      title: "Cars",
      rating: "G",
      total_gross: 244052771,
      description: "A hot-shot race-car named Lightning McQueen gets waylaid in Radiator Springs, where he finds the true meaning of friendship and family.",
      released_on: "9 June 2006"
    }
])
