class CourierStationsController < ApplicationController
  before_action :set_courier_station, only: [:show, :edit, :update, :destroy]

  # GET /courier_stations
  # GET /courier_stations.json
  def index
    @courier_stations = CourierStation.find_by_sql ["SELECT cs.id, cs.courier_id, cs.station_id, cs.status, cs.created_at, cs.updated_at, s.station_name, c.courier_name FROM courier_stations cs, couriers c, stations s WHERE cs.courier_id = c.id AND cs.station_id = s.id"]
  end

  # GET /courier_stations/1
  # GET /courier_stations/1.json
  def show
    @courier_stations = CourierStation.find_by_sql ["SELECT cs.id, cs.courier_id, cs.station_id, cs.status, cs.created_at, cs.updated_at, s.station_name, c.courier_name FROM courier_stations cs, couriers c, stations s WHERE cs.courier_id = c.id AND cs.station_id = s.id AND cs.id = ?", params[:id]]
  end


  def couriersbystation
    @courier_stations = CourierStation.find_by_sql ["SELECT cs.id, cs.courier_id, cs.station_id, cs.status, cs.created_at, cs.updated_at, s.station_name, c.courier_name FROM courier_stations cs, couriers c, stations s WHERE cs.courier_id = c.id AND cs.station_id = s.id AND cs.station_id = ?", params[:station_id]]
  end

  # GET /courier_stations/new
  def new
    @courier_station = CourierStation.new
  end

  # GET /courier_stations/1/edit
  def edit
  end

  # POST /courier_stations
  # POST /courier_stations.json
  def create
    @courier_station = CourierStation.new(courier_station_params)

    respond_to do |format|
      if @courier_station.save
        format.html { redirect_to @courier_station, notice: 'Courier station was successfully created.' }
        format.json { render :show, status: :created, location: @courier_station }
      else
        format.html { render :new }
        format.json { render json: @courier_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courier_stations/1
  # PATCH/PUT /courier_stations/1.json
  def update
    respond_to do |format|
      if @courier_station.update(courier_station_params)
        format.html { redirect_to @courier_station, notice: 'Courier station was successfully updated.' }
        format.json { render :show, status: :ok, location: @courier_station }
      else
        format.html { render :edit }
        format.json { render json: @courier_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courier_stations/1
  # DELETE /courier_stations/1.json
  def destroy
    @courier_station.destroy
    respond_to do |format|
      format.html { redirect_to courier_stations_url, notice: 'Courier station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier_station
      @courier_station = CourierStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courier_station_params
      params.permit(:courier_id, :station_id, :status)
    end
end
