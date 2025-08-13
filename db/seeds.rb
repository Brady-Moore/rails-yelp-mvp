require "faker"

puts "Deleting database..."
Restaurant.destroy_all

categories = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Creating sample restaurants..."
5.times do 
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: categories.sample 
  )
end

puts "Finished! Created #{Restaurant.count} restaurants"

puts "Creating reviews for each restaurant..."
Restaurant.find_each do |restaurant|
  rand(2..3).times do
    restaurant.reviews.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
  end
end

puts "Finished! Created 2 or 3 reviews for each restaurant"