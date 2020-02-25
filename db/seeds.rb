# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contract.destroy_all
Loan.destroy_all
User.destroy_all

User.create!(first_name: "Shinzo", last_name: "Abe", email: "admin@kinzame.com", password: "010203", wallet: "123456")
User.create!(first_name: "Adil", last_name: "Omary", email: "poorguy@kinzame.com", password: "123456", wallet: "0")
User.create!(first_name: "Rich", last_name: "Guy", email: "rich@kinzame.com", password: "123123", wallet: "0")

puts "generating 10 users, multiple loans per user, and multiple contracts"
10.times do
  user_seed = User.create!( email: Faker::Internet.email,
                password: "123123",
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name
                )
      loan = Loan.create!( amount: rand(10..300),
                    user: user_seed,
                    duration: rand(10..60),
                    interest_rate: rand(1..5)
                    )
      Contract.create!(description: Faker::Lorem.sentence(word_count: 3),
                      approved: true,
                      due_date: (Date.today + loan.duration.days),
                      loan: loan,
                      user: user_seed
                      )
end
puts '...finished'

# 20.times do
#   Loan.create!( amount: rand(10..300),

#                 duration: rand(10..60),
#                 interest_rate: rand(1..5)
#                 )
# end

# 20.times do
#   Contract.create!(description: Faker::Lorem.sentence(word_count: 3),
#                     approved: true,
#                     due_date: Loan.duration.sample,
#                     user_id: User.user_id.sample,
#                     loan_id: Loan.loan_id.sample
#                     )
# end


