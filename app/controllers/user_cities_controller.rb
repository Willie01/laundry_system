class UserCitiesController < ApplicationController
  before_action :set_user_city, only: [:show, :edit, :update, :destroy]

  # GET /user_cities
  # GET /user_cities.json
  def index
    @user_cities = UserCity.find_by_sql ["SELECT uc.id, uc.user_id, uc.city_id, uc.longitude, uc.latitude, uc.status, uc.created_at, uc.updated_at, u.username, ct.city_name FROM user_cities uc, users u, cities ct WHERE uc.city_id = ct.id AND uc.user_id = u.id"]
  end

  # GET /user_cities/1
  # GET /user_cities/1.json
  def show
    @user_cities = UserCity.find_by_sql ["SELECT uc.id, uc.user_id, uc.city_id, uc.longitude, uc.latitude, uc.status, uc.created_at, uc.updated_at, u.username, ct.city_name FROM user_cities uc, users u, cities ct WHERE uc.city_id = ct.id AND uc.user_id = u.id AND uc.id = ?", params[:id]]
  end

  def usersbycity
    @user_cities = UserCity.find_by_sql ["SELECT uc.id, uc.user_id, uc.city_id, uc.longitude, uc.latitude, uc.status, uc.created_at, uc.updated_at, u.username, ct.city_name FROM user_cities uc, users u, cities ct WHERE uc.city_id = ct.id AND uc.user_id = u.id AND uc.city_id = ?", params[:city_id]]
  end

  # GET /user_cities/new
  def new
    @user_city = UserCity.new
  end

  # GET /user_cities/1/edit
  def edit
  end

  # POST /user_cities
  # POST /user_cities.json
  def create
    @user_city = UserCity.new(user_city_params)

    respond_to do |format|
      if @user_city.save
        format.html { redirect_to @user_city, notice: 'User city was successfully created.' }
        format.json { render :show, status: :created, location: @user_city }
      else
        format.html { render :new }
        format.json { render json: @user_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_cities/1
  # PATCH/PUT /user_cities/1.json
  def update
    respond_to do |format|
      if @user_city.update(user_city_params)
        format.html { redirect_to @user_city, notice: 'User city was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_city }
      else
        format.html { render :edit }
        format.json { render json: @user_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_cities/1
  # DELETE /user_cities/1.json
  def destroy
    @user_city.destroy
    respond_to do |format|
      format.html { redirect_to user_cities_url, notice: 'User city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_city
      @user_city = UserCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_city_params
      params.permit(:city_id, :longitude, :latitude, :status, :user_id)
    end
end
