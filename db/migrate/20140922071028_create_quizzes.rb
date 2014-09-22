class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string  :key
      t.integer :note
      t.string  :candidate_email

      t.timestamps
    end

    create_table :application_areas_quizzes, id: false do |t|
      t.belongs_to :application_area
      t.belongs_to :quiz
    end
  end
end
