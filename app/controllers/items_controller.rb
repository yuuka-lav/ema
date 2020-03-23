class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :confirm, :pay, :destroy, :done, :edit, :update]
  before_action :set_category, only: [new, :create]
  require 'payjp'

  def index
    @items = Item.order("created_at DESC")
    @images = Image.all
    @itemss = Item.all
    @categories = Category.all
    @parents = Category.where(ancestry: nil)
  end

  def show
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent if @child
    @prefecture = Prefecture.find(@item.prefecture_id)
    @deliverydate = Deliverydate.find(@item.deliverydate_id)
    @deliverypays = Deliverypays.find(@item.deliverypays_id)
    @condition = Condition.find(@item.condition_id)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def new
    @item = Item.new
    @item.images.new
    @items = Item.includes(:images).order('created_at DESC')
    @category = Category.roots
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      @category = Category.roots
      @item.images.new
      render :new
    end
      
  end

  def edit
    @category = Category.roots
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent
    @parent_category = @child_category.parent

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: @child_category.ancestry).each do |child|
      @category_children_array << child
    end

    @category_grandchildren_array = []
    Category.where(ancestry: @grandchild_category.ancestry).each do |grandchild|
      @category_grandchildren_array << grandchild
    end
  end


  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      @category = Category.roots
      render :edit
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
    :amount => @item.price,
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
  end

  def category_children
    @category_children = Category.find(params[:productcategory]).children
  end

  def category_grandchildren
    @category_grandchild = Category.find(params[:productcategory]).children
  end

  def category
    @items = Item.all
    @categories = Category.all
    @parents = Category.where(ancestry: nil)
  end

  def search
    @items = Item.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(16)
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :price, :condition_id, :deliverydate_id, :deliverypays_id, :brand, :prefecture_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_category
    @category = Category.all
  end
end