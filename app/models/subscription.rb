class Subscription < ApplicationRecord
  belongs_to :account

  enum status: {
    active: "active",
    canceled: "canceled",
    past_due: "past_due",
    pending: "pending",
    trialing: "trialing"
  }, _prefix: true

  validates :current_period_start_at, presence: true
  validates :current_period_end_at, presence: true
  validates :status, presence: true, inclusion: { in: statuses.values }
  validates :stripe_subscription_id, presence: true, uniqueness: { scope: :account_id }

  ACCESS_GRANTING_STATUSES = [ 
    statuses[:active], 
    statuses[:past_due],
    statuses[:trialing]
  ]

  scope :access_granting, -> { where(status: ACCESS_GRANTING_STATUSES) }
  scope :recent, -> { order("current_period_end DESC NULLS LAST") }

  def access_granting?
    ACCESS_GRANTING_STATUSES.include?(status)
  end
end
