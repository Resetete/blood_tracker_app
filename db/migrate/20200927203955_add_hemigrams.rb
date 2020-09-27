class AddHemigrams < ActiveRecord::Migration[6.0]
  def change
    create_table :hemigrams do |t|
      t.string :parameter
      t.decimal :value
      t.string :unit
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
