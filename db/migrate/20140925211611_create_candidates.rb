class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.belongs_to :organization

      t.timestamps
    end

    add_belongs_to :quizzes, :candidate
    remove_column :quizzes, :candidate_email, :string
  end
end
