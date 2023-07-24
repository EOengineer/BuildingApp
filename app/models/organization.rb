class Organization < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
