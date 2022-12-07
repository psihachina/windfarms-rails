class TurbinesController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @turbines = Turbine.all
    render body: @turbines.map { |i| "#{i.name}: #{i.maximum_power}"  }
  end

  def create
    t = Turbine.create(turbines_params)
    if t.persisted?
      render json: t, status: :created
    else
      render json: t.errors, status: :unprocessable_entity
    end
  end

  private

  def turbines_params
    params.permit(:name, :maximum_power, :max_wind_speed, :min_wind_speed, :blades,
                  :tower_height, :rotor_diameter)
  end
end
