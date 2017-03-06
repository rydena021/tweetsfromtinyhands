class CreateFrequencies < ActiveRecord::Migration[5.0]
  def change
    create_table :frequencies do |t|
      t.string :word
      t.integer :frequency

      t.timestamps
    end
  end
end
