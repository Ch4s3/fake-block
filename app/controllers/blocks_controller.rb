class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @blocks = Block.all
  end

  def show
  end

  def new
    @block = Block.new
  end

  def edit
  end

  def create
    @block = Block.new(block_params)

    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render action: 'show', status: :created, location: @block }
      else
        format.html { render action: 'new' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end

  private
    def set_block
      @block = Block.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:slab, :usr_id)
    end
end
