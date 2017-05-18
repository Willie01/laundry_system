class CouponCoupontypesController < ApplicationController
  before_action :set_coupon_coupontype, only: [:show, :edit, :update, :destroy]

  # GET /coupon_coupontypes
  # GET /coupon_coupontypes.json
  def index
    @coupon_coupontypes = CouponCoupontype.find_by_sql ["SELECT cct.id, cct.coupon_id, cct.coupon_type_id, cct.status, cct.created_at, cct.updated_at, cp.coupon_name, ct.coupon_type_name FROM coupon_coupontypes cct, coupons cp, coupon_types ct WHERE cct.coupon_id = cp.id AND cct.coupon_type_id = ct.id"]
  end

  # GET /coupon_coupontypes/1
  # GET /coupon_coupontypes/1.json
  def show
    @coupon_coupontypes = CouponCoupontype.find_by_sql ["SELECT cct.id, cct.coupon_id, cct.coupon_type_id, cct.status, cct.created_at, cct.updated_at, cp.coupon_name, ct.coupon_type_name FROM coupon_coupontypes cct, coupons cp, coupon_types ct WHERE cct.coupon_id = cp.id AND cct.coupon_type_id = ct.id AND cct.id = ?", params[:id]]
  end


  def coupontypesbycoupontype
    @coupon_coupontypes = CouponCoupontype.find_by_sql ["SELECT cct.id, cct.coupon_id, cct.coupon_type_id, cct.status, cct.created_at, cct.updated_at, cp.coupon_name, ct.coupon_type_name FROM coupon_coupontypes cct, coupons cp, coupon_types ct WHERE cct.coupon_id = cp.id AND cct.coupon_type_id = ct.id AND cct.coupon_type_id = ?", params[:coupon_type_id]]
  end



  # GET /coupon_coupontypes/new
  def new
    @coupon_coupontype = CouponCoupontype.new
  end

  # GET /coupon_coupontypes/1/edit
  def edit
  end

  # POST /coupon_coupontypes
  # POST /coupon_coupontypes.json
  def create
    @coupon_coupontype = CouponCoupontype.new(coupon_coupontype_params)

    respond_to do |format|
      if @coupon_coupontype.save
        format.html { redirect_to @coupon_coupontype, notice: 'Coupon coupontype was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_coupontype }
      else
        format.html { render :new }
        format.json { render json: @coupon_coupontype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_coupontypes/1
  # PATCH/PUT /coupon_coupontypes/1.json
  def update
    respond_to do |format|
      if @coupon_coupontype.update(coupon_coupontype_params)
        format.html { redirect_to @coupon_coupontype, notice: 'Coupon coupontype was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_coupontype }
      else
        format.html { render :edit }
        format.json { render json: @coupon_coupontype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_coupontypes/1
  # DELETE /coupon_coupontypes/1.json
  def destroy
    @coupon_coupontype.destroy
    respond_to do |format|
      format.html { redirect_to coupon_coupontypes_url, notice: 'Coupon coupontype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_coupontype
      @coupon_coupontype = CouponCoupontype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_coupontype_params
      params.permit(:coupon_id, :coupon_type_id, :status)
    end
end
