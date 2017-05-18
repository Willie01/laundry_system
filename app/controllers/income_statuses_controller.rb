class IncomeStatusesController < ApplicationController
  before_action :set_income_status, only: [:show, :edit, :update, :destroy]

  # GET /income_statuses
  # GET /income_statuses.json
  def index
    @income_statuses = IncomeStatus.all
  end

  # GET /income_statuses/1
  # GET /income_statuses/1.json
  def show
  end

  # GET /income_statuses/new
  def new
    @income_status = IncomeStatus.new
  end

  # GET /income_statuses/1/edit
  def edit
  end

  # POST /income_statuses
  # POST /income_statuses.json
  def create
    @income_status = IncomeStatus.new(income_status_params)

    respond_to do |format|
      if @income_status.save
        format.html { redirect_to @income_status, notice: 'Income status was successfully created.' }
        format.json { render :show, status: :created, location: @income_status }
      else
        format.html { render :new }
        format.json { render json: @income_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_statuses/1
  # PATCH/PUT /income_statuses/1.json
  def update
    respond_to do |format|
      if @income_status.update(income_status_params)
        format.html { redirect_to @income_status, notice: 'Income status was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_status }
      else
        format.html { render :edit }
        format.json { render json: @income_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_statuses/1
  # DELETE /income_statuses/1.json
  def destroy
    @income_status.destroy
    respond_to do |format|
      format.html { redirect_to income_statuses_url, notice: 'Income status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_status
      @income_status = IncomeStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_status_params
      params.permit(:income_status_name)
    end
end
