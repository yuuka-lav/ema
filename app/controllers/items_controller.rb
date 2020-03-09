class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC").page.per(3)
    @images = Image.all
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
    @item = Item.new
    @item.images.new
    @items = Item.includes(:images).order('created_at DESC')
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
      
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, images_attributes: [:src])
  end
end
