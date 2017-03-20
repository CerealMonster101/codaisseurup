require 'rails_helper'

describe "association with event" do
  let(:user) { create :user}
  let!(:event) {create :event, user: user}

  it "has many events" do
    event1 = user.events.new(listing_name: "Vegan BBQ")
    event2 = user.events.new(listing_name: "Meow")

    expect(user.events.new).to include(event1)
    expect(user.events.new).to include(event2)
  end

  it "deletes associated events" do
    expect {user.destroy}.to change(Event:count).by(-1)
  end

  describe "association with registration" do
    let(:guest_user) {create :user, email: "guest@user.com"}
    let(:host_user) {create :user, email: "host@user.com"}

    let!(:room) {create :room, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has registrations" do
      expect(guest_user.registered_events).to include(event)
    end
  end
end
