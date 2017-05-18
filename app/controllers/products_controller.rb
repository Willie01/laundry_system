class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end
  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # # GET /categories/:category_id/products
  # def productsbycategory
  #   @products = Product.find_by_sql ["SELECT p.id, p.status, p.logo, p.created_at, p.updated_at, p.product_name, p.description, p.price_type_id, cate.city_id, cate.id as cate_id,pr.price FROM products p, categories cate,price_rules pr WHERE p.category_id = cate.id AND pr.product_id=p.id AND p.price_type_id = pr.price_type_id AND p.category_id = ?", params[:category_id]]
  # end

  # # GET /statuses/:status/products
  # def productsbystatus
  #   @products = Product.find_by_sql ["SELECT p.id, p.status, p.logo, p.created_at, p.updated_at, p.product_name, p.description, p.price_type_id, cate.city_id, cate.id as cate_id, pr.price FROM products p, categories cate,price_rules pr WHERE p.category_id = cate.id AND pr.product_id = p.id AND p.price_type_id = pr.price_type_id AND p.status = ?" , params[:status]]
  # end

  # # GET /categories/:category_id/products/:id
  # def productbycategoryandid
  #   @product = Product.find_by(category_id: params[:category_id], id: params[:id])
  # end

  # # GET /statuses/:status/products/:id
  # def productbystatusandid
  #   @product = Product.find_by(status: params[:status], id: params[:id])
  # end
  
  # def productsbyfactory
  #   @products = Product.find_by_sql ["SELECT p.id, p.status, p.logo, p.created_at, p.updated_at, p.product_name, p.description, p.price_type_id, f.city_id, cate.id as cate_id,pr.price FROM products p,factories f,categories cate,price_rules pr WHERE f.id = ? AND cate.city_id = f.city_id AND p.category_id = cate.id AND pr.product_id = p.id AND p.price_type_id = pr.price_type_id", params[:factory_id]]
  # end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
    #  params.require(:product).permit(:price, :category_id, :status, :logo, :name, :description)
      params.permit( :status, :logo, :product_name, :description)
    end
end
