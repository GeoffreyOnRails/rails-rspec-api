# frozen_string_literal: true

class PotatoTonSnapshot < ApplicationRecord
  scope :given_day, ->(date) { where(time: date.midnight..date.end_of_day).order(time: :asc) }
  scope :best_day_trade, ->(date) { where(time: date.midnight..date.end_of_day).select(:value).order(value: :asc) }
end
