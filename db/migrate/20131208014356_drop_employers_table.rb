class DropEmployersTable < ActiveRecord::Migration
  def up
    drop_table :employers
  end
end
