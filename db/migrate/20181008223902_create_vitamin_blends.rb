class CreateVitaminBlends < ActiveRecord::Migration[5.2]
  def change
    create_table :vitamin_blends do |t|
      t.text :contents
      t.integer :user_id
    end
  end
end
