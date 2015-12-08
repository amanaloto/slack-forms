class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :relevance
      t.integer :mastery
      t.integer :documentation
      t.integer :presentation_quality

      t.references :presentation_id
      t.references :user_id

      t.timestamps null: false
    end
  end
end
