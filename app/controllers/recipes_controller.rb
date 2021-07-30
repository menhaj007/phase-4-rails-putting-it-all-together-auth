class RecipesController < ApplicationController

    def index
        receipes = Recipe.all
        if recipes
            render json: recipes, status: :success
        else
            render json: {error: "not found"}, status: :not_found
        end

    end
end
