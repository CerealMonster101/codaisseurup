class EventSerializer < ActiveModel::Serializer
  attributes :name, :description, :location, :includes_food, :includes_drinks, :price, :starts_at, :ends_at, :capacity, :active

  has_many :registrations


end
