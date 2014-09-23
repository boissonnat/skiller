class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :bio
      t.string :image_url

      t.timestamps
    end

    create_table :organizations_questions, id: false do |t|
      t.belongs_to :organizations
      t.belongs_to :questions
    end

    add_belongs_to :users, :organization
    add_column :questions, :is_private, :boolean, :default => true

  end
end
