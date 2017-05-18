class OperatorPermissionsController < ApplicationController
  before_action :set_operator_permission, only: [:show, :edit, :update, :destroy]

  # GET /operator_permissions
  # GET /operator_permissions.json
  def index
    @operator_permissions = OperatorPermission.find_by_sql ["SELECT op.id, op.operator_id, op.permission_id, op.status, op.created_at, op.updated_at, o.operator_name, p.permission_name FROM operator_permissions op, operators o, permissions p WHERE op.operator_id = o.id AND op.permission_id = p.id"]
  end

  # GET /operator_permissions/1
  # GET /operator_permissions/1.json
  def show
    @operator_permissions = OperatorPermission.find_by_sql ["SELECT op.id, op.operator_id, op.permission_id, op.status, op.created_at, op.updated_at, o.operator_name, p.permission_name FROM operator_permissions op, operators o, permissions p WHERE op.operator_id = o.id AND op.permission_id = p.id AND op.id = ?", params[:id]]
  end

  # GET /operator_permissions/new
  def new
    @operator_permission = OperatorPermission.new
  end

  # GET /operator_permissions/1/edit
  def edit
  end

  # POST /operator_permissions
  # POST /operator_permissions.json
  def create
    @operator_permission = OperatorPermission.new(operator_permission_params)

    respond_to do |format|
      if @operator_permission.save
        format.html { redirect_to @operator_permission, notice: 'Operator permission was successfully created.' }
        format.json { render :show, status: :created, location: @operator_permission }
      else
        format.html { render :new }
        format.json { render json: @operator_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operator_permissions/1
  # PATCH/PUT /operator_permissions/1.json
  def update
    respond_to do |format|
      if @operator_permission.update(operator_permission_params)
        format.html { redirect_to @operator_permission, notice: 'Operator permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator_permission }
      else
        format.html { render :edit }
        format.json { render json: @operator_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operator_permissions/1
  # DELETE /operator_permissions/1.json
  def destroy
    @operator_permission.destroy
    respond_to do |format|
      format.html { redirect_to operator_permissions_url, notice: 'Operator permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator_permission
      @operator_permission = OperatorPermission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_permission_params
      params.permit(:operator_id, :permission_id, :status)
    end
end
