class CategoriesCitiesController < ApplicationController
  before_action :set_categories_city, only: [:show, :edit, :update, :destroy]

  # GET /categories_cities
  # GET /categories_cities.json
  def index
    @categories_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.category_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cate.category_name FROM categories_cities cc, cities ct, categories cate WHERE cc.category_id = cate.id AND cc.city_id = ct.id"]
  end

  # GET /categories_cities/1
  # GET /categories_cities/1.json
  def show
    @categories_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.category_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cate.category_name FROM categories_cities cc, cities ct, categories cate WHERE cc.category_id = cate.id AND cc.city_id = ct.id AND cc.id = ?", params[:id]]
  end

  # GET /api/cities/:city_id/categories
  def categoriesbycity
    @categories_cities = CategoriesCity.find_by_sql ["SELECT cc.id, cc.category_id, cc.city_id, cc.status, cc.created_at, cc.updated_at, ct.city_name, cate.category_name FROM categories_cities cc, cities ct, categories cate WHERE cc.category_id = cate.id AND cc.city_id = ct.id AND cc.city_id = ?", params[:city_id]]
  end
  # GET /categories_cities/new
  def new
    @categories_city = CategoriesCity.new
  end

  # GET /categories_cities/1/edit
  def edit
  end

  # POST /categories_cities
  # POST /categories_cities.json
  def create
    @categories_city = CategoriesCity.new(categories_city_params)

    respond_to do |format|
      if @categories_city.save
        format.html { redirect_to @categories_city, notice: 'Categories city was successfully created.' }
        format.json { render :show, status: :created, location: @categories_city }
      else
        format.html { render :new }
        format.json { render json: @categories_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_cities/1
  # PATCH/PUT /categories_cities/1.json
  def update
    respond_to do |format|
      if @categories_city.update(categories_city_params)
        format.html { redirect_to @categories_city, notice: 'Categories city was successfully updated.' }
        format.json { render :show, status: :ok, location: @categories_city }
      else
        format.html { render :edit }
        format.json { render json: @categories_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_cities/1
  # DELETE /categories_cities/1.json
  def destroy
    @categories_city.destroy
    respond_to do |format|
      format.html { redirect_to categories_cities_url, notice: 'Categories city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_city
      @categories_city = CategoriesCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_city_params
      params.permit(:category_id, :city_id, :status)
    end
end
