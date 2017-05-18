class StationCitiesController < ApplicationController
  before_action :set_station_city, only: [:show, :edit, :update, :destroy]

  # GET /station_cities
  # GET /station_cities.json
  def index
    @station_cities = StationCity.find_by_sql ["SELECT sc.id, sc.city_id, sc.longitude, sc.latitude, sc.status, sc.created_at, sc.updated_at, ct.city_name FROM station_cities sc, cities ct WHERE sc.city_id = ct.id"]
  end

  # GET /station_cities/1
  # GET /station_cities/1.json
  def show
    @station_cities = StationCity.find_by_sql ["SELECT sc.id, sc.city_id, sc.longitude, sc.latitude, sc.status, sc.created_at, sc.updated_at, ct.city_name FROM station_cities sc, cities ct WHERE sc.city_id = ct.id AND sc.id = ?",params[:id]]
  end

  def stationsbycity
    @station_cities = StationCity.find_by_sql ["SELECT sc.id, sc.city_id, sc.longitude, sc.latitude, sc.status, sc.created_at, sc.updated_at, ct.city_name FROM station_cities sc, cities ct WHERE sc.city_id = ct.id AND sc.city_id = ?",params[:city_id]]
  end

  # GET /station_cities/new
  def new
    @station_city = StationCity.new
  end

  # GET /station_cities/1/edit
  def edit
  end

  # POST /station_cities
  # POST /station_cities.json
  def create
    @station_city = StationCity.new(station_city_params)

    respond_to do |format|
      if @station_city.save
        format.html { redirect_to @station_city, notice: 'Station city was successfully created.' }
        format.json { render :show, status: :created, location: @station_city }
      else
        format.html { render :new }
        format.json { render json: @station_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_cities/1
  # PATCH/PUT /station_cities/1.json
  def update
    respond_to do |format|
      if @station_city.update(station_city_params)
        format.html { redirect_to @station_city, notice: 'Station city was successfully updated.' }
        format.json { render :show, status: :ok, location: @station_city }
      else
        format.html { render :edit }
        format.json { render json: @station_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_cities/1
  # DELETE /station_cities/1.json
  def destroy
    @station_city.destroy
    respond_to do |format|
      format.html { redirect_to station_cities_url, notice: 'Station city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_city
      @station_city = StationCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_city_params
      params.permit(:region_id, :longitude, :latitude, :status)
    end
end
