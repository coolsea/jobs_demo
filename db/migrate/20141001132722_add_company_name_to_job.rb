class AddCompanyNameToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :url , :string
    add_column :jobs, :email, :string
    add_column :jobs, :location, :string
    add_column :jobs, :apply_instruction, :text
    add_column :jobs, :created_on, :date
    add_column :jobs, :update_on, :date 

  end
end
