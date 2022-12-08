# frozen_string_literal: true

class CreatePotatoTonSnapshots < ActiveRecord::Migration[6.1]
  def change
    create_table :potato_ton_snapshots do |t|
      t.decimal :value, precision: 10, scale: 2, null: false
      t.timestamp :time, null: false

      t.timestamps
    end
  end
end
