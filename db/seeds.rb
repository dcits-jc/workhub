# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: '梁超',email: 'liangchaob@dcits.com',code: 'liangchaob',is_admin: true,password: 'P@ssw0rd',password_resetting: false)
User.create(name: '鲁志梅',email: 'luzm@dcits.com',code: 'luzm',is_admin: true,password: 'P@ssw0rd',password_resetting: false)


