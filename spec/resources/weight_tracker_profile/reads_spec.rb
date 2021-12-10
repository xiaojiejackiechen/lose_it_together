require "rails_helper"

RSpec.describe WeightTrackerProfileResource, type: :resource do
  describe "serialization" do
    let!(:weight_tracker_profile) { create(:weight_tracker_profile) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(weight_tracker_profile.id)
      expect(data.jsonapi_type).to eq("weight_tracker_profiles")
    end
  end

  describe "filtering" do
    let!(:weight_tracker_profile1) { create(:weight_tracker_profile) }
    let!(:weight_tracker_profile2) { create(:weight_tracker_profile) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: weight_tracker_profile2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([weight_tracker_profile2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:weight_tracker_profile1) { create(:weight_tracker_profile) }
      let!(:weight_tracker_profile2) { create(:weight_tracker_profile) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      weight_tracker_profile1.id,
                                      weight_tracker_profile2.id,
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
                                      weight_tracker_profile2.id,
                                      weight_tracker_profile1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
