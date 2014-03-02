class AddUserIdToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :user_id, :integer
    add_index :job_posts, :user_id
  end
end
