class PriceTypesController < ApplicationController
  before_action :set_price_type, only: [:show, :edit, :update, :destroy]

  # GET /price_types
  # GET /price_types.json
  def index
    @price_types = PriceType.all
  end

  # GET /price_types/1
  # GET /price_types/1.json
  def show
  end

  # GET /price_types/new
  def new
    @price_type = PriceType.new
  end

  # GET /price_types/1/edit
  def edit
  end

  # POST /price_types
  # POST /price_types.json
  def create
    @price_type = PriceType.new(price_type_params)

    respond_to do |format|
      if @price_type.save
        format.html { redirect_to @price_type, notice: 'Price type was successfully created.' }
        format.json { render :show, status: :created, location: @price_type }
      else
        format.html { render :new }
        format.json { render json: @price_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_types/1
  # PATCH/PUT /price_types/1.json
  def update
    respond_to do |format|
      if @price_type.update(price_type_params)
        format.html { redirect_to @price_type, notice: 'Price type was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_type }
      else
        format.html { render :edit }
        format.json { render json: @price_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_types/1
  # DELETE /price_types/1.json
  def destroy
    @price_type.destroy
    respond_to do |format|
      format.html { redirect_to price_types_url, notice: 'Price type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_type
      @price_type = PriceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_type_params
      params.permit(:price_type_name, :status)
    end
end
