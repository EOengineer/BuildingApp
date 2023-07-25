class Account < ApplicationRecord
  belongs_to :organization
  has_many :subscriptions, dependent: :destroy
end
