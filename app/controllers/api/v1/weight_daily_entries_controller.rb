class Api::V1::WeightDailyEntriesController < Api::V1::GraphitiController
  def index
    weight_daily_entries = WeightDailyEntryResource.all(params)
    respond_with(weight_daily_entries)
  end

  def show
    weight_daily_entry = WeightDailyEntryResource.find(params)
    respond_with(weight_daily_entry)
  end

  def create
    weight_daily_entry = WeightDailyEntryResource.build(params)

    if weight_daily_entry.save
      render jsonapi: weight_daily_entry, status: :created
    else
      render jsonapi_errors: weight_daily_entry
    end
  end

  def update
    weight_daily_entry = WeightDailyEntryResource.find(params)

    if weight_daily_entry.update_attributes
      render jsonapi: weight_daily_entry
    else
      render jsonapi_errors: weight_daily_entry
    end
  end

  def destroy
    weight_daily_entry = WeightDailyEntryResource.find(params)

    if weight_daily_entry.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: weight_daily_entry
    end
  end
end
