class Group < ApplicationRecord
  belongs_to :user
  has_many :mytransactions

  validates :name, presence: true, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader

  def transaction?
    mytransactions != nil
  end
end
