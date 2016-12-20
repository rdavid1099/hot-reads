class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.string :title
      t.string :url
      t.string :submitter_name

      t.timestamps
    end
  end
end
