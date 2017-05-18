class FactoryCitiesController < ApplicationController
  before_action :set_factory_city, only: [:show, :edit, :update, :destroy]

  # GET /factory_cities
  # GET /factory_cities.json
  def index
    @factory_cities = FactoryCity.find_by_sql ["SELECT fc.id, fc.factory_id, fc.longitude, fc.latitude, fc.city_id, fc.status, fc.created_at, fc.updated_at, ct.city_name, f.factory_name FROM factory_cities fc, cities ct, factories f WHERE fc.factory_id = f.id AND fc.city_id = ct.id"]
  end

  # GET /factory_cities/1
  # GET /factory_cities/1.json
  def show
    @factory_cities = FactoryCity.find_by_sql ["SELECT fc.id, fc.factory_id, fc.longitude, fc.latitude, fc.city_id, fc.status, fc.created_at, fc.updated_at, ct.city_name, f.factory_name FROM factory_cities fc, cities ct, factories f WHERE fc.factory_id = f.id AND fc.city_id = ct.id AND fc.id = ?",params[:id]]
  end


  def factoriesbycity
    @factory_cities = FactoryCity.find_by_sql ["SELECT fc.id, fc.factory_id, fc.longitude, fc.latitude, fc.city_id, fc.status, fc.created_at, fc.updated_at, ct.city_name, f.factory_name FROM factory_cities fc, cities ct, factories f WHERE fc.factory_id = f.id AND fc.city_id = ct.id AND fc.city_id = ?",params[:city_id]]
  end


  # GET /factory_cities/new
  def new
    @factory_city = FactoryCity.new
  end

  # GET /factory_cities/1/edit
  def edit
  end

  # POST /factory_cities
  # POST /factory_cities.json
  def create
    @factory_city = FactoryCity.new(factory_city_params)

    respond_to do |format|
      if @factory_city.save
        format.html { redirect_to @factory_city, notice: 'Factory city was successfully created.' }
        format.json { render :show, status: :created, location: @factory_city }
      else
        format.html { render :new }
        format.json { render json: @factory_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factory_cities/1
  # PATCH/PUT /factory_cities/1.json
  def update
    respond_to do |format|
      if @factory_city.update(factory_city_params)
        format.html { redirect_to @factory_city, notice: 'Factory city was successfully updated.' }
        format.json { render :show, status: :ok, location: @factory_city }
      else
        format.html { render :edit }
        format.json { render json: @factory_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_cities/1
  # DELETE /factory_cities/1.json
  def destroy
    @factory_city.destroy
    respond_to do |format|
      format.html { redirect_to factory_cities_url, notice: 'Factory city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory_city
      @factory_city = FactoryCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factory_city_params
      params.permit(:city_id, :longitude, :latitude, :status)
    end
end
