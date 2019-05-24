require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it {should validate_presence_of :location}
  end

  describe "relationships" do
    it {should belong_to :owner}
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
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

    it "#total_snacks" do
      expect(@machine.total_snacks).to eq(3)
    end
  end
end
