require 'rails_helper'

describe Mechanic do
  let (:mechanic) { Mechanic.create!(description: "test") }


  describe "#search" do
    it "returns a match if there is one in the database" do
      expect(Mechanic.search("test")).to eq([mechanic])
    end

    it "returns an empty array if there is no match" do
      expect(Mechanic.search("not")).to eq([])
    end
  end


  describe "validations" do

    it "is NOT valid without a description" do
      mech = Mechanic.new
      expect(mech.valid?).to eq(false)
    end

    it "is valid with a description" do
      mech = Mechanic.new(description: "Desc")
      expect(mech.valid?).to eq(true)
    end

  end
end
