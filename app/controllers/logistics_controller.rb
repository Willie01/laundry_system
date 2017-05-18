class LogisticsController < ApplicationController
  before_action :set_logistic, only: [:show, :edit, :update, :destroy]

  # GET /logistics
  # GET /logistics.json
  def index
    @logistics = Logistic.all
  end

  # GET /logistics/1
  # GET /logistics/1.json
  def show
  end

  # GET /logistics/new
  def new
    @logistic = Logistic.new
  end

  # GET /logistics/1/edit
  def edit
  end

  # POST /logistics
  # POST /logistics.json
  def create
    @logistic = Logistic.new(logistic_params)

    respond_to do |format|
      if @logistic.save
        format.html { redirect_to @logistic, notice: 'Logistic was successfully created.' }
        format.json { render :show, status: :created, location: @logistic }
      else
        format.html { render :new }
        format.json { render json: @logistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logistics/1
  # PATCH/PUT /logistics/1.json
  def update
    respond_to do |format|
      if @logistic.update(logistic_params)
        format.html { redirect_to @logistic, notice: 'Logistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @logistic }
      else
        format.html { render :edit }
        format.json { render json: @logistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logistics/1
  # DELETE /logistics/1.json
  def destroy
    @logistic.destroy
    respond_to do |format|
      format.html { redirect_to logistics_url, notice: 'Logistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logistic
      @logistic = Logistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logistic_params
      params.permit(:logistics_name)
    end
end
