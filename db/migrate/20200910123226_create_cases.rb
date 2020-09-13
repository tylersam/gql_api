class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.references :lawyer, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :court, null: false, foreign_key: true
      t.integer :value, null: false
      t.integer :status, null: false, default: 0
      t.date :case_date, null: false

      t.timestamps
    end
  end
end
