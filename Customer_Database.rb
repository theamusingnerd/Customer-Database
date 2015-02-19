=begin
	Written by Alex Sciortino
	Remember to edit the data file locations!
	Simple customer database.
=end
def display(customers)
	n = 0
	customers.each do |cust|
		puts "#{n += 1}: #{cust}"
	end
end
puts "Would you like to add, update, delete you view your open repairs?"
type = gets.chomp.downcase
#Modify line below with your file path
customers = File.open("/home/alex/Customer_Database.dat", "r")
customers_array = []
case type
when "add" 
	puts "Name of customer?"
	name = gets.chomp
	puts "Phone number?"
	phone = gets.chomp
	puts "Enter notes"
	notes = gets.chomp
	#Modify line below with your file path
	open("/home/alex/Customer_Database.dat", "a") do |f|
		f.puts "#{name}: #{phone}, #{notes}"
	end
when "update"
	display(customers)
	customers_temp = []
	#Modify line below with your file path
	customers_temp = File.readlines("/home/alex/Customer_Database.dat")
	#Opens the data file and imports it as array
	puts "What is the number of whom you would like to update?"
	update = gets.chomp.to_i
	puts "Name of customer?"
	name = gets.chomp
	puts "Phone number?"
	phone = gets.chomp
	puts "Enter notes"
	notes = gets.chomp
	customers_temp.delete_at(update -= 1)
	#Deletes old value
	customers_temp << "#{name}: #{phone}, #{notes}"
	#Modify line below with your file path
	open("/home/alex/Customer_Database.dat", "w") do |f|
		f.puts customers_temp
		#Writes array to data file.
	end
when "delete"
	display(customers)
	customers_temp = []
	#Modify line below with your file path
	customers_temp = File.readlines("/home/alex/Customer_Database.dat")
	#Imports data file as an array
	puts "What is the number of whom you would like to delete?"
	delete = gets.chomp.to_i
	customers_temp.delete_at(delete -= 1)
	#Modify line below with your file path
	open("/home/alex/Customer_Database.dat", "w") do |f|
		f.puts customers_temp
		#Writes array to data file
	end
when "view"
	display(customers)
else puts "Error!"
end
