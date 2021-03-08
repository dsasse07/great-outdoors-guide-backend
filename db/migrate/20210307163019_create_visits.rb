class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.text :review
      t.text :journal
      t.string :code
      t.integer :score
      t.belongs_to :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
