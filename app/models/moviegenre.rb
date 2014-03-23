class Moviegenre < ActiveRecord::Base
  belongs_to :movie
  belongs_to :genre
end
