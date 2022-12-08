# frozen_string_literal: true

MAX_BUY_LIMIT_PER_DAY = 100 # TODO: put this in env variable

class PotatoTonSnapshotController < ApplicationController
  def given_day
    date = Date.parse(potato_ton_params[:time])

    potato_ton_snapshots = PotatoTonSnapshot.given_day(date)
    render json: potato_ton_snapshots, status: :ok
  rescue StandardError
    head :bad_request
  end

  # Querying the best_day_trade by ordering the db by value
  def best_day_trade
    date = Date.parse(potato_ton_params[:time])
    potato_ton_snapshots = PotatoTonSnapshot.best_day_trade(date)
    best_day_trade = (potato_ton_snapshots.last.value - potato_ton_snapshots.first.value) * MAX_BUY_LIMIT_PER_DAY
    render json: best_day_trade, status: :ok
  rescue StandardError
    head :bad_request
  end

  # Use same methode and iterate to get min and max values
  # def best_day_trade
  #   begin

  #   date = Date.parse(potato_ton_params[:time])
  #   potato_ton_snapshots = PotatoTonSnapshot.given_day(date)
  #   minmax_price = potato_ton_snapshots.pluck(:value).minmax
  #   value = (minmax_price[1] - minmax_price[0]) * MAX_BUY_LIMIT_PER_DAY
  #   render json: value, status: :ok
  #   rescue
  #     head :bad_request
  #   end
  # end

  private

    def potato_ton_params
      params.permit(:time)
    end
end
