class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
