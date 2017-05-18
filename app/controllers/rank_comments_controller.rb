class RankCommentsController < ApplicationController
  before_action :set_rank_comment, only: [:show, :edit, :update, :destroy]

  # GET /rank_comments
  # GET /rank_comments.json
  def index
    @rank_comments = RankComment.find_by_sql ["SELECT rc.id, rc.order_id, rc.courier_rank, rc.factory_rank, rc.comment, rc.created_at, rc.updated_at, o.order_name FROM rank_comments rc, orders o WHERE rc.order_id = o.id"]
  end

  # GET /rank_comments/1
  # GET /rank_comments/1.json
  def show
    @rank_comments = RankComment.find_by_sql ["SELECT rc.id, rc.order_id, rc.courier_rank, rc.factory_rank, rc.comment, rc.created_at, rc.updated_at, o.order_name FROM rank_comments rc, orders o WHERE rc.order_id = o.id AND rc.id = ?", params[:id]]
  end

  # GET /rank_comments/new
  def new
    @rank_comment = RankComment.new
  end

  # GET /rank_comments/1/edit
  def edit
  end

  # POST /rank_comments
  # POST /rank_comments.json
  def create
    @rank_comment = RankComment.new(rank_comment_params)

    respond_to do |format|
      if @rank_comment.save
        format.html { redirect_to @rank_comment, notice: 'Rank comment was successfully created.' }
        format.json { render :show, status: :created, location: @rank_comment }
      else
        format.html { render :new }
        format.json { render json: @rank_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rank_comments/1
  # PATCH/PUT /rank_comments/1.json
  def update
    respond_to do |format|
      if @rank_comment.update(rank_comment_params)
        format.html { redirect_to @rank_comment, notice: 'Rank comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @rank_comment }
      else
        format.html { render :edit }
        format.json { render json: @rank_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rank_comments/1
  # DELETE /rank_comments/1.json
  def destroy
    @rank_comment.destroy
    respond_to do |format|
      format.html { redirect_to rank_comments_url, notice: 'Rank comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank_comment
      @rank_comment = RankComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rank_comment_params
     # params.require(:rank_comment).permit(:order_id, :courier_rank, :factory_rank, :comment)
     params.permit(:order_id, :courier_rank, :factory_rank, :comment)
    end
end
