require "rails_helper"

RSpec.describe WeightDailyEntryResource, type: :resource do
  describe "serialization" do
    let!(:weight_daily_entry) { create(:weight_daily_entry) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(weight_daily_entry.id)
      expect(data.jsonapi_type).to eq("weight_daily_entries")
    end
  end

  describe "filtering" do
    let!(:weight_daily_entry1) { create(:weight_daily_entry) }
    let!(:weight_daily_entry2) { create(:weight_daily_entry) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: weight_daily_entry2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([weight_daily_entry2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:weight_daily_entry1) { create(:weight_daily_entry) }
      let!(:weight_daily_entry2) { create(:weight_daily_entry) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      weight_daily_entry1.id,
                                      weight_daily_entry2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      weight_daily_entry2.id,
                                      weight_daily_entry1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
