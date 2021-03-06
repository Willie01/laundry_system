class FactoriesController < ApplicationController
  before_action :set_factory, only: [:show, :edit, :update, :destroy]

  # GET /factories
  # GET /factories.json
  def index
    @factories = Factory.all
  end

  # GET /factories/1
  # GET /factories/1.json
  def show
  end

  # GET /factories/new
  def new
    @factory = Factory.new
  end

  # GET /factories/1/edit
  def edit
  end

  # POST /factories
  # POST /factories.json

    # POST /factories/login
  def login
    @factory = Factory.find_by(phone: factory_params_login[:phone],password: factory_params_login[:password])
    respond_to do |format|
      if @factory
        format.html { redirect_to "/factory/index.html?factory=#{@factory.id}", notice: 'Factory was successfully login.' }
        format.json { render :show, status: :ok, location: @factory }
      else
        format.json { render json: {status: :unprocessable_entity} }
      end
    end
  end


  def create
    @factory = Factory.new(factory_params)

    respond_to do |format|
      if @factory.save
        format.html { redirect_to @factory, notice: 'Factory was successfully created.' }
        format.json { render :show, status: :created, location: @factory }
      else
        format.html { render :new }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factories/1
  # PATCH/PUT /factories/1.json
  def update
    respond_to do |format|
      @factory = Factory.find_by(id:params[:id]);
      if @factory.update(factory_params)
        format.html { redirect_to @factory, notice: 'Factory was successfully updated.' }
        format.json { render :show, status: :ok, location: @factory }
      else
        format.html { render :edit }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1
  # DELETE /factories/1.json
  def destroy
    @factory.destroy
    respond_to do |format|
      format.html { redirect_to factories_url, notice: 'Factory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factory_params
    #  params.require(:factory).permit(:name, :phone, :password, :address, :rank)
      params.permit(:factory_name, :phone, :password, :address, :rank, :status)
    end

    def factory_params_login
      params.permit(:phone, :password)
    end

end
