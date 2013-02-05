# encoding: utf-8
puts 'SETTING UP DEFAULT ADMIN LOGINS'
user = User.create! :email => 'espen_us@hotmail.com', :password => 'espenus1', :password_confirmation => 'espenus1'
puts 'New user created: ' << user.email
user2 = User.create! :email => 'strtho@gmail.com', :password => 'prv64dri', :password_confirmation => 'prv64dri'
puts 'New user created: ' << user2.email

category1 = Category.create! :c_name => 'Antenner'
category2 = Category.create! :c_name => 'Batteri'
category3 = Category.create! :c_name => 'Knapp(er)'
category4 = Category.create! :c_name => 'Diverse'
puts "Legger til kategorier " << category1.c_name, category2.c_name, category3.c_name, category4.c_name

product1 = Product.create! :p_name => 'Svart/kvit frontglass', :p_price => '900', :category_id => 4
product2 = Product.create! :p_name => 'Svart/kvit bakglass', :p_price => '350', :category_id => 4
product3 = Product.create! :p_name => 'Svart/kvit frontglass og bakglass', :p_price => '1100', :category_id => 4
product4 = Product.create! :p_name => 'Hjem-knapp', :p_price => '400', :category_id => 4
product5 = Product.create! :p_name => 'Høyttaler (øre)', :p_price => '350', :category_id => 4
product6 = Product.create! :p_name => 'Høyttaler (nede/musikk)', :p_price => '350', :category_id => 4
product7 = Product.create! :p_name => 'Av/på-knapp', :p_price => '350', :category_id => 4
product8 = Product.create! :p_name => 'Ladestasjon', :p_price => '350', :category_id => 4
puts "Legger til produkter " << product1.p_name, product2.p_name, product3.p_name, product4.p_name, product5.p_name, product6.p_name, product7.p_name, product8.p_name