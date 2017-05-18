class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id"]
  end

  # GET /user/:user_id/orders
  def ordersbyuser
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.user_id = ?", params[:user_id]]
  end

  # GET /statuses/:status/orders 是否关闭
  def ordersbystatus
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.status = ?", params[:status]]
  end


  def ordersbyuserandlogistics
    if params[:logistics_id] == '0'
      @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND lo.user_id = ? AND logistics_id >= 10 AND logistics_id < 20", params[:user_id]]
    elsif params[:logistics_id] == '1'
      @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND user_id = ? AND logistics_id >= 20 AND logistics_id < 70", params[:user_id]]
    elsif params[:logistics_id] == '2'
      @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND user_id = ? AND logistics_id = 70", params[:user_id]]
    else
      @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND user_id = ? AND logistics_id = ?", params[:user_id],params[:logistics_id]]
    end
  end 

  # GET /couriers/:courier_id/orders
  def ordersbycourier
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = ?", params[:courier_id]]
  end
  # # GET /couriers/:courier_id/statuses/:status/orders
  # def ordersbycourierandstatus
  #   @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time,o.order_number, o.courier_id, o.city_id, o.name, o.logistics_id, o.factory_id, o.station_id,o.pay_status, lo.logistics_name FROM orders o, logistics lo where o.logistics_id = lo.id AND o.courier_id = ? AND o.status = ? ",params[:courier_id],params[:status]]
  # end

  # GET /factories/:factory_id/orders
  def ordersbyfactory
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p, courier_stations cs, station_factories sf where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = cs.courier_id AND cs.station_id = sf.station_id AND sf.factory_id = ?",params[:factory_id]]
  end
  # # GET /factories/:factory_id/statuses/:status/orders
  # def ordersbyfactoryandstatus
  #   @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time,o.order_number, o.courier_id, o.city_id, o.name, o.logistics_id, o.factory_id, o.station_id,o.pay_status, lo.logistics_name FROM orders o, logistics lo where o.logistics_id = lo.id AND o.factory_id = ? AND o.status = ? ",params[:factory_id],params[:status]]
  # end

  # GET /getorders/factories/:factory_id/stations/:station_id/logistics/:logistics_id/orders
  def ordersbyfactoryandstationandlogistics
    if params[:station_id] == '0'
      if params[:logistics_id] == '0'
        @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p, courier_stations cs, station_factories sf where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = cs.courier_id AND cs.station_id = sf.station_id AND sf.factory_id = ?",params[:factory_id]]
      else
        @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p, courier_stations cs, station_factories sf where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = cs.courier_id AND cs.station_id = sf.station_id AND sf.factory_id = ? AND o.logistics_id = ?",params[:factory_id],params[:logistics_id]]    
      end
    else
      if params[:logistics_id] == '0'
        @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p, courier_stations cs, station_factories sf where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = cs.courier_id AND cs.station_id = sf.station_id AND sf.factory_id = ? AND cs.station_id = ?",params[:factory_id],params[:station_id]]
      else
        @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p, courier_stations cs, station_factories sf where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.courier_id = cs.courier_id AND cs.station_id = sf.station_id AND sf.factory_id = ? AND cs.station_id = ? AND o.logistics_id = ?",params[:factory_id],params[:station_id],params[:logistics_id]]
      end
    end
  end
  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = Order.find_by_sql ["SELECT o.id, o.user_id, o.status, o.item_num, o.total_price, o.address, o.finished_date, o.created_at,o.updated_at,o.appointment_time, o.order_number, o.courier_id, o.city_id, o.order_name, o.logistics_id, o.pay_status_id, u.username, c.courier_name, ct.city_name, lo.logistics_name, p.pay_status_name FROM orders o, users u, couriers c, cities ct, logistics lo, pay_statuses p where o.user_id = u.id AND o.courier_id = c.id AND o.city_id = ct.id AND o.logistics_id = lo.id AND o.pay_status_id = p.id AND o.id = ? ",params[:id]]
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
    #  params.require(:order).permit(:user_id, :status, :item_num, :totol_price, :address, :finished_date)
      params.permit(:user_id, :status, :item_num, :total_price, :address, :finished_date, :appointment_time, :order_number, :courier_id, :city_id, :order_name,:logistics_id, :pay_status_id )
    end
end
