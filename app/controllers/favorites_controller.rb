class FavoritesController < ApplicationController
  respond_to :json
  before_filter :find_user,     :only   => [:index, :create]
  before_filter :find_favorite, :except => [:index, :create]

  def index
    @favorites = Favorite.all
    respond_with @favorites
  end

  def show
    respond_with @favorite
  end

  def create
    @favorite = Favorite.create(favorite_params)
    respond_with @favorite
  end

  def update
    @favorite.update_attributes(favorite_params)
    respond_with @favorite
  end

  def destroy
    @favorite.destroy
  end

  private
    def find_user
      @user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def find_favorite
      @favorite = Favorite.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      head 404
    end

    def favorite_params
      params.require(:favorite).permit(:name, :meal)
    end
end
