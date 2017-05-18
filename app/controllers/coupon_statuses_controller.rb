class CouponStatusesController < ApplicationController
  before_action :set_coupon_status, only: [:show, :edit, :update, :destroy]

  # GET /coupon_statuses
  # GET /coupon_statuses.json
  def index
    @coupon_statuses = CouponStatus.all
  end

  # GET /coupon_statuses/1
  # GET /coupon_statuses/1.json
  def show
  end

  # GET /coupon_statuses/new
  def new
    @coupon_status = CouponStatus.new
  end

  # GET /coupon_statuses/1/edit
  def edit
  end

  # POST /coupon_statuses
  # POST /coupon_statuses.json
  def create
    @coupon_status = CouponStatus.new(coupon_status_params)

    respond_to do |format|
      if @coupon_status.save
        format.html { redirect_to @coupon_status, notice: 'Coupon status was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_status }
      else
        format.html { render :new }
        format.json { render json: @coupon_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_statuses/1
  # PATCH/PUT /coupon_statuses/1.json
  def update
    respond_to do |format|
      if @coupon_status.update(coupon_status_params)
        format.html { redirect_to @coupon_status, notice: 'Coupon status was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_status }
      else
        format.html { render :edit }
        format.json { render json: @coupon_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_statuses/1
  # DELETE /coupon_statuses/1.json
  def destroy
    @coupon_status.destroy
    respond_to do |format|
      format.html { redirect_to coupon_statuses_url, notice: 'Coupon status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_status
      @coupon_status = CouponStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_status_params
      params.permit(:coupon_status_name)
    end
end
