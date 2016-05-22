class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.string :cn
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
