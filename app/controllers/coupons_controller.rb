class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end
  
  # # GET /users/:user_id/coupons
  # def couponsbyuser
  #   @coupons = Coupon.where(user_id:params[:user_id])
  # end

  # # GET /users/:user_id/coupons/:id
  # def couponbyuserandid
  #   @coupon = Coupon.find_by(user_id:params[:user_id],id:params[:id])  
  # end

  # # GET /coupon_type/:coupon_type/coupons
  # def couponsbytype
  #   @coupons = Coupon.where(coupon_type:params[:coupon_type])
  # end

  # # GET /coupon_type/:coupon_type/coupons/:id
  # def couponbytypeandid
  #   @coupon = Coupon.find_by(coupon_type:params[:coupon_type],id:params[:id])
  # end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
    #  params.require(:coupon).permit(:user_id, :price, :deadline, :coupon_type)
      params.permit(:price, :coupon_name, :status)
    end
end
