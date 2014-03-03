class Movie < ActiveRecord::Base
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

  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  def self.released
    where("released_on <= ?", Time.now).order(released_on: :desc)
  end

  def self.upcoming
    where("released_on > ?", Time.now).order(released_on: :asc)
  end

  def self.hits
    where('total_gross >= 200000000').order(total_gross: :desc)
  end

  def self.flops
    where('total_gross < 50000000').order(total_gross: :desc)
  end

  def self.recently_added
    order('created_at desc').limit(3)
  end
end
