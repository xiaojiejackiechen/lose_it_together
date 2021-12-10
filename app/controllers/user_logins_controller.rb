class UserLoginsController < ApplicationController
  before_action :set_user_login, only: %i[show edit update destroy]

  def index
    @user_logins = UserLogin.page(params[:page]).per(10)
  end

  def show
    @meal_comment = MealComment.new
    @workout_comment = WorkoutComment.new
    @nutritionist_profile = NutritionistProfile.new
    @personal_trainer_profile = PersonalTrainerProfile.new
    @weight_tracker_profile = WeightTrackerProfile.new
  end

  def new
    @user_login = UserLogin.new
  end

  def edit; end

  def create
    @user_login = UserLogin.new(user_login_params)

    if @user_login.save
      redirect_to @user_login, notice: "User login was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_login.update(user_login_params)
      redirect_to @user_login, notice: "User login was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_login.destroy
    redirect_to user_logins_url,
                notice: "User login was successfully destroyed."
  end

  private

  def set_user_login
    @user_login = UserLogin.find(params[:id])
  end

  def user_login_params
    params.require(:user_login).permit(:username)
  end
end
