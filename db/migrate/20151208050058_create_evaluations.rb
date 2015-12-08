class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :relevance
      t.integer :mastery
      t.integer :documentation
      t.integer :presentation_quality
      t.text :comments

      t.references :presentation
      t.references :user

      t.timestamps null: false
    end
  end
end
