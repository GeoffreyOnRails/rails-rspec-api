# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PotatoTonSnapshot", type: :request do
  let(:parsed_response) { JSON.parse response.body }
  let(:date) { 1.day.ago }
  let!(:potato_ton_snapshots) do
    FactoryBot.build_list(:potato_ton_snapshot, 24) do |record, i|
      record.time = Date.yesterday + (i + 1).second
      record.value = 99.9 + i
      record.save!
    end
  end

  describe "GET /potato_ton_snapshot/given_day" do
    it "responds successfully" do
      get "/potato_ton_snapshot/given_day?time=#{date}"
      expect(response).to have_http_status(:ok)
    end

    it "returns potato_ton_snapshots" do
      get "/potato_ton_snapshot/given_day?time=#{date}"
      expect(parsed_response).to eq JSON.parse potato_ton_snapshots.to_json
    end

    context "bad request" do
      it "returns bad_request" do
        get "/potato_ton_snapshot/given_day?time=test"
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET /potato_ton_snapshot/given_day" do
    it "responds successfully" do
      get "/potato_ton_snapshot/best_day_trade?time=#{date}"
      expect(response).to have_http_status(:ok)
    end

    it "returns max gains" do
      get "/potato_ton_snapshot/best_day_trade?time=#{date}"
      max = potato_ton_snapshots.pluck(:value).max * 100
      min = potato_ton_snapshots.pluck(:value).min * 100
      expect(parsed_response).to eq (max - min).to_s
    end
  end
end
