# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


################################################################################

puts "Gerando usuário padrão..."

  bar = RakeProgressbar.new(1)
  bar.inc
  user = User.new(
                    email: "admin@solutis.com.br",
                 password: "123456", 
    password_confirmation: "123456"
  )
  user.build_functionary
  user.functionary.name = "ADMIN - Solutis Tecnologias "
  user.functionary.active = true
  user.functionary.matriculation = "99.999.999/0001-01"
  user.functionary.function = :leader
  user.functionary.leader = 1 
  
  
  user.save!

bar.finished
################################################################################

