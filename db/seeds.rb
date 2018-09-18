# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 
admin_user1 = User.create( email: 'bhj1684@naver.com', password: '123456',birthday:'1994-03-26',gender: 'm',comment: '관리자',nickname: '관리자', admin:"true" )
user = User.find(1)
user.add_role :admin 

admin_user1 = User.create( email: 'bhj499956@gmail.com', password: '123456',birthday:'1994-03-26',gender: 'm',comment: '테스트',nickname: '테스트', admin:"true" )
user = User.find(2)