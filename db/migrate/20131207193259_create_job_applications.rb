class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|

      t.references :job_post

      t.string :applicant_first_name
      t.string :applicant_last_name
      t.string :applicant_email

      t.text :cover_letter

      t.timestamps
    end

    add_index :job_applications, :job_post_id
  end
end
