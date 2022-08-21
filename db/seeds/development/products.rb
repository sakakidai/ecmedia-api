300.times do |n|
  Product.create!(
    name: Faker::Commerce.product_name, 
    price: (rand(10..2000).to_s + '0').to_i,
    stock: rand(0..10),
    note: Faker::Lorem.paragraph_by_chars
  )
end

puts "products = #{Product.count}"