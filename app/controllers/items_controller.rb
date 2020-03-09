class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC").page.per(3)
    @images = Image.all
  end
  def show
    @item = Item.find(params[:id])
  end
  def new
  end
end
