class CreateDayJobs < ActiveRecord::Migration
  def change
    create_table :day_jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.text :apply_instruction
      t.string :company_name
      t.string :url
      t.string :email
      t.integer :lower_bound
      t.integer :higher_bound
      t.boolean :is_published, :default => false
      t.string :token
      t.date :created_on
      t.date :updated_on
      t.string :ip
      t.boolean :email_confirmed
      t.datetime :email_confirmed_at
      t.timestamps
    end
  end
end
