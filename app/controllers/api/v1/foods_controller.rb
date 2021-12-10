class Api::V1::FoodsController < Api::V1::GraphitiController
  def index
    foods = FoodResource.all(params)
    respond_with(foods)
  end

  def show
    food = FoodResource.find(params)
    respond_with(food)
  end

  def create
    food = FoodResource.build(params)

    if food.save
      render jsonapi: food, status: 201
    else
      render jsonapi_errors: food
    end
  end

  def update
    food = FoodResource.find(params)

    if food.update_attributes
      render jsonapi: food
    else
      render jsonapi_errors: food
    end
  end

  def destroy
    food = FoodResource.find(params)

    if food.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: food
    end
  end
end
