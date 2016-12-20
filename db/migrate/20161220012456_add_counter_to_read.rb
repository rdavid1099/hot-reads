class AddCounterToRead < ActiveRecord::Migration[5.0]
  def change
    add_column :reads, :counter, :integer, :default => 1
  end
end
