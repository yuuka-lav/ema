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
    @parents = Category.all.order("id ASC").limit(14)
  end
  def create
    puts Item.new
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
      
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :condition_id, :deliverydate_id, :deliverypays_id, :prefecture_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
