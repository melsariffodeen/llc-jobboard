class AddExpiresAtToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :expires_at, :datetime
  end
end
