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



end
