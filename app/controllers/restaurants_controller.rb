class RestaurantsController < ApplicationController
    def index
        restaurants = Restaurant.all
        render json: restaurants, only: [:id, :name, :address]
    end

    def show
        restaurant = find_restaurant
        render json: restaurant
    end

    def destroy
        if @restaurant
          @restaurant.destroy
          head :no_content
        else
          render json: { error: 'Restaurant not found' }, status: :not_found
        end
      end

  private

    def find_restaurant
        Restaurant.find(params[:id])
    end
end
