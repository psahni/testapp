# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ["CS", "Literature", "Fiction", "Religious", "Politics"]

categories.each do |category|
    puts "==> #{ category} has been added"
    Category.create(:name => category)
end

fiction   = Category.find_by_name("Fiction")
cs        = Category.find_by_name("CS")
lit       = Category.find_by_name("Literature")
religious = Category.find_by_name("Religious")
politics  = Category.find_by_name("Politics")

book1 = Book.create(:name => "Data Structure", :category_id => cs.id )
puts "==> Data Structure Created"
book2 = Book.create(:name => "Revgolution 2020", :category_id => fiction.id )
puts "#{ book2.name } Created"
book3 = Book.create(:name => "Mango Man", :category_id => fiction.id)
puts "#{ book3.name } Created"
book4 = Book.create(:name => "One Night At CallCenter", :category_id => fiction.id)
puts "#{ book4.name } Created"
book5 = Book.create(:name => "Ruby Programming", :category_id => cs.id)
puts "#{ book5.name } Created"
book6 = Book.create(:name => "Pride and Prejudice", :category_id => lit.id)
puts "#{ book6.name } Created"
book7 = Book.create(:name => "Brave New World", :category_id => lit.id)
puts "#{ book7.name } Created"
book8 = Book.create(:name => "Bhagawat Geeta", :category_id => religious.id)
puts "#{ book8.name } Created"
book9 = Book.create(:name => "Holy Quaran", :category_id => religious.id)
puts "#{ book9.name } Created"

puts "\n\n==> Assign Books"
user = User.first

unless user
  user = User.create(:username => "psahni", :email => "prashant.sahni5@gmail.com")
end


if user.borrows.create(:book_id =>  Book.all[0].id )
  puts "\n Borrowing #{ book1.name }"
end

if user.borrows.create(:book_id =>  Book.all[1].id)
    puts "\n Borrowing #{ book2.name }"
end

if user.borrows.create(:book_id => Book.all[2].id )
  puts "\n Borrowing #{ book3.name }"
end

