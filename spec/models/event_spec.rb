require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid without a description of max 500 char" do
      event = Event.new(description: "a"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
end

describe "association with registration" do
  let(:guest_user) {create :user, email: "guest@user.com"}
  let(:host_user) {create :user, email: "host@user.com"}

  let!(:event) { create :event, user: host_user}
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has guests" do
    expect (event.guests).to include(guest_user)
  end
end


end
