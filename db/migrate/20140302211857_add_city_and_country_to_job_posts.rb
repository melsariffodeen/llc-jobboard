class AddCityAndCountryToJobPosts < ActiveRecord::Migration
  def change
    add_column :job_posts, :city, :string
    add_column :job_posts, :country, :string
  end
end
