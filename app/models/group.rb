class Group < ApplicationRecord
  belongs_to :user
  has_many :transactions, foreign_key: 'transaction_id'

  validates :name, presence: true, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader
end
