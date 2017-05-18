class ProductsCitiesController < ApplicationController
  before_action :set_products_city, only: [:show, :edit, :update, :destroy]

  # GET /products_cities
  # GET /products_cities.json
  def index
    @products_cities = ProductsCity.find_by_sql ["SELECT pc.id, pc.product_id, pc.status, pc.city_id, pc.category_id, pc.created_at, pc.updated_at, p.product_name, ct.city_name, cate.category_name FROM products_cities pc, products p, cities ct, categories cate WHERE pc.city_id = ct.id AND pc.category_id = cate.id AND pc.product_id = p.id"]
  end

  # GET /products_cities/1
  # GET /products_cities/1.json
  def show
    @products_cities = ProductsCity.find_by_sql ["SELECT pc.id, pc.product_id, pc.status, pc.city_id, pc.category_id, pc.created_at, pc.updated_at, p.product_name, ct.city_name, cate.category_name FROM products_cities pc, products p, cities ct, categories cate WHERE pc.city_id = ct.id AND pc.category_id = cate.id AND pc.product_id = p.id AND pc.id = ?", params[:id]]
  end

  # GET /products_cities/new
  def new
    @products_city = ProductsCity.new
  end

  # GET /products_cities/1/edit
  def edit
  end

  #GET '/api/cities/:city_id/categories/:category_id/products'
  def productsbycityandcategory
    @products_cities = ProductsCity.find_by_sql ["SELECT pc.id, pc.product_id, pc.status, pc.city_id, pc.category_id, pc.created_at, pc.updated_at, p.product_name, ct.city_name, cate.category_name FROM products_cities pc, products p, cities ct, categories cate WHERE pc.city_id = ct.id AND pc.category_id = cate.id AND pc.product_id = p.id AND pc.city_id = ? AND pc.category_id = ?", params[:city_id], params[:category_id]]
  end

  # POST /products_cities
  # POST /products_cities.json
  def create
    @products_city = ProductsCity.new(products_city_params)

    respond_to do |format|
      if @products_city.save
        format.html { redirect_to @products_city, notice: 'Products city was successfully created.' }
        format.json { render :show, status: :created, location: @products_city }
      else
        format.html { render :new }
        format.json { render json: @products_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products_cities/1
  # PATCH/PUT /products_cities/1.json
  def update
    respond_to do |format|
      if @products_city.update(products_city_params)
        format.html { redirect_to @products_city, notice: 'Products city was successfully updated.' }
        format.json { render :show, status: :ok, location: @products_city }
      else
        format.html { render :edit }
        format.json { render json: @products_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products_cities/1
  # DELETE /products_cities/1.json
  def destroy
    @products_city.destroy
    respond_to do |format|
      format.html { redirect_to products_cities_url, notice: 'Products city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_city
      @products_city = ProductsCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_city_params
      params.permit(:product_id, :categories_id, :status)
    end
end
