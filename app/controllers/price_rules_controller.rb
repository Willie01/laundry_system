class PriceRulesController < ApplicationController
  before_action :set_price_rule, only: [:show, :edit, :update, :destroy]

  # GET /price_rules
  # GET /price_rules.json
  def index
    @price_rules = PriceRule.find_by_sql ["SELECT pr.id, pr.price, pr.price_type_id, pr.products_id, pr.city_id, pr.created_at, pr.updated_at, pt.price_type_name, p.product_name, ct.city_name FROM price_rules pr, price_types pt, products p, cities ct WHERE pr.price_type_id = pt.id AND pr.products_id = p.id AND pr.city_id = ct.id "]
  end

  # GET /price_rules/1
  # GET /price_rules/1.json
  def show
    @price_rules = PriceRule.find_by_sql ["SELECT pr.id, pr.price, pr.price_type_id, pr.products_id, pr.city_id, pr.created_at, pr.updated_at, pt.price_type_name, p.product_name, ct.city_name FROM price_rules pr, price_types pt, products p, cities ct WHERE pr.price_type_id = pt.id AND pr.products_id = p.id AND pr.city_id = ct.id AND pr.id = ?",params[:id]]
  end


  def pricerulesbyproduct
    @price_rules = PriceRule.find_by_sql ["SELECT pr.id, pr.price, pr.price_type_id, pr.products_id, pr.city_id, pr.created_at, pr.updated_at, pt.price_type_name, p.product_name, ct.city_name FROM price_rules pr, price_types pt, products p, cities ct WHERE pr.price_type_id = pt.id AND pr.products_id = p.id AND pr.city_id = ct.id AND pr.products_id = ?",params[:product_id]]
  end


  # GET /price_rules/new
  def new
    @price_rule = PriceRule.new
  end

  # GET /price_rules/1/edit
  def edit
  end

  # def pricerulebyproductandtypeandcity
  #   @price_rule = PriceRule.find_by(product_id: params[:product_id], price_type_id: params[:price_type_id],city_id:params[:city_id])
  # end

  # POST /price_rules
  # POST /price_rules.json
  def create
    @price_rule = PriceRule.new(price_rule_params)

    respond_to do |format|
      if @price_rule.save
        format.html { redirect_to @price_rule, notice: 'Price rule was successfully created.' }
        format.json { render :show, status: :created, location: @price_rule }
      else
        format.html { render :new }
        format.json { render json: @price_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_rules/1
  # PATCH/PUT /price_rules/1.json
  def update
    respond_to do |format|
      if @price_rule.update(price_rule_params)
        format.html { redirect_to @price_rule, notice: 'Price rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_rule }
      else
        format.html { render :edit }
        format.json { render json: @price_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_rules/1
  # DELETE /price_rules/1.json
  def destroy
    @price_rule.destroy
    respond_to do |format|
      format.html { redirect_to price_rules_url, notice: 'Price rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_rule
      @price_rule = PriceRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_rule_params
      params.permit(:price, :price_type_id, :product_id, :city_id)
    end
end
