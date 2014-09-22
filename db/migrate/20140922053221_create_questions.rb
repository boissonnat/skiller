class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :statement
      t.text :right_answer

      t.timestamps
    end
  end
end
