class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.text :data
      t.integer :form_type

      t.timestamps null: false
    end
  end
end
