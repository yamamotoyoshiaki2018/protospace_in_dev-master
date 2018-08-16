class RemovePrototypeidFromTag < ActiveRecord::Migration
  def change
    remove_reference :tags, :prototype_id, index: true, foreign_key: true
  end
end
