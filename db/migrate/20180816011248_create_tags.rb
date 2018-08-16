class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end
