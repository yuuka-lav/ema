class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :confirm, :pay, :destroy]
  require 'payjp'
  def index
    @items = Item.all.order("created_at DESC").page.per(3)
    @images = Image.all
  end
  def show
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
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :condition_id, :deliverydate_id, :deliverypays_id, :prefecture_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
