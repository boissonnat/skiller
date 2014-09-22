class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.text :answer
      t.belongs_to :quiz
      t.belongs_to :question
      t.boolean :is_correct, :default => false

      t.timestamps
    end
  end
end
