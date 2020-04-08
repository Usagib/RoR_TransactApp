class Mytransaction < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true

  def group?
    !group_id.nil?
    group.name != 'No group'
  end

  def nogroup?
    group.name == 'No group'
  end
end
