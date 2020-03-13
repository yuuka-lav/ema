class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :pay, :destroy, :done]
  require 'payjp'

  def index
    @items = Item.order("created_at DESC")
    @images = Image.all
  end
  def show
  end
  def new
    @item = Item.new
    @item.images.new
    @items = Item.includes(:images).order('created_at DESC')
    @category = Category.all.order("id ASC").limit(13) #カテゴリー親情報取得
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

  def confirm
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_PRIVATE_KEY]
      
      customer = Payjp::Customer.retrieve(@card.customer_id)
      
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    :amount => 13500,
    :customer => @card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done' 
  end

  def done
    @product_purchaser= Item.find(params[:id])
    @product_purchaser.update( buyer_id: current_user.id)
  end

  def destroy
    redirect_to root_path if @item.user_id == current_user.id && @item.destroy
  def category_children
    @category_children = Category.find(params[:productcategory]).children
  end

  def category_grandchildren
    @category_grandchild = Category.find(params[:productcategory]).children
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :price, :condition_id, :deliverydate_id, :deliverypays_id, :brand, :prefecture_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
