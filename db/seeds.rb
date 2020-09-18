admin = User.new(username: 'admin', email: 'admin@zaiens.com', password: '123456')
admin.add_role(:admin)
admin.save!
