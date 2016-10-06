class PantryIngredientsController < ApplicationController
  def index
    @pantry_ingredients = PantryIngredient.where(user_id: current_user.id)
  end

  def new
  end

  def create
    ingredient = Ingredient.find_or_create_by(name: params[:name])

    @pantry_ingredient = PantryIngredient.create(user_id: current_user.id,
                                                 ingredient_id: ingredient.id,
                                                 measurement: params[:measurement])

    if @pantry_ingredient.save
      flash[:success] = 'Successfully added a new ingredient!'
      redirect_to '/pantry'
    else
      flash[:danger] = 'Ingredient not saved!'
      render 'new.html.erb'
    end
  end

  def show
    pantry = PantryIngredient.find(params[:id])
    @pantry_ingredient = PantryIngredient.find_by("user_id = ? AND ingredient_id = ?", current_user.id, pantry.ingredient_id)
  end

  def edit
    @pantry_ingredient = PantryIngredient.find(params[:id])
  end

  def update
    @pantry_ingredient = PantryIngredient.find(params[:id])
    @pantry_ingredient.update(measurement: params[:measurement])

    flash[:success] = 'Successfully updated ingredient!'
    redirect_to '/pantry'
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id])
    @pantry_ingredient.destroy

    flash[:success] = 'Successfully deleted ingredient'
    redirect_to '/pantry'  
  end
end
