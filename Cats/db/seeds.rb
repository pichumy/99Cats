# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cats = Cat.first

CatsRentalRequest.first.status = "APPROVED"

collision = CatsRentalRequest.new(cat_id: cats.id, start_date:'06-01-2018',
end_date: '07-01-2018')
collision2 = CatsRentalRequest.new(cat_id: cats.id, start_date:'04-01-2018',
end_date: '07-01-2018')
collision3 = CatsRentalRequest.new(cat_id: cats.id, start_date:'06-12-2018',
end_date: '07-12-2018')



collision3.save!
