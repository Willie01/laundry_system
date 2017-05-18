class StationFactoriesController < ApplicationController
  before_action :set_station_factory, only: [:show, :edit, :update, :destroy]

  # GET /station_factories
  # GET /station_factories.json
  def index
    @station_factories = StationFactory.find_by_sql ["SELECT sf.id, sf.factory_id, sf.station_id, sf.status, sf.created_at, sf.updated_at, f.factory_name, s.station_name FROM station_factories sf, factories f, stations s WHERE sf.factory_id = f.id AND sf.station_id = s.id"]
  end

  # GET /station_factories/1
  # GET /station_factories/1.json
  def show
     @station_factories = StationFactory.find_by_sql ["SELECT sf.id, sf.factory_id, sf.station_id, sf.status, sf.created_at, sf.updated_at, f.factory_name, s.station_name FROM station_factories sf, factories f, stations s WHERE sf.factory_id = f.id AND sf.station_id = s.id AND sf.id = ?",params[:id]]
  end

  def stationsbyfactory
     @station_factories = StationFactory.find_by_sql ["SELECT sf.id, sf.factory_id, sf.station_id, sf.status, sf.created_at, sf.updated_at, f.factory_name, s.station_name FROM station_factories sf, factories f, stations s WHERE sf.factory_id = f.id AND sf.station_id = s.id AND sf.factory_id = ?",params[:factory_id]]
  end
  # GET /station_factories/new
  def new
    @station_factory = StationFactory.new
  end

  # GET /station_factories/1/edit
  def edit
  end

  # POST /station_factories
  # POST /station_factories.json
  def create
    @station_factory = StationFactory.new(station_factory_params)

    respond_to do |format|
      if @station_factory.save
        format.html { redirect_to @station_factory, notice: 'Station factory was successfully created.' }
        format.json { render :show, status: :created, location: @station_factory }
      else
        format.html { render :new }
        format.json { render json: @station_factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_factories/1
  # PATCH/PUT /station_factories/1.json
  def update
    respond_to do |format|
      if @station_factory.update(station_factory_params)
        format.html { redirect_to @station_factory, notice: 'Station factory was successfully updated.' }
        format.json { render :show, status: :ok, location: @station_factory }
      else
        format.html { render :edit }
        format.json { render json: @station_factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_factories/1
  # DELETE /station_factories/1.json
  def destroy
    @station_factory.destroy
    respond_to do |format|
      format.html { redirect_to station_factories_url, notice: 'Station factory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_factory
      @station_factory = StationFactory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_factory_params
      params.permit(:station_id, :factory_id, :status)
    end
end
