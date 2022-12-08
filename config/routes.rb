# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :potato_ton_snapshot do
    get "/given_day", to: "potato_ton_snapshot#given_day"
  end
end
