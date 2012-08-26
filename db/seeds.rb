# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(email: 'krasstroy@dom2a.ru',password: 'sellmyhouse2012')
UnderTableText(under_text: '*Рейтинг составлен на основе статистики продаж агентствами недвижимости объектов группы строительных компаний «Красстрой» ')
UnderTableText(under_text: '**В скобках указано место в рейтинге после предыдущего обновления ')
StaticContent(title_table: 'Рейтинг агентств недвижимости в 2012 году')