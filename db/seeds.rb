require "faker"

puts "🔄 Nettoyage des données..."

User.delete_all
Article.delete_all
if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
  ActiveRecord::Base.connection.reset_pk_sequence!('users')
  ActiveRecord::Base.connection.reset_pk_sequence!('articles')
end

puts "👤 Ajout des utilisateurs"
User.create!(first_name: "rosa", last_name: "rosa", email: "test@test.com", password: "password", password_confirmation: "password")
10.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  password = "password"
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}_#{last_name}#{i}@yopmail.com",
    password: password,
    password_confirmation: password
  )
end


puts "📰 Ajout des articles"
Article.create!(name: "Article 1", description: "Description de l'article 1", price: 100)
10.times do |i|
  name = Faker::Commerce.product_name
  description = Faker::Lorem.sentence(word_count: 10)
  price = Faker::Commerce.price(range: 10..1000)
  Article.create!(
    name: name,
    description: description,
    price: price
  )
end
