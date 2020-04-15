class Mytransaction < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true

  scope :grouped, -> { where.not("group_id IS NULL") }
  scope :ungrouped, -> { where("group_id IS NULL") }

end
