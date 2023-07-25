class Subscription < ApplicationRecord
  belongs_to :account

  enum status: {
    active: "active",
    canceled: "canceled",
    past_due: "past_due",
    pending: "pending",
    trialing: "trialing"
  }, _prefix: true

  validates :status, presence: true, inclusion: { in: statuses.values }
  validates :current_period_start_at, presence: true
  validates :current_period_end_at, presence: true
  validates :stripe_subscription_id, presence: true
end
