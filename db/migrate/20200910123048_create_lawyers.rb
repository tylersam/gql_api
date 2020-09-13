class CreateLawyers < ActiveRecord::Migration[6.0]
  def change
    create_table :lawyers do |t|
      t.string :name, null: false
      t.string :ssn, null: false

      t.timestamps
    end
  end
end
