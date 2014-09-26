class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :review
      t.belongs_to :organization

      t.timestamps
    end

    add_belongs_to :quizzes, :candidate
    remove_column :quizzes, :candidate_email, :string
  end
end
