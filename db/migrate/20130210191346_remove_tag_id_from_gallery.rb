class RemoveTagIdFromGallery < ActiveRecord::Migration
  def up
      remove_column :galleries, :tag_id
      add_column :galleries, :project_id, :integer
  end

  def down
  end
end
