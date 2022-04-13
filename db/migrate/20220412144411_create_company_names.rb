class CreateCompanyNames < ActiveRecord::Migration[5.2]
  def change
    create_table :company_names do |t|
      t.integer :user_id
      t.date :interview_date
      t.string :company_name
      t.timestamps
    end
  end
end
