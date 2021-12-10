class Api::V1::MealCommentsController < Api::V1::GraphitiController
  def index
    meal_comments = MealCommentResource.all(params)
    respond_with(meal_comments)
  end

  def show
    meal_comment = MealCommentResource.find(params)
    respond_with(meal_comment)
  end

  def create
    meal_comment = MealCommentResource.build(params)

    if meal_comment.save
      render jsonapi: meal_comment, status: :created
    else
      render jsonapi_errors: meal_comment
    end
  end

  def update
    meal_comment = MealCommentResource.find(params)

    if meal_comment.update_attributes
      render jsonapi: meal_comment
    else
      render jsonapi_errors: meal_comment
    end
  end

  def destroy
    meal_comment = MealCommentResource.find(params)

    if meal_comment.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: meal_comment
    end
  end
end
