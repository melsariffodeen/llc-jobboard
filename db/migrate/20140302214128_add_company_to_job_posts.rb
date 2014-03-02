class AddCompanyToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :company, :string
  end
end
