class PantryIngredientsController < ApplicationController
  def index
    @pantry_ingredients = PantryIngredient.all
  end

  def new
    @pantry_ingredient = PantryIngredient.new
  end

  def create
    ingredient = Ingredient.find_or_create_by
    @pantry_ingredient = PantryIngredient.create(user_id: current_user.id,
                                                 ingredient_id: params[:id])
                                                 # add measurement
    if @pantry_ingredient.save
      Ingredient.create(name: params[:name])

      flash[:success] = 'Successfully added a new ingredient!'
      redirect_to '/pantry'
    else
      flash[:danger] = 'Ingredient not saved!'
      render 'new.html.erb'
    end
  end

  def show
    @pantry_ingredient = PantryIngredient.find(params[:id])
  end

  def edit
    @pantry_ingredient = PantryIngredient.find(params[:id]) 
  end

  def update
    @pantry_ingredient = PantryIngredient.find(params[:id])
    # @pantry_ingredient.update()
    # edit when we want to change measurements
    # flash[:success] = 'Successfully added a new ingredient!'
    # redirect_to '/pantry'
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id])
    @pantry_ingredient.destroy

    flash[:success] = 'Successfully deleted ingredient'
    redirect_to '/pantry'  
  end
end
