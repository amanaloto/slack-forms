class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title

      t.references :user

      t.timestamps null: false
    end
  end
end
