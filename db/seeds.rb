# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vacyou = Vacuum.create({name: "VacYou Home Edition", rental_price: 2, purchase_price: 99, rental_stock: 500, purchase_stock: 500})
vacyou = Vacuum.create({name: "VacYou 2 Deluxe", rental_price: 4, purchase_price: 129, rental_stock: 500, purchase_stock: 500})
vacyou = Vacuum.create({name: "VacYou 2 Premium", rental_price: 6, purchase_price: 149, rental_stock: 500, purchase_stock: 500})
hoover = Vacuum.create({name: "Hoover: Mr. President", rental_price: 10, purchase_price: 50, rental_stock: 50, purchase_stock: 150})
roomba = Vacuum.create({name: "Roomba IV", rental_price: 12, purchase_price: 350, rental_stock: 100, purchase_stock: 200})
roomba2 = Vacuum.create({name: "Roomba V", rental_price: 15, purchase_price: 650, rental_stock: 200, purchase_stock: 150})
shopvac = Vacuum.create({name: "Shop Vac", rental_price: 5, purchase_price: 75, rental_stock: 50, purchase_stock: 75})
dirtdevil = Vacuum.create({name: "Dirt DeVil (Ltd Edition)", rental_price: 20, purchase_price: 500, rental_stock: 10, purchase_stock: 15})
suckador = Vacuum.create({name: "El Suckador", rental_price: 69, purchase_price: 69, rental_stock: 69, purchase_stock: 69})
dustbuster = Vacuum.create({name: "Dustbuster Supreme", rental_price: 4, purchase_price: 25, rental_stock: 50, purchase_stock: 40})
