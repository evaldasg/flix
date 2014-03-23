class Genre < ActiveRecord::Base
  has_many :moviegenres, dependent: :destroy
  has_many :movies, through: :moviegenres

  validates :name, presence: true, uniqueness: true
end
