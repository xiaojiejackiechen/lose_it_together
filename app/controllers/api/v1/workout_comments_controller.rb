class Api::V1::WorkoutCommentsController < Api::V1::GraphitiController
  def index
    workout_comments = WorkoutCommentResource.all(params)
    respond_with(workout_comments)
  end

  def show
    workout_comment = WorkoutCommentResource.find(params)
    respond_with(workout_comment)
  end

  def create
    workout_comment = WorkoutCommentResource.build(params)

    if workout_comment.save
      render jsonapi: workout_comment, status: 201
    else
      render jsonapi_errors: workout_comment
    end
  end

  def update
    workout_comment = WorkoutCommentResource.find(params)

    if workout_comment.update_attributes
      render jsonapi: workout_comment
    else
      render jsonapi_errors: workout_comment
    end
  end

  def destroy
    workout_comment = WorkoutCommentResource.find(params)

    if workout_comment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: workout_comment
    end
  end
end
