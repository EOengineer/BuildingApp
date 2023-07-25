# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  Organization.destroy_all
  User.destroy_all
  Account.destroy_all
  Subscription.destroy_all

  3.times do
    # organization
    organization = Organization.create!(name: Faker::Company.name)
    p "Organization #{organization.name} created!"

    account = organization.create_account!(
      stripe_customer_id: "cus_#{Faker::Alphanumeric.unique.alphanumeric(number: 12)}"
    )

    # subscriptions
    account.subscriptions.create!(
      status: "active",
      current_period_start_at: Time.now,
      current_period_end_at: Time.now + 1.month,
      stripe_subscription_id: "sub_#{Faker::Alphanumeric.unique.alphanumeric(number: 9)}"
    )
    p "Subscription #{account.subscriptions.first.stripe_subscription_id} created!"

    # users
    organization.users.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password"
    )
    p "User #{organization.users.first.first_name} #{organization.users.first.last_name} created!"
  end
end