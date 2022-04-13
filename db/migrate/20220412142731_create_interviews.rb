class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.integer :company_name_id
      t.text :content
      t.text :answer
      t.text :memo


      t.timestamps
    end
  end
end
