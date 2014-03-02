class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :job_post, index: true
      t.text :stripe_response

      t.timestamps
    end
  end
end
