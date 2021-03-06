class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    @block = Block.find(params[:id])
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  def upvote
    @block = Block.find(params[:id])
    @block.upvote_from current_user
    redirect_to :back
  end

  def downvote
    @block = Block.find(params[:id])
    @block.downvote_from current_user
    redirect_to :back
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(block_params)

    if params[:seconds_to_expiration].present?
      @block.expires_in(params[:seconds_to_expiration].to_i)
    end

    respond_to do |format|
      if @block.save
        block_partial_setup(@block)
        format.html { redirect_to :back }
        flash[:notice] = "Block posted"
        format.json { render action: 'show', status: :created, location: @block }
        format.js
      else
        format.html { render action: 'new' }
        flash[:error] = "The block couldn't be posted without an image or text."
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def block_partial_setup block
      @comment = Comment.new
    end

    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:body, :user_id, :image, :name, :viewable)
    end
end
