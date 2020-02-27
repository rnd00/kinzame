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

puts "Generating defauld admin@kinzame.com, lender@kinzame.com, and borrower@kinzame.com"
User.create!(first_name: "Shinzo", last_name: "Abe", email: "admin@kinzame.com", password: "010203", wallet: "123456", admin: true)
User.create!(first_name: "Adil", last_name: "Omary", email: "lender@kinzame.com", password: "123456", wallet: "750000", lender: true)
User.create!(first_name: "Rich", last_name: "Guy", email: "borrower@kinzame.com", password: "123123", wallet: "0", lender: false)

puts "...finished"

puts "generating 10 lenders"
10.times do
  user_seed = User.create!( email: Faker::Internet.email,
                password: "123123",
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                lender: true
                )
end
puts '...finished'

puts "seeding lenders with loan types"
lenders = User.where(lender: true)
lenders.each do |lender|
  10.times do
    loan = Loan.create!( amount: rand(1..10) * 10000,
                    user: lender,
                    duration: rand(10..60),
                    interest_rate: (rand(0..9) + [0.5, 1].sample)
                    )
  end
end
puts "...finished"

puts 'making 50 borrowers'
50.times do
  User.create!(email: Faker::Internet.email,
              password: "123123",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              lender: false
              )
end
puts '...done'


borrowers = User.where(lender: false)
puts "creating contracts and assigning them to loans and borrowers"
loans = Loan.all
loans.each do |loan|
  rand(1..5).times do
    contract = Contract.create!(
      description: Faker::Lorem.words(number: 4),
      due_date: Date.today + (1..30).to_a.sample,
      loan: loan,
      approved: [true, true, true, false].sample,
      user: borrowers.take
      )
  end
end
puts "...done"

puts 'randomizing repaid_loan'
approved_contracts = Contract.where(approved: true)
approved_contracts.each do |contract|
  contract.repaid_loan = [true, true, false].sample
  contract.save
end
puts '...finished'

puts 'setting some contracts to repaid_loan = true'
repaid_contracts = Contract.where(repaid_loan: true)
repaid_contracts.each do |contract|
  contract.repaid_lender = [true, false].sample
  contract.save
end
puts '...finished'
