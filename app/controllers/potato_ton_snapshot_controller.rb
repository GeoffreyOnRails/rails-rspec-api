# frozen_string_literal: true

class PotatoTonSnapshotController < ApplicationController
  def given_day
    date = Date.parse(potato_ton_params[:time])
    PotatoTonSnapshot.potato_ton_params
  end

  def best_day_trade
    date = Date.parse(potato_ton_params[:time])
  end

  private

    def potato_ton_params
      params.permit(:time)
    end
end
