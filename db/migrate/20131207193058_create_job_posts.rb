class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|

      t.references :location
      t.references :category

      t.string :title
      t.text   :description

      t.date   :due_date

      t.string :state

      t.timestamps
    end

    add_index :job_posts, :location_id
    add_index :job_posts, :category_id
  end
end
