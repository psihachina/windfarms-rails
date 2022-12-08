class TurbinesController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  before_action :find_turbine, only: %i[show edit update destroy]
  before_action :admin?, only: %i[edit]

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

  # def new; end
  #
  # def show; end
  #
  # def edit; end

  def update
    if @turbine.update(turbines_params)
      redirect_to turbine_path
    else
      render json: t.errors, status: :unprocessable_entity
    end
  end



  def expensive
    @turbines = Turbine.where('min_wind_speed > 6')
    render :index
  end

  def destroy
    if @turbine.destroy.destroyed?
      redirect_to turbines_path
    else
      render json: t.errors, status: :unprocessable_entity
    end
  end

  private

  def find_turbine
    @turbine = Turbine.where(id: params[:id]).first
    render_404 unless @turbine
  end

  def admin?
    render_403 unless params[:admin]
    # true
    # render json: 'Access denied', status: :forbidden unless params[:admin]
  end

  def turbines_params
    params.permit(:name, :maximum_power, :max_wind_speed, :min_wind_speed, :blades,
                  :tower_height, :rotor_diameter)
  end
end
