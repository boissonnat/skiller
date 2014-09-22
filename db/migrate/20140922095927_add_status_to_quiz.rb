class AddStatusToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :status, :string, :default => 'Pending'
  end
end
