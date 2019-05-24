require 'rails_helper'

RSpec.describe "when I visit a vending machine show page" do
  context "as a user" do
    before :each do
      @owner = Owner.create!(name: "Owner's Snacks")

      @machine_1 = @owner.machines.create!(location: "Machine 1 Location")

      @machine_2 = @owner.machines.create!(location: "Machine 2 Location")

      @snack_1 = @machine_1.snacks.create!(name: "Snack 1", price: 1.00)
      @snack_2 = @machine_1.snacks.create!(name: "Snack 2", price: 2.00)
      @snack_3 = @machine_1.snacks.create!(name: "Snack 3", price: 3.00)
    end

    it "I see the name of all snacks/prices associated with that vending machine" do
      visit machine_path(@machine_1)

      within ".snack-#{@snack_1.id}" do
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content(@snack_1.price)
      end

      within ".snack-#{@snack_2.id}" do
        expect(page).to have_content(@snack_2.name)
        expect(page).to have_content(@snack_2.price)
      end

      within ".snack-#{@snack_3.id}" do
        expect(page).to have_content(@snack_3.name)
        expect(page).to have_content(@snack_3.price)
      end
    end

    it "I see an average price for all the snacks in that machine" do
      visit machine_path(@machine_1)

      within(".average-price") do
        expect(page).to have_content(@machine_1.average_snack_price)
      end
    end
  end
end
