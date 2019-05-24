require 'rails_helper'

RSpec.describe "when I visit a snack show page" do
  context "as a user" do
    before :each do
      @owner = Owner.create!(name: "Owner's Snacks")

      @machine_1 = @owner.machines.create!(location: "Machine 1 Location")
      @machine_2 = @owner.machines.create!(location: "Machine 2 Location")

      @snack_1 = @machine_1.snacks.create!(name: "Snack 1", price: 1.00)
      @snack_2 = @machine_1.snacks.create!(name: "Snack 2", price: 2.00)
      @snack_3 = @machine_1.snacks.create!(name: "Snack 3", price: 3.00)
      @snack_4 = @machine_1.snacks.create!(name: "Snack 4", price: 4.00)
      @snack_5 = @machine_1.snacks.create!(name: "Snack 5", price: 5.00)
      @snack_6 = @machine_1.snacks.create!(name: "Snack 6", price: 6.00)
      @snack_7 = @machine_1.snacks.create!(name: "Snack 7", price: 7.00)
      @snack_8 = @machine_1.snacks.create!(name: "Snack 8", price: 8.00)

      @machine_2.snacks << @snack_1
      @machine_2.snacks << @snack_2
      @machine_2.snacks << @snack_3
      @machine_2.snacks << @snack_4
      @machine_2.snacks << @snack_5
      @machine_2.snacks << @snack_6
      @machine_2.snacks << @snack_7
      @machine_2.snacks << @snack_8
    end

    it "I see the name and price of that snack" do
      visit snack_path(@snack_1)

      expect(page).to have_content(@snack_1.name)
      expect(page).to have_content(@snack_1.price)
    end

    it "I see a list of locations with vending machines that carry that snack with the average price" do
      visit snack_path(@snack_1)

      within(".locations") do
        expect(page).to have_content(@machine_1.location)
        expect(page).to have_content(@machine_2.location)

        expect(page).to have_content(@snack.average_price)
      end
    end

    it "I see a count of different items in that vending machine" do
      visit snack_path(@snack_1)
    end
  end
end

# Flaming Hot Cheetos
# Price: $2.50
# Locations
# * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
# * Turing Basement (2 kinds of snacks, average price of $3.00
