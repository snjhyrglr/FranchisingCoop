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
  coop.region_id = case spreadsheet.cell(c, "C")
  when "CAR" then 1
  when "CARAGA" then 17
  when "NCR" then 14
  when "Region 01" then 1
  when "Region 02" then 2
  when "Region 03" then 3
  when "Region 04-A" then 4
  when "Region 04-B" then 5
  when "Region 05" then 6
  when "Region 06" then 7
  when "Region 07" then 8
  when "Region 08" then 9
  when "Region 09" then 10
  when "Region 10" then 11
  when "Region 11" then 12
  when "Region 12" then 13
  end
  coop.registration_no = spreadsheet.cell(c, "A")
  coop.category = spreadsheet.cell(c, "G")
  coop.coop_type = spreadsheet.cell(c, "H")
  coop.status = spreadsheet.cell(c, "I")
  coop.asset_size = spreadsheet.cell(c, "L")
  coop.total_asset = spreadsheet.cell(c, "M")
  puts "#{coop.name} -> Done! " if coop.save
end

#EMPLOYEES
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/EMPLOYEE-MASTERLIST.xlsx")
# (2..spreadsheet.last_row).each do |em|
#   div = Division.find_or_initialize_by(name: spreadsheet.cell(em, "E"))
#   div.short_name = ""
#   div.active = 1
#   puts "#{div.name} - Done!" if div.save

#   dep = Department.find_or_initialize_by(name: spreadsheet.cell(em, "F"))
#   dep.division_id = div.id
#   dep.short_name = ""
#   dep.active = 1
#   puts "#{dep.name} - Done!" if dep.save

#   emp = Employee.find_or_initialize_by(employee_no: spreadsheet.cell(em, "A"))
#   emp.division_id = div.id
#   emp.department_id = dep.id
#   emp.last_name = spreadsheet.cell(em, "B")
#   emp.first_name = spreadsheet.cell(em, "C")
#   emp.middle_name = spreadsheet.cell(em, "D")
#   emp.position = spreadsheet.cell(em, "G")
#   puts "#{emp.last_name}, #{emp.first_name} -- Done" if emp.save
# end

#AGENTS
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/SALES-TEAM-021522.xlsx")
# (3..101).each do |st|
#   agent = Agent.find_or_initialize_by(last_name: spreadsheet.cell(st, "B"), first_name: spreadsheet.cell(st, "C"), middle_name: spreadsheet.cell(st, "D"))
#
#   agent.region_id = case spreadsheet.cell(st, "A")
#   when "NCR" then agent.region_id = 14
#   when "REGION 1" then 1
#   when "REGION 2" then 2
#   when "REGION 3" then 3
#   when "REGION 4" then 4
#   when "REGION 5" then 6
#   when "REGION 6" then 7
#   when "REGION 7A" then 8
#   when "REGION 7B" then 8
#   when "REGION 8" then 9
#   when "REGION 9" then 10
#   when "REGION 10" then 11
#   when "REGION 11A" then 12
#   when "REGION 11B" then 12
#   when "REGION 12" then 13
#   when "REGION 13" then 17
#   else 0
#   end
#
#   agent.position = spreadsheet.cell(st, "E")
#   agent.hired = spreadsheet.cell(st, "I")
#
#   agent.licensed = spreadsheet.cell(st, "J") == "LICENSED" ?  1 : 0
#   agent.status = spreadsheet.cell(st, "H") == "ACTIVE" ?  1 : 0
#   agent.active = 1
#   agent.contact_no = spreadsheet.cell(st, "K")
#   agent.email = spreadsheet.cell(st, "L")
#   puts "#{agent.last_name}, #{agent.first_name} -- Done" if agent.save
# end
