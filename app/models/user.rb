class User < ApplicationRecord
  has_many :groups
  has_many :transactions

  validates :name, presence: true, length: { maximum: 255 }
end
