class CouponruleCitiesController < ApplicationController
  before_action :set_couponrule_city, only: [:show, :edit, :update, :destroy]

  # 优惠券时间范围 
  # GET /couponrule_cities
  # GET /couponrule_cities.json
  def index
    @couponrule_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.city_id, cc.start_on, cc.end_on, cc.status, cc.created_at, cc.updated_at, ct.city_name FROM couponrule_cities cc, cities ct WHERE cc.city_id = ct.id"]
  end

  # GET /couponrule_cities/1
  # GET /couponrule_cities/1.json
  def show
    @couponrule_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.city_id, cc.start_on, cc.end_on, cc.status, cc.created_at, cc.updated_at, ct.city_name FROM couponrule_cities cc, cities ct WHERE cc.city_id = ct.id AND cc.id = ?", params[:id]]
  end

  # GET /couponrule_cities/new
  def new
    @couponrule_city = CouponruleCity.new
  end

  # GET /couponrule_cities/1/edit
  def edit
  end


  def couponrulesbycity
    @couponrule_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.city_id, cc.start_on, cc.end_on, cc.status, cc.created_at, cc.updated_at, ct.city_name FROM couponrule_cities cc, cities ct WHERE cc.city_id = ct.id AND cc.city_id = ?", params[:city_id]]
  end

  # POST /couponrule_cities
  # POST /couponrule_cities.json
  def create
    @couponrule_city = CouponruleCity.new(couponrule_city_params)

    respond_to do |format|
      if @couponrule_city.save
        format.html { redirect_to @couponrule_city, notice: 'Couponrule city was successfully created.' }
        format.json { render :show, status: :created, location: @couponrule_city }
      else
        format.html { render :new }
        format.json { render json: @couponrule_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /couponrule_cities/1
  # PATCH/PUT /couponrule_cities/1.json
  def update
    respond_to do |format|
      if @couponrule_city.update(couponrule_city_params)
        format.html { redirect_to @couponrule_city, notice: 'Couponrule city was successfully updated.' }
        format.json { render :show, status: :ok, location: @couponrule_city }
      else
        format.html { render :edit }
        format.json { render json: @couponrule_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couponrule_cities/1
  # DELETE /couponrule_cities/1.json
  def destroy
    @couponrule_city.destroy
    respond_to do |format|
      format.html { redirect_to couponrule_cities_url, notice: 'Couponrule city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_couponrule_city
      @couponrule_city = CouponruleCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def couponrule_city_params
      params.permit(:coupon_id, :city_id, :start_on, :end_on, :status)
    end
end
