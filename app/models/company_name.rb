class CompanyName < ApplicationRecord

  belongs_to :user
  has_many :interviews, dependent: :destroy

  validates :interview_date, presence: true
  validates :company_name, presence: true

end
