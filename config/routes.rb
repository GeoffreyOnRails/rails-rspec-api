# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/potato_ton_snapshot/given_day", to: "potato_ton_snapshot#given_day"
  get "/potato_ton_snapshot/best_day_trade", to: "potato_ton_snapshot#best_day_trade"
end
