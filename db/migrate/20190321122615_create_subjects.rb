class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :exam_id

      t.timestamps
    end
  end
end
