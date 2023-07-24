class Organization < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  after_create :create_account

  private

  def create_account
    Account.create!(organization: self)
  end
end
