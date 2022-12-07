class TurbinesController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @turbines = Turbine.all
  end

  def create
    t = Turbine.create(turbines_params)
    if t.persisted?
      redirect_to turbines_path
    else
      render json: t.errors, status: :unprocessable_entity
    end
  end

  def show
    unless (@turbine = Turbine.where(id: params[:id]).first)
      render body: 'page not found', status: 404
    end
  end

  def edit
    unless (@turbine = Turbine.where(id: params[:id]).first)
      render body: 'page not found', status: 404
    end
  end

  def update
    Turbine.where(id: params[:id]).update(turbines_params)
    redirect_to turbine_path
  end

  def new
  end

  def destroy
    t = Turbine.where(id: params[:id]).first.destroy
    if t.destroyed?
      redirect_to turbines_path
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
