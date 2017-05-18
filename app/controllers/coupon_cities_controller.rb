class CouponCitiesController < ApplicationController
  before_action :set_coupon_city, only: [:show, :edit, :update, :destroy]

  # GET /coupon_cities
  # GET /coupon_cities.json
  def index
    @coupon_cities = CouponCity.find_by_sql ["SELECT cc.id, cc.coupon_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cp.coupon_name FROM coupon_cities cc, cities ct, coupons cp WHERE cc.coupon_id = cp.id AND cc.city_id = ct.id"]
  end

  # GET /coupon_cities/1
  # GET /coupon_cities/1.json
  def show
    @coupon_cities = CouponCity.find_by_sql ["SELECT cc.id, cc.coupon_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cp.coupon_name FROM coupon_cities cc, cities ct, coupons cp WHERE cc.coupon_id = cp.id AND cc.city_id = ct.id AND cc.id = ?", params[:id]]
  end

  # GET /cities/:city_id/coupons
  def couponsbycity
    @coupon_cities = CouponCity.find_by_sql ["SELECT cc.id, cc.coupon_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cp.coupon_name FROM coupon_cities cc, cities ct, coupons cp WHERE cc.coupon_id = cp.id AND cc.city_id = ct.id AND cc.city_id = ?", params[:city_id]]
  end

  # GET /coupon_cities/new
  def new
    @coupon_city = CouponCity.new
  end

  # GET /coupon_cities/1/edit
  def edit
  end

  # POST /coupon_cities
  # POST /coupon_cities.json
  def create
    @coupon_city = CouponCity.new(coupon_city_params)

    respond_to do |format|
      if @coupon_city.save
        format.html { redirect_to @coupon_city, notice: 'Coupon city was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_city }
      else
        format.html { render :new }
        format.json { render json: @coupon_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_cities/1
  # PATCH/PUT /coupon_cities/1.json
  def update
    respond_to do |format|
      if @coupon_city.update(coupon_city_params)
        format.html { redirect_to @coupon_city, notice: 'Coupon city was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_city }
      else
        format.html { render :edit }
        format.json { render json: @coupon_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_cities/1
  # DELETE /coupon_cities/1.json
  def destroy
    @coupon_city.destroy
    respond_to do |format|
      format.html { redirect_to coupon_cities_url, notice: 'Coupon city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_city
      @coupon_city = CouponCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_city_params
      params.permit(:coupon_id, :city_id, :status)
    end
end
