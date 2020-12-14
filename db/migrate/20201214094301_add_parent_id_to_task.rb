class AddParentIdToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :parent, foreign_key: { to_table: :tasks }
  end
end
