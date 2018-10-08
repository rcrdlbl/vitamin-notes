class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :user_id
      t.integer :vitamin_blend_id
    end
  end
end
