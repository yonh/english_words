class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.integer :access_count
      t.integer :correct_count
      t.integer :error_count

      t.timestamps null: false
    end
  end
end
