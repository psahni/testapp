class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string  :title
      t.integer :type_of_media
      t.timestamps
    end
  end
end
