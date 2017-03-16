class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :location, presence: true
  validates :starts_at, presence: false
  validates :capacity, presence: false
  validates :price, presence: true

  def bargain?
     price < 30
   end


end
