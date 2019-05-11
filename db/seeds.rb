# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(mail: 'a01282829@itesm.mx', uuid: 'ZYF4uGsx47S8jsOyx8NvgO1Dfkm1')

routes_names = ['Morones', 'Garza Sada', 'Valle Alto', 'Cumbres']
for name in routes_names do
  Route.create(name: name)
end

buses = Bus.create([
  {bycicles_slots_available: 1, seats_available: 10},
  {bycicles_slots_available: 3, seats_available: 10}
])
nums = 1..10

for bus in buses do
  for num in nums do
    s = Seat.create(seat_number: num)
    bus.seats << s
    bus.save
  end
end

Route.first.buses << Bus.first
Route.second.buses << Bus.second
Route.third.buses << Bus.first
Route.third.buses << Bus.second
Route.fourth.buses << Bus.first
Route.fourth.buses << Bus.second

Stop.create([
  {name: 'HEB', address: 'calle, ciudad'},
  {name: 'Hospital', address: 'calle, ciudad'},
  {name: 'Tec', address: 'calle, ciudad'},
  {name: 'Cinepolis', address: 'calle, ciudad'},
  {name: 'Esfera', address: 'calle, ciudad'},
  {name: 'Cintermex', address: 'calle, ciudad'},
])

Route.first.stops << Stop.all.sample(3)
Route.second.stops << Stop.all.sample(3)
Route.third.stops << Stop.all.sample(3)
Route.fourth.stops << Stop.all.sample(3)
