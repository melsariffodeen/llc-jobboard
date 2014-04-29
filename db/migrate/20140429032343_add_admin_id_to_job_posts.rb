class AddAdminIdToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :admin_id, :integer
    add_index :job_posts, :admin_id
  end
end
