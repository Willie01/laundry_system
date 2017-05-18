class CouponsUsersController < ApplicationController
  before_action :set_coupons_user, only: [:show, :edit, :update, :destroy]

  # GET /coupons_users
  # GET /coupons_users.json
  def index
    @coupons_users = CouponsUser.find_by_sql ["SELECT cu.id, cu.user_id, cu.coupon_status_id, cu.created_at, cu.updated_at, cu.coupon_coupontype_id, cu.couponrule_id, cct.coupon_id, cct.coupon_type_id, u.username, cs.coupon_status_name, c.price, c.coupon_name, cr.start_on, cr.end_on, ct.coupon_type_name FROM coupons_users cu, users u, coupon_statuses cs, coupons c, couponrule_cities cr, coupon_types ct, coupon_coupontypes cct WHERE cu.user_id = u.id AND cu.coupon_status_id = cs.id AND cu.coupon_coupontype_id = cct.id AND cct.coupon_id = c.id AND cct.coupon_type_id = ct.id AND cu.couponrule_id = cr.id"]
  end
  # GET /api/users/:user_id/coupons
  def couponsbyuser
    @coupons_users = CouponsUser.find_by_sql ["SELECT cu.id, cu.user_id, cu.coupon_status_id, cu.created_at, cu.updated_at, cu.coupon_coupontype_id, cu.couponrule_id, cct.coupon_id, cct.coupon_type_id, u.username, cs.coupon_status_name, c.price, c.coupon_name, cr.start_on, cr.end_on, ct.coupon_type_name FROM coupons_users cu, users u, coupon_statuses cs, coupons c, couponrule_cities cr, coupon_types ct, coupon_coupontypes cct WHERE cu.user_id = u.id AND cu.coupon_status_id = cs.id AND cu.coupon_coupontype_id = cct.id AND cct.coupon_id = c.id AND cct.coupon_type_id = ct.id AND cu.couponrule_id = cr.id AND cu.user_id = ?",params[:user_id]]
  end

  # GET /coupons_users/1
  # GET /coupons_users/1.json
  def show
    @coupons_users = CouponsUser.find_by_sql ["SELECT cu.id, cu.user_id, cu.coupon_status_id, cu.created_at, cu.updated_at, cu.coupon_coupontype_id, cu.couponrule_id, cct.coupon_id, cct.coupon_type_id, u.username, cs.coupon_status_name, c.price, c.coupon_name, cr.start_on, cr.end_on, ct.coupon_type_name FROM coupons_users cu, users u, coupon_statuses cs, coupons c, couponrule_cities cr, coupon_types ct, coupon_coupontypes cct WHERE cu.user_id = u.id AND cu.coupon_status_id = cs.id AND cu.coupon_coupontype_id = cct.id AND cct.coupon_id = c.id AND cct.coupon_type_id = ct.id AND cu.couponrule_id = cr.id AND cu.id = ?",params[:id]]
  end

  # GET /coupons_users/new
  def new
    @coupons_user = CouponsUser.new
  end

  # GET /coupons_users/1/edit
  def edit
  end

  # POST /coupons_users
  # POST /coupons_users.json
  def create
    @coupons_user = CouponsUser.new(coupons_user_params)

    respond_to do |format|
      if @coupons_user.save
        format.html { redirect_to @coupons_user, notice: 'Coupons user was successfully created.' }
        format.json { render :show, status: :created, location: @coupons_user }
      else
        format.html { render :new }
        format.json { render json: @coupons_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons_users/1
  # PATCH/PUT /coupons_users/1.json
  def update
    respond_to do |format|
      if @coupons_user.update(coupons_user_params)
        format.html { redirect_to @coupons_user, notice: 'Coupons user was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupons_user }
      else
        format.html { render :edit }
        format.json { render json: @coupons_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons_users/1
  # DELETE /coupons_users/1.json
  def destroy
    @coupons_user.destroy
    respond_to do |format|
      format.html { redirect_to coupons_users_url, notice: 'Coupons user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupons_user
      @coupons_user = CouponsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupons_user_params
      params.permit(:user_id, :coupon_status_id, :coupon_coupontype_id, :couponrule_id)
    end
end
