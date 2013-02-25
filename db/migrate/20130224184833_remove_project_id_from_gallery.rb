class RemoveProjectIdFromGallery < ActiveRecord::Migration
  def up
      remove_column :galleries, :project_id
  end

  def down
  end
end
