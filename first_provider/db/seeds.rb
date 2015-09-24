# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.all.each { |c| c.destroy }
SubCategory.all.each { |c| c.destroy }
Category.all.each { |c| c.destroy }
Brand.all.each { |c| c.destroy }

unless Category.all.exists?
	while Category.all.count < 11
		category_name = Faker::Hacker.adjective
		category = Category.create(name: category_name, code: category_name[0,3]) if !Category.where("name = '#{category_name}'").exists?
	end
end

category_codes = []
Category.all.each { |c| category_codes.push(c.code) }

unless SubCategory.all.exists?
	category_codes.each do |category_code|
		category = Category.find_by_code(category_code)
		while category.sub_categories.count < 5
			sub_category_name = Faker::Name.first_name
			puts sub_category_name
			sub_category = category.sub_categories.create(name: sub_category_name, code: sub_category_name[0,3].downcase) if !SubCategory.where("name = '#{sub_category_name}'").exists?
		end
	end
end

sub_categories = []
SubCategory.all.each { |s| sub_categories.push(s.code) }

unless Brand.all.exists?
	while Brand.all.count < 20
		brand_name = Faker::Name.last_name
		brand = Brand.create(name: brand_name) if !Brand.where("name = '#{category_name}'").exists?
	end
end

brands = []
Brand.all.each { |b| brands.push(b.name) }

unless Product.all.exists?
	puts '----------------PRODUCTOS-------------------'
	while Product.all.count < 100
		product_name = Faker::Name.name
		product_description = Faker::Name.title
		brand = Brand.find_by_name(brands[rand(20)])
		sub_category = SubCategory.find_by_code(sub_categories[rand(55)])
		product = Product.create(name: product_name, description: product_description, brand: brand, sub_category: sub_category) if !Product.where("name = '#{product_name}'").exists?
	end
end

# Generando api keys

unless ApiKey.all.exists?
	10.times { ApiKey.create }
end
