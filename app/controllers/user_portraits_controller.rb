class UserPortraitsController < ApplicationController
  before_action :set_user_portrait, only: [:show, :edit, :update, :destroy]

  # GET /user_portraits
  # GET /user_portraits.json
  def index
    @user_portraits = UserPortrait.find_by_sql ["SELECT up.id, up.user_id, up.portrait_id, up.status, up.created_at, up.updated_at, u.username, p.url FROM user_portraits up, users u, portraits p WHERE up.user_id = u.id AND up.portrait_id = p.id"]
  end

  # GET /user_portraits/1
  # GET /user_portraits/1.json
  def show
    @user_portraits = UserPortrait.find_by_sql ["SELECT up.id, up.user_id, up.portrait_id, up.status,up.created_at, up.updated_at, u.username, p.url FROM user_portraits up, users u, portraits p WHERE up.user_id = u.id AND up.portrait_id = p.id AND up.id = ?", params[:id]]
  end

  # GET /user_portraits/new
  def new
    @user_portrait = UserPortrait.new
  end

  # GET /user_portraits/1/edit
  def edit
  end

  def portraitbyuser
    @user_portraits = UserPortrait.find_by_sql ["SELECT up.id, up.user_id, up.portrait_id, up.status,up.created_at, up.updated_at, u.username, p.url FROM user_portraits up, users u, portraits p WHERE up.user_id = u.id AND up.portrait_id = p.id AND up.user_id = ?", params[:user_id]]
  end

  # POST /user_portraits
  # POST /user_portraits.json
  def create
    @user_portrait = UserPortrait.new(user_portrait_params)

    respond_to do |format|
      if @user_portrait.save
        format.html { redirect_to @user_portrait, notice: 'User portrait was successfully created.' }
        format.json { render :show, status: :created, location: @user_portrait }
      else
        format.html { render :new }
        format.json { render json: @user_portrait.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_portraits/1
  # PATCH/PUT /user_portraits/1.json
  def update
    respond_to do |format|
      if @user_portrait.update(user_portrait_params)
        format.html { redirect_to @user_portrait, notice: 'User portrait was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_portrait }
      else
        format.html { render :edit }
        format.json { render json: @user_portrait.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_portraits/1
  # DELETE /user_portraits/1.json
  def destroy
    @user_portrait.destroy
    respond_to do |format|
      format.html { redirect_to user_portraits_url, notice: 'User portrait was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_portrait
      @user_portrait = UserPortrait.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_portrait_params
      params.permit(:user_id, :portrait_id, :status)
    end
end
