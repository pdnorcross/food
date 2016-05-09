class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :state
      t.string :county
      t.decimal :pct_diabetes_adult
      t.decimal :pct_obese_adult
      t.decimal :pct_obese_child
      t.decimal :pct_la_stores
      t.decimal :pct_la_li
      t.decimal :pct_la_nc
      t.integer :ffr
      t.integer :dirsales_amnt
      t.integer :fmrkt
      t.integer :groc
      t.integer :superc

      t.timestamps null: false
    end
  end
end
