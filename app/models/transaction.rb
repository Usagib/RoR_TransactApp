class Transaction < ApplicationRecord
  belongs_to :user
  has_many :groups, foreign_key: 'group_id'

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true
end
