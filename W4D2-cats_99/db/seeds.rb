# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create(birth_date: '2011/01/01', color: 'green', name: 'Patric', sex: 'M', description: 'I\'m a cuttie')
cat2 = Cat.create(birth_date: '2012/01/01', color: 'black', name: 'Megan', sex: 'F', description: 'I\'m a cuttie')
cat3 = Cat.create(birth_date: '2013/01/01', color: 'white', name: 'Jeff', sex: 'M', description: 'I\'m a cuttie')
cat4 = Cat.create(birth_date: '2014/01/01', color: 'green', name: 'Amber', sex: 'F', description: 'I\'m a cuttie')
cat5 = Cat.create(birth_date: '2015/01/01', color: 'black', name: 'Mark', sex: 'M', description: 'I\'m a cuttie')