# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Ph Location
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/ph locations.xlsx")

# (2..spreadsheet.last_row).each do |x|
#   reg = Region.find_or_initialize_by(name: spreadsheet.cell(x, "A"))
#   reg.psgc_code = ''
#   puts "#{reg.name} - Done" if reg.save 

#   prov = Province.find_or_initialize_by(name: spreadsheet.cell(x, "B"))
#   prov.psgc_code = ''
#   prov.region_id = reg.id
#   puts "#{prov.name} - Done" if prov.save 

#   mun = Municipality.find_or_initialize_by(name: spreadsheet.cell(x, "C"), province_id: prov.id)
#   mun.psgc_code = ''
#   mun.region_id = reg.id
#   puts "#{mun.name} - Done" if mun.save 

#   bar = Barangay.find_or_initialize_by(psgc_code: spreadsheet.cell(x, "E"))
#   bar.name = spreadsheet.cell(x, "D")
#   bar.region_id = reg.id
#   bar.province_id = prov.id
#   bar.municipality_id = mun.id
#   puts "#{bar.name} - Done" if bar.save 

# end

#Products
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/Products for franchising.xlsx")

# (2..spreadsheet.last_row).each do |y|
#   pl = ProductLine.find_or_initialize_by(name: spreadsheet.cell(y, "A"))
#   pl.code = spreadsheet.cell(y, "B")
#   pl.active = 1
#   puts "#{pl.name} -> Done" if pl.save 

#   pc = ProductCategory.find_or_initialize_by(name: spreadsheet.cell(y, "C"))
#   pc.product_line_id = pl.id
#   pc.code = spreadsheet.cell(y, "D")
#   pc.active = 1
#   puts "#{pl.code} - #{pc.name} --> Done" if pc.save 

#   prod = Product.find_or_initialize_by(name: spreadsheet.cell(y, "E"))
#   prod.product_line_id = pl.id
#   prod.product_category_id = pc.id
#   prod.code = spreadsheet.cell(y, "F")
#   prod.active = 1
#   puts "#{prod.name} ---> Done" if prod.save

# end

#COOPS
spreadsheet = Roo::Spreadsheet.open("./db/uploads/Operating-Coops.xlsx")

(5..spreadsheet.last_row).each do |c|
  coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(c, "B"))
  case spreadsheet.cell(c, "C")
  when "CAR" then coop.region_id = 1
  when "CARAGA" then coop.region_id = 17
  when "NCR" then coop.region_id = 14
  when "Region 01" then coop.region_id = 1
  when "Region 02" then coop.region_id = 2
  when "Region 03" then coop.region_id = 3
  when "Region 04-A" then coop.region_id = 4
  when "Region 04-B" then coop.region_id = 5
  when "Region 05" then coop.region_id = 6
  when "Region 06" then coop.region_id = 7
  when "Region 07" then coop.region_id = 8
  when "Region 08" then coop.region_id = 9
  when "Region 09" then coop.region_id = 10
  when "Region 10" then coop.region_id = 11
  when "Region 11" then coop.region_id = 12
  when "Region 12" then coop.region_id = 13
  end
  coop.registration_no = spreadsheet.cell(c, "A")
  coop.category = spreadsheet.cell(c, "G")
  coop.coop_type = spreadsheet.cell(c, "H")
  coop.status = spreadsheet.cell(c, "I")
  coop.asset_size = spreadsheet.cell(c, "L")
  coop.total_asset = spreadsheet.cell(c, "M")
  puts "#{coop.name} -> Done! " if coop.save
end
