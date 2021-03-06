class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  # GET /product_categories
  # GET /product_categories.json
  def index
    @product_categories = ProductCategory.find_by_sql ["SELECT pc.id, pc.product_id, pc.category_id, pc.status, pc.created_at, pc.updated_at , p.product_name, c.category_name FROM product_categories pc, products p, categories c WHERE pc.product_id = p.id AND pc.category_id = c.id"]
  end

  # GET /product_categories/1
  # GET /product_categories/1.json
  def show
    @product_categories = ProductCategory.find_by_sql ["SELECT pc.id, pc.product_id, pc.category_id, pc.status, pc.created_at, pc.updated_at , p.product_name, c.category_name FROM product_categories pc, products p, categories c WHERE pc.product_id = p.id AND pc.category_id = c.id AND pc.id = ?",params[:id]]
  end


  def productsbycategory
    @product_categories = ProductCategory.find_by_sql ["SELECT pc.id, pc.product_id, pc.category_id, pc.status, pc.created_at, pc.updated_at , p.product_name, c.category_name FROM product_categories pc, products p, categories c WHERE pc.product_id = p.id AND pc.category_id = c.id AND pc.category_id = ?",params[:category_id]]
  end


  # GET /product_categories/new
  def new
    @product_category = ProductCategory.new
  end

  # GET /product_categories/1/edit
  def edit
  end

  # POST /product_categories
  # POST /product_categories.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to @product_category, notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_categories/1
  # PATCH/PUT /product_categories/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to @product_category, notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to product_categories_url, notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params
      params.require(:product_category).permit(:product_id, :category_id, :status)
    end
end
