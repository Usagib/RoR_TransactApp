class Transaction < ApplicationRecord
  belongs_to :user
  has_one :group

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true

  def group?
    self.group != nil
  end
end
