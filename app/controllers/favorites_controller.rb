class FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    if Favorite.create(user_id:user.id,item_id:item.id)
      redirect_to item
    else
      redirect_to root_url
    end

  end

  def destroy
    item = Item.find(params[:item_id])
    if favorite=Favorite.find_by(user_id: user.id,item_id:item.id) && favorite.delete
      favorite.delete
      redirect_to item_path(current_user)
    else
      redirect_to root_url
    end
  end
end
