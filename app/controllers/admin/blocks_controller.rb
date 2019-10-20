class Admin::BlocksController < Admin::BaseController
  before_action :set_blocks, only: [:show, :edit, :update, :destroy]  
  
  def index
    @blocks = Block.all

  end
  
  def show
  end
  
  def edit
   
  end
  
  def new
    @block = Block.new
  end
  
  
  
  def create
    @block = Block.new(block_params)
     
    if @block.save
         flash[:success] = 'Block was successfully created.' 
         redirect_to admin_blocks_path(@blocks)
      else
        render 'new'
        end
  end
  
  def update

      if @block.update(block_params)
        flash[:success] = 'Block was successfully updated'
        redirect_to admin_blocks_path
      else
        render 'edit'
      end
    
  end
  
  
  def destroy
    @block.destroy
    flash[:danger] = 'Block was successfully deleted'
    redirect_to admin_blocks_path
  end
  
  private
  
    def set_blocks
      @block = Block.friendly.find(params[:id])
    end
  
    def block_params
      params.require(:block).permit(:title, :body, :slug, :block_position, :block_class, :show_title, page_ids: []) 
    end

    def find_block
       @block = Block.friendly.find(params[:id])
    end
  
end
