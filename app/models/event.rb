class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :bookings, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :location, presence: true
  validates :starts_at, presence: false
  validates :capacity, presence: false
  validates :price, presence: true

  def bargain?
     price < 30
  end

  def self.alphabetical
    order(name: :asc)
  end


  scope :published, -> {where(active: true)}

  def self.during(start_date, end_date)
      where('starts_at < ? and ends_at > ?', start_date, end_date)
  end

  scope :starts_on_date, -> (start_date) {where(starts_at: start_date)}

  scope :ends_on_date, -> (end_date) {where(ends_at: end_date)}

end
