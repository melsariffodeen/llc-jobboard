class AddHowToApplyToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :how_to_apply, :text
  end
end
