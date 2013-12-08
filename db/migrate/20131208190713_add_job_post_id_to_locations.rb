class AddJobPostIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :job_post_id, :integer
  end
end
