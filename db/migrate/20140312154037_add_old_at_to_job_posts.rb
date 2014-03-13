class AddOldAtToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :old_at, :datetime
  end
end
