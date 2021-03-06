class CouriersController < ApplicationController
  before_action :set_courier, only: [:show, :edit, :update, :destroy]

  # GET /couriers
  # GET /couriers.json
  def index
    @couriers = Courier.all
  end

  # GET /couriers/1
  # GET /couriers/1.json
  def show
  end

  # GET /couriers/new
  def new
    @courier = Courier.new
  end

  # GET /couriers/1/edit
  def edit
  end

  # POST /couriers/login
  def login
    @courier = Courier.find_by(telphone: courier_params_login[:telphone],password: courier_params_login[:password])
    respond_to do |format|
      if @courier
        format.html { redirect_to "/qishou/index.html?courier=#{@courier.id}", notice: 'Courier was successfully login.' }
        format.json { render :show, status: :ok, location: @courier }
      else
        format.json { render json: {status: :unprocessable_entity} }
      end
    end
  end

  # GET /statuses/:id/couriers
  # def couriersbystatus
  #   @couriers = Courier.where(status: params[:status])
  # end

  # POST /couriers
  # POST /couriers.json
  def create
    @courier = Courier.new(courier_params)

    respond_to do |format|
      if @courier.save
        format.html { redirect_to @courier, notice: 'Courier was successfully created.' }
        format.json { render :show, status: :created, location: @courier }
      else
        format.html { render :new }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /couriers/1
  # PATCH/PUT /couriers/1.json
  def update
    respond_to do |format|
      if @courier.update(courier_params)
        format.html { redirect_to @courier, notice: 'Courier was successfully updated.' }
        format.json { render :show, status: :ok, location: @courier }
      else
        format.html { render :edit }
        format.json { render json: @courier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couriers/1
  # DELETE /couriers/1.json
  def destroy
    @courier.destroy
    respond_to do |format|
      format.html { redirect_to couriers_url, notice: 'Courier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier
      @courier = Courier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courier_params
    #  params.require(:courier).permit(:name, :telphone, :portrait, :status, :rank)
      params.permit(:courier_name, :telphone, :portrait, :status, :rank ,:password, :id_number)
    end

    def courier_params_login
      params.permit(:telphone, :password)
    end

end
