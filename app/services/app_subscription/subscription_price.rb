module AppSubscription
  class SubscriptionPrice
    MONTHLY_20 = OpenStruct.new({
      id: 'price_1HXTMsB5y*****',
      name: "monthly-20",
      amount: 3000,
      currency: "usd",
      interval: "month",
    })

    YEARLY_220 = OpenStruct.new({
      id: 'price_1HXTMs*****',
      name: "yearly-220",
      amount: 22000,
      currency: "usd",
      interval: "year",
    })

    OPTIONS = [ MONTHLY_20, YEARLY_220 ]

    def self.current_monthly
      MONTHLY_20
    end

    def self.current_yearly
      YEARLY_220
    end
  end
end