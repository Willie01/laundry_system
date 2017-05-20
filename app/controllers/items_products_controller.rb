class ItemsProductsController < ApplicationController
  before_action :set_items_product, only: [:show, :edit, :update, :destroy]

  # GET /items_products
  # GET /items_products.json
  def index
    @items_products = ItemsProduct.find_by_sql ["SELECT ip.id, ip.product_id, ip.order_item_id, ip.logistics_id, ip.created_at, ip.updated_at, p.product_name, oi.order_id, lo.logistics_name FROM items_products ip, products p, order_items oi, logistics lo WHERE ip.product_id = p.id AND ip.order_item_id = oi.id AND ip.logistics_id = lo.id"]
  end

  # GET /items_products/1
  # GET /items_products/1.json
  def show
    @items_products = ItemsProduct.find_by_sql ["SELECT ip.id, ip.product_id, ip.order_item_id, ip.logistics_id, ip.created_at, ip.updated_at, p.product_name, oi.order_id, lo.logistics_name FROM items_products ip, products p, order_items oi, logistics lo WHERE ip.product_id = p.id AND ip.order_item_id = oi.id AND ip.logistics_id = lo.id AND ip.id = ?", params[:id]]
  end

  def itemsbyproduct
    @items_products = ItemsProduct.find_by_sql ["SELECT ip.id, ip.product_id, ip.order_item_id, ip.logistics_id, ip.created_at, ip.updated_at, p.product_name, oi.order_id, lo.logistics_name FROM items_products ip, products p, order_items oi, logistics lo WHERE ip.product_id = p.id AND ip.order_item_id = oi.id AND ip.logistics_id = lo.id AND ip.product_id = ?", params[:product_id]]
  end

  def itemsbylogistics
    @items_products = ItemsProduct.find_by_sql ["SELECT ip.id, ip.product_id, ip.order_item_id, ip.logistics_id, ip.created_at, ip.updated_at, p.product_name, oi.order_id, lo.logistics_name FROM items_products ip, products p, order_items oi, logistics lo WHERE ip.product_id = p.id AND ip.order_item_id = oi.id AND ip.logistics_id = lo.id AND ip.logistics_id = ?", params[:logistics_id]]
  end

  def itemsbylogisticsandproduct
    @items_products = ItemsProduct.find_by_sql ["SELECT ip.id, ip.product_id, ip.order_item_id, ip.logistics_id, ip.created_at, ip.updated_at, p.product_name, oi.order_id, lo.logistics_name FROM items_products ip, products p, order_items oi, logistics lo WHERE ip.product_id = p.id AND ip.order_item_id = oi.id AND ip.logistics_id = lo.id AND ip.product_id = ? AND ip.logistics_id=?",params[:product_id], params[:logistics_id]]
  end

  # GET /items_products/new
  def new
    @items_product = ItemsProduct.new
  end

  # GET /items_products/1/edit
  def edit
  end

  # POST /items_products
  # POST /items_products.json
  def create
    @items_product = ItemsProduct.new(items_product_params)

    respond_to do |format|
      if @items_product.save
        format.html { redirect_to @items_product, notice: 'Items product was successfully created.' }
        format.json { render :show, status: :created, location: @items_product }
      else
        format.html { render :new }
        format.json { render json: @items_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_products/1
  # PATCH/PUT /items_products/1.json
  def update
    respond_to do |format|
      if @items_product.update(items_product_params)
        format.html { redirect_to @items_product, notice: 'Items product was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_product }
      else
        format.html { render :edit }
        format.json { render json: @items_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_products/1
  # DELETE /items_products/1.json
  def destroy
    @items_product.destroy
    respond_to do |format|
      format.html { redirect_to items_products_url, notice: 'Items product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_product
      @items_product = ItemsProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def items_product_params
      params.permit(:product_id, :order_item_id, :status, :logistics_id, :item_price)
    end
end
