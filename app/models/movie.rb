class Movie < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :reviews, dependent: :destroy
  has_many :critics, through: :reviews, source: :user
  has_many :moviegenres, dependent: :destroy
  has_many :genres, through: :moviegenres

  RATINGS = %w(G PG PG-13 R NC-17)
  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, numericality: { only_integer: true }, length: { maximum: 3,
            message: "max 3 characters allowewd" }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  validates :rating, inclusion: { in: RATINGS, message: "is not selected" }
  scope :released, -> { where("released_on <= ?", Time.now).order(released_on: :desc) }
  scope :upcoming, -> { where("released_on > ?", Time.now).order(released_on: :asc) }
  scope :hits, -> { released.where('total_gross >= 200000000').order(total_gross: :desc) }
  scope :flops, -> { released.where('total_gross < 50000000').order(total_gross: :asc) }
  scope :rated, ->(rate) { released.where(rating: rate) }
  scope :recent, ->(limit=5) { released.limit(limit) }
  scope :grossed_less_than, ->(amount) { released.where('total_gross < ?', amount) }
  scope :grossed_greater_than, ->(amount) { released.where('total_gross > ?', amount) }

  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  # def self.released
  #   where("released_on <= ?", Time.now).order(released_on: :desc)
  # end

  # def self.upcoming
  #   where("released_on > ?", Time.now).order(released_on: :asc)
  # end

  # def self.hits
  #   where('total_gross >= 200000000').order(total_gross: :desc)
  # end

  # def self.flops
  #   where('total_gross < 50000000').order(total_gross: :desc)
  # end

  def self.recently_added
    order('created_at desc').limit(3)
  end

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end
end
