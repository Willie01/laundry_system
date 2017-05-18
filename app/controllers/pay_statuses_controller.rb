class PayStatusesController < ApplicationController
  before_action :set_pay_status, only: [:show, :edit, :update, :destroy]

  # GET /pay_statuses
  # GET /pay_statuses.json
  def index
    @pay_statuses = PayStatus.all
  end

  # GET /pay_statuses/1
  # GET /pay_statuses/1.json
  def show
  end

  # GET /pay_statuses/new
  def new
    @pay_status = PayStatus.new
  end

  # GET /pay_statuses/1/edit
  def edit
  end

  # POST /pay_statuses
  # POST /pay_statuses.json
  def create
    @pay_status = PayStatus.new(pay_status_params)

    respond_to do |format|
      if @pay_status.save
        format.html { redirect_to @pay_status, notice: 'Pay status was successfully created.' }
        format.json { render :show, status: :created, location: @pay_status }
      else
        format.html { render :new }
        format.json { render json: @pay_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_statuses/1
  # PATCH/PUT /pay_statuses/1.json
  def update
    respond_to do |format|
      if @pay_status.update(pay_status_params)
        format.html { redirect_to @pay_status, notice: 'Pay status was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_status }
      else
        format.html { render :edit }
        format.json { render json: @pay_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_statuses/1
  # DELETE /pay_statuses/1.json
  def destroy
    @pay_status.destroy
    respond_to do |format|
      format.html { redirect_to pay_statuses_url, notice: 'Pay status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_status
      @pay_status = PayStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_status_params
      params.permit(:pay_status_name)
    end
end
