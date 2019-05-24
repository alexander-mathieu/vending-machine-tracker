require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it {should validate_presence_of :location}
  end

  describe "relationships" do
    it {should belong_to :owner}
    it {should have_many :snacks}
  end

  describe "instance methods" do
    before :each do
      @owner = Owner.create!(name: "Owner's Snacks")

      @machine = @owner.machines.create(location: "Machine Location")

      @snack_1 = @machine.snacks.create!(name: "Snack 1", price: 1.00)
      @snack_2 = @machine.snacks.create!(name: "Snack 2", price: 2.00)
      @snack_3 = @machine.snacks.create!(name: "Snack 3", price: 3.00)
    end

    it "#average_price" do
      expect(@machine.average_snack_price).to eq(2.00)
    end
  end

  describe "class methods" do
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

    it "average_snack_price_for_all_machines" do
      expect(Machine.average_snack_price_for_all_machines(@snack_1)).to eq(1.00)
    end
  end
end
