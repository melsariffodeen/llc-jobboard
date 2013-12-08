class RemoveLocationIdFromJobPosts < ActiveRecord::Migration
  def change
    remove_column :job_posts, :location_id
  end
end
