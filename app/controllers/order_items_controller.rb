class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.find_by_sql ["SELECT oi.id, oi.order_id, oi.product_id, oi.number, oi.created_at, oi.updated_at, p.product_name FROM order_items oi, products p WHERE oi.product_id = p.id"]
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
     @order_items = OrderItem.find_by_sql ["SELECT oi.id, oi.order_id, oi.product_id, oi.number, oi.created_at, oi.updated_at, p.product_name FROM order_items oi, products p WHERE oi.product_id = p.id AND oi.id = ?",params[:id]]
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end
  
  def orderitemsbyorder
     @order_items = OrderItem.find_by_sql ["SELECT oi.id, oi.order_id, oi.product_id, oi.number, oi.created_at, oi.updated_at, p.product_name FROM order_items oi, products p WHERE oi.product_id = p.id AND oi.order_id = ?",params[:order_id]]
  end
  
  # GET /api/factories/:factory_id/stations/:station_id/products/:product_id/order_items
  # def orderitemsbyfactoryandstationandproduct
  #   if params[:station_id] == '0'
  #     if params[:product_id] == '0'
  #       @order_items = OrderItem.find_by_sql ["SELECT oi.id,oi.order_id,oi.product_id,oi.number,oi.created_at,oi.updated_at, p.product_name,o.station_id, o.logistics_id, o.pay_status, lo.logistics_name, pr.price, st.station_name FROM order_items oi, products p, orders o, price_rules pr, logistics lo,stations st WHERE st.id=o.station_id AND p.id = oi.product_id AND p.price_type_id = pr.price_type_id AND oi.order_id = o.id AND oi.product_id = pr.product_id AND o.logistics_id = lo.id AND o.factory_id = ?",params[:factory_id]]
  #     else
  #       @order_items = OrderItem.find_by_sql ["SELECT oi.id,oi.order_id,oi.product_id,oi.number,oi.created_at,oi.updated_at, p.product_name,o.station_id, o.logistics_id, o.pay_status, lo.logistics_name, pr.price,st.station_name FROM order_items oi, products p, orders o, price_rules pr, logistics lo,stations st WHERE st.id=o.station_id AND p.id = oi.product_id AND p.price_type_id = pr.price_type_id AND oi.order_id = o.id AND oi.product_id = pr.product_id AND o.logistics_id = lo.id AND o.factory_id = ? AND p.id = ?",params[:factory_id],params[:product_id]]
  #     end
  #   else
  #     if params[:product_id] =='0'
  #       @order_items = OrderItem.find_by_sql ["SELECT oi.id,oi.order_id,oi.product_id,oi.number,oi.created_at,oi.updated_at, p.product_name,o.station_id, o.logistics_id, o.pay_status, lo.logistics_name, pr.price,st.station_name FROM order_items oi, products p, orders o, price_rules pr, logistics lo, stations st WHERE st.id=o.station_id AND p.id = oi.product_id AND p.price_type_id = pr.price_type_id AND oi.order_id = o.id AND oi.product_id = pr.product_id AND o.logistics_id = lo.id AND o.factory_id = ? AND o.station_id = ?",params[:factory_id],params[:station_id]]
  #     else
  #       @order_items = OrderItem.find_by_sql ["SELECT oi.id,oi.order_id,oi.product_id,oi.number,oi.created_at,oi.updated_at, p.product_name,o.station_id, o.logistics_id, o.pay_status, lo.logistics_name, pr.price,st.station_name FROM order_items oi, products p, orders o, price_rules pr, logistics lo, stations st WHERE st.id=o.station_id AND p.id = oi.product_id AND p.price_type_id = pr.price_type_id AND oi.order_id = o.id AND oi.product_id = pr.product_id AND o.logistics_id = lo.id AND o.factory_id = ? AND o.station_id = ? AND p.id = ?",params[:factory_id],params[:station_id],params[:product_id]]
  #     end
  #   end
  # end
  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
    #  params.require(:order_item).permit(:order_id, :product_id, :number)
      params.permit(:order_id, :product_id, :number)
    end
end
