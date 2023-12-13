class Api::V1::RecipesController < Api::V1::ApiController
  def index
    recipes = Recipe.all

    render status: 200, json: { recipes: recipes.as_json(only: [:tile, :cook_time, :recipe_type_id, :user_id.email]) }
  end
end