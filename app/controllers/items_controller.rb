class ItemsController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all
  end
  def show
  end
  def new
  end
end
