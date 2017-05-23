class UserPaysController < ApplicationController
  before_action :set_user_pay, only: [:show, :edit, :update, :destroy]
  # GET /user_pays
  # GET /user_pays.json
  def index
    @user_pays = UserPay.all
  end

  # GET /user_pays/1
  # GET /user_pays/1.json
  def show
  end

  # GET /user_pays/new
  def new
    @user_pay = UserPay.new
  end

  # GET /user_pays/1/edit
  def edit
  end

  # POST /user_pays
  # POST /user_pays.json
  def create
    @user_pay = UserPay.new(user_pay_params)

    respond_to do |format|
      if @user_pay.save
        format.html { redirect_to @user_pay, notice: 'User pay was successfully created.' }
        format.json { render :show, status: :created, location: @user_pay }
      else
        format.html { render :new }
        format.json { render json: @user_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_pays/1
  # PATCH/PUT /user_pays/1.json
  def update
    respond_to do |format|
      if @user_pay.update(user_pay_params)
        format.html { redirect_to @user_pay, notice: 'User pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_pay }
      else
        format.html { render :edit }
        format.json { render json: @user_pay.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /user_pays/1
  # DELETE /user_pays/1.json
  def destroy
    @user_pay.destroy
    respond_to do |format|
      format.html { redirect_to user_pays_url, notice: 'User pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pay
      @user_pay = UserPay.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_pay_params
      params.permit(:user_id, :status, :pay)
    end
end
