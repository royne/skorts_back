admin = User.new(username: 'admin', email: 'admin@zaiens.com', password: '123456')
admin.add_role(:admin)
admin.save!

escort = User.new(username: 'linda', email: 'linda@mail.com', password: '123456')
escort.add_role(:escort)
escort.save!

Category.create(name: 'Economicas')
Category.create(name: 'A Domicilio')
Category.create(name: 'A hoteles')
Category.create(name: 'Con Lugar')
Category.create(name: '18 años')
Category.create(name: 'Universitarias')
Category.create(name: 'Localidad')

Service.create(name: 'De Lujo')
Service.create(name: 'Fantasias')
Service.create(name: 'Juguetes Eroticos')
Service.create(name: 'Lenceria')
Service.create(name: 'Oral')
Service.create(name: 'Todas Las Poses')
Service.create(name: 'Todas Las Poses')

Location.create(name: 'Apartamento privado')
Location.create(name: 'Casa')
Location.create(name: 'Hotel')
Location.create(name: 'Centro de Masajes')
Location.create(name: 'Domicilio')

TypeSubscription.create(name: 'Free', price: 0)
TypeSubscription.create(name: 'Silver', price: 50000)
TypeSubscription.create(name: 'Gold', price: 70000)
TypeSubscription.create(name: 'Premium', price: 100000)

EscortProfile.create(username: escort.username, first_name: 'juana', last_name: 'gomes', price: 80000, 
                      schedule: '24 horas', sex: 0, age: 25, user_id: escort.id, type_subscription_id: 1,
                      category_ids: [1,2,3], location_ids: [1,2], service_ids: [1,2])