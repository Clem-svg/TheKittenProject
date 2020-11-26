class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_random1 = Item.find(id=rand(1..5))
    @item_random2 = Item.find(id=rand(6..13))
    @item_random3 = Item.find(id=rand(14..20))
  end
end
