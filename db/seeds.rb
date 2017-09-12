# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nation = Nation.create(code: 'AU', name: 'Australia')
tax_rate = TaxRate.create(start_date: '01/07/2012'.to_date, end_date: '31/12/2013'.to_date, nation: nation)
TaxRange.create([
  { start_range: '0', end_range: '18200', tax_rate: tax_rate },
  { start_range: '18201', end_range: '37000', rate: '0.19', tax_rate: tax_rate },
  { start_range: '37001', end_range: '80000', plus: '3572', rate: '0.325', tax_rate: tax_rate },
  { start_range: '80001', end_range: '180000', plus: '17547', rate: '0.37', tax_rate: tax_rate },
  { start_range: '180001', plus: '54547', rate: '0.45', tax_rate: tax_rate }
])