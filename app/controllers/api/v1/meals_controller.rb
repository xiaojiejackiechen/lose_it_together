class Api::V1::MealsController < Api::V1::GraphitiController
  def index
    meals = MealResource.all(params)
    respond_with(meals)
  end

  def show
    meal = MealResource.find(params)
    respond_with(meal)
  end

  def create
    meal = MealResource.build(params)

    if meal.save
      render jsonapi: meal, status: :created
    else
      render jsonapi_errors: meal
    end
  end

  def update
    meal = MealResource.find(params)

    if meal.update_attributes
      render jsonapi: meal
    else
      render jsonapi_errors: meal
    end
  end

  def destroy
    meal = MealResource.find(params)

    if meal.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: meal
    end
  end
end
