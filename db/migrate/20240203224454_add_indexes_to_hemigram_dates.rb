class AddIndexesToHemigramDates < ActiveRecord::Migration[7.0]
  def change
    # Ensures that each hemigram entry can only have one date
    add_index :hemigram_dates, %i[date hemigram_id], unique: true
    # Adding index to the date field to allow ordering efficiently
    add_index :hemigram_dates, :date
  end
end
