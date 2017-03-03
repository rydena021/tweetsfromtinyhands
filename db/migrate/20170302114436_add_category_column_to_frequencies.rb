class AddCategoryColumnToFrequencies < ActiveRecord::Migration[5.0]
  def change
    add_column :frequencies, :category, :string
  end
end
