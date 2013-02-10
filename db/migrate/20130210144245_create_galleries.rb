class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.integer :tag_id
      t.integer :image_id

      t.timestamps
    end
  end
end
