class Public::ProductsController < ApplicationController

  def index
    @genres = Genre.all
    @all_products = Product.all #DB内の全ての商品（全？件の部分で必要なため）
    @products = Product.page(params[:page]) #1ページに10項目ずつ取得
  end

  def show
     @genres = Genre.all
    @product = Product.find(params[:id])
  end

end
