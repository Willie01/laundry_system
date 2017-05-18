class UserAddressesController < ApplicationController
  before_action :set_user_address, only: [:show, :edit, :update, :destroy]

  # GET /user_addresses
  # GET /user_addresses.json
  def index
    @user_addresses = UserAddress.find_by_sql ["SELECT ua.id, ua.user_id, ua.address, ua.telphone, ua.default_address, ua.created_at, ua.updated_at, u.username FROM user_addresses ua, users u WHERE ua.user_id = u.id"]
  end

  # GET /user_addresses/1
  # GET /user_addresses/1.json
  def show
    @user_addresses = UserAddress.find_by_sql ["SELECT ua.id, ua.user_id, ua.address, ua.telphone, ua.default_address, ua.created_at, ua.updated_at, u.username FROM user_addresses ua, users u WHERE ua.user_id = u.id AND ua.id = ?", params[:id]]
  end

  # GET /user_addresses/new
  def new
    @user_address = UserAddress.new
  end

  def addressesbyuser
    @user_addresses = UserAddress.find_by_sql ["SELECT ua.id, ua.user_id, ua.address, ua.telphone, ua.default_address, ua.created_at, ua.updated_at, u.username FROM user_addresses ua, users u WHERE ua.user_id = u.id AND ua.user_id = ?", params[:user_id]]
  end

  def defaultaddressbyuser
    @user_addresses = UserAddress.find_by_sql ["SELECT ua.id, ua.user_id, ua.address, ua.telphone, ua.default_address, ua.created_at, ua.updated_at, u.username FROM user_addresses ua, users u WHERE ua.user_id = u.id AND ua.default_address = 1 AND ua.user_id = ?", params[:user_id]]
  end


  # GET /user_addresses/1/edit
  def edit
  end

  # GET /user/:user_id/user_addresses
  # def user_addressesbyuser
  #   @user_addresses = UserAddress.where(user_id: params[:user_id])
  # end
  # # GET /users/:user_id/user_addresses/:id
  # def user_addressbyuserandid
  #   @user_address = UserAddress.find_by(user_id: params[:user_id],id: params[:id])
  # end
  # POST /user_addresses
  # POST /user_addresses.json
  def create
    @user_address = UserAddress.new(user_address_params)

    respond_to do |format|
      if @user_address.save
        format.html { redirect_to @user_address, notice: 'User address was successfully created.' }
        format.json { render :show, status: :created, location: @user_address }
      else
        format.html { render :new }
        format.json { render json: @user_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_addresses/1
  # PATCH/PUT /user_addresses/1.json
  def update
    respond_to do |format|
      if @user_address.update(user_address_params)
        format.html { redirect_to @user_address, notice: 'User address was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_address }
      else
        format.html { render :edit }
        format.json { render json: @user_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_addresses/1
  # DELETE /user_addresses/1.json
  def destroy
    @user_address.destroy
    respond_to do |format|
      format.html { redirect_to user_addresses_url, notice: 'User address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_address
      @user_address = UserAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_address_params
     # params.require(:user_address).permit(:user_id, :address, :name, :telphone, :default)
     params.permit(:user_id, :address, :telphone, :default_address)
    end
end
