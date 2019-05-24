class SnacksController < ApplicationController
  def show
    @snack    = Snack.find(params[:id])
    @machines = Machine.all
    @average_snack_price_for_all_machines = Machine.average_snack_price_for_all_machines
  end
end
