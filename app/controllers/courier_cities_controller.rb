class CourierCitiesController < ApplicationController
  before_action :set_courier_city, only: [:show, :edit, :update, :destroy]

  # GET /courier_cities
  # GET /courier_cities.json
  def index
    @courier_cities = CourierCity.find_by_sql ["SELECT cc.id, cc.courier_id, cc.longitude, cc.latitude, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, c.courier_name FROM courier_cities cc, cities ct, couriers c WHERE cc.courier_id = c.id AND cc.city_id = ct.id"]
  end

  # GET /courier_cities/1
  # GET /courier_cities/1.json
  def show
    @courier_cities = CourierCity.find_by_sql ["SELECT cc.id, cc.courier_id, cc.longitude, cc.latitude, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, c.courier_name FROM courier_cities cc, cities ct, couriers c WHERE cc.courier_id = c.id AND cc.city_id = ct.id AND cc.id = ?", params[:id]]
  end

  # GET /courier_cities/new
  def new
    @courier_city = CourierCity.new
  end

  def couriersbycity
    @courier_cities = CourierCity.find_by_sql ["SELECT cc.id, cc.courier_id, cc.longitude, cc.latitude, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, c.courier_name FROM courier_cities cc, cities ct, couriers c WHERE cc.courier_id = c.id AND cc.city_id = ct.id AND cc.city_id", params[:city_id]]
  end

  # GET /courier_cities/1/edit
  def edit
  end

  # POST /courier_cities
  # POST /courier_cities.json
  def create
    @courier_city = CourierCity.new(courier_city_params)

    respond_to do |format|
      if @courier_city.save
        format.html { redirect_to @courier_city, notice: 'Courier city was successfully created.' }
        format.json { render :show, status: :created, location: @courier_city }
      else
        format.html { render :new }
        format.json { render json: @courier_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courier_cities/1
  # PATCH/PUT /courier_cities/1.json
  def update
    respond_to do |format|
      if @courier_city.update(courier_city_params)
        format.html { redirect_to @courier_city, notice: 'Courier city was successfully updated.' }
        format.json { render :show, status: :ok, location: @courier_city }
      else
        format.html { render :edit }
        format.json { render json: @courier_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courier_cities/1
  # DELETE /courier_cities/1.json
  def destroy
    @courier_city.destroy
    respond_to do |format|
      format.html { redirect_to courier_cities_url, notice: 'Courier city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier_city
      @courier_city = CourierCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courier_city_params
      params.require(:courier_city).permit(:city_id, :courier_id, :longitude, :latitude, :status)
    end
end
