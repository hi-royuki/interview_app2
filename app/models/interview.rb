class Interview < ApplicationRecord
  belongs_to :company_name, optional: true

  validates :content, presence: true
  validates :answer, presence: true
end
