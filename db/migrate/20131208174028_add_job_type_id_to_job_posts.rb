class AddJobTypeIdToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :job_type_id, :integer
    add_index :job_posts, :job_type_id
  end
end
