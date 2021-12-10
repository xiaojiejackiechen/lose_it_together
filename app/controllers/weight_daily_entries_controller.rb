class WeightDailyEntriesController < ApplicationController
  before_action :set_weight_daily_entry, only: %i[show edit update destroy]

  def index
    @q = WeightDailyEntry.ransack(params[:q])
    @weight_daily_entries = @q.result(distinct: true).includes(:weight_tracker_user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @weight_daily_entry = WeightDailyEntry.new
  end

  def edit; end

  def create
    @weight_daily_entry = WeightDailyEntry.new(weight_daily_entry_params)

    if @weight_daily_entry.save
      message = "WeightDailyEntry was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @weight_daily_entry, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @weight_daily_entry.update(weight_daily_entry_params)
      redirect_to @weight_daily_entry,
                  notice: "Weight daily entry was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @weight_daily_entry.destroy
    message = "WeightDailyEntry was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to weight_daily_entries_url, notice: message
    end
  end

  private

  def set_weight_daily_entry
    @weight_daily_entry = WeightDailyEntry.find(params[:id])
  end

  def weight_daily_entry_params
    params.require(:weight_daily_entry).permit(:weight_tracker_user_id,
                                               :weight_in_lb, :recorded_date)
  end
end
