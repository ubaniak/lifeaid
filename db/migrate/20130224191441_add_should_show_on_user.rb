class AddShouldShowOnUser < ActiveRecord::Migration
  def up
      add_column :users, :should_show, :bool, :default => false, :null => false
  end

  def down
      remove_column :users, :should_show
  end
end
