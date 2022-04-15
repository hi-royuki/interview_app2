class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :company_name
      t.string :number
      t.string :type
      t.string :question_a
      t.string :question_b
      t.string :question_c
      t.string :question_d
      t.string :question_e
      t.string :question_f
      t.string :question_g
      t.string :question_h
      t.string :question_i
      t.string :question_j
      t.string :question_k
      t.string :question_l
      t.string :question_m
      t.string :question_n
      t.text :introduction
      t.timestamps

      t.timestamps
    end
  end
end
