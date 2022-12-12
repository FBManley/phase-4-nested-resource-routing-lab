class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = find_user
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find_by(id: params[:id])
    render json: item
  end

  def create
    user = find_user
    item = user.items.create(item_params)
    render json: item, status: :created
  end

  private 
  def item_params
    params.permit(:name, :description, :price)
  end

  def find_user
    User.find(params[:user_id])
  end

  def find_item
    Item.find(params[:id])
  end
  def find_user
    User.find(params[:user_id])
  end


end
