class Post < ApplicationRecord
  belongs_to :user
  validates :company_name, presence: true
  validates :number, presence: true
  validates :type, presence: true
  validates :question_a, presence: true

  def self.search(keyword)
    where(['company_name LIKE(?) OR number LIKE(?) OR type LIKE(?)', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    # Post.where(['company_name like(?) AND number like(?) AND type like(?)', "%#{ keywords[:company_name_keyword]}%", "%#{keywords[:number_keyword]}%", "%#{keywords[:type_keyword]}%"])
  end

# 　タイプをカラム名に使用したため記述
  self.inheritance_column = :_type_disabled
end
