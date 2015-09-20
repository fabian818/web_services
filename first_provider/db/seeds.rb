# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Category.all.exists?
	categories = [['categoría', 'sub', 'sub'], ['otra_categoría', 'otra_sub', 'otra_sub']]
	categories.each do |category|
		category_name = category[0].to_s
		sub_categories = category.drop(1).each
		my_category = Category.create(name: category_name)
		sub_categories.each do |sub_category|
			my_category.sub_categories.create(name: sub_category)
		end
	end
end

unless Brand.all.exists?
	['asdas', 'asdsd', '1231', 'qweqwe', 'ZXCZXC'].each do |brand|
		Brand.create(name: brand)
	end
end

unless Product.all.exists?
	Product.create(brand_id: 1, name: 'Producto 1', sub_category_id: 1, code: 'AAA', has_especification: true)
	Product.create(brand_id: 1, name: 'Producto 2', sub_category_id: 1, code: 'BBB', has_especification: false)
	Product.create(brand_id: 1, name: 'Producto 3', sub_category_id: 1, code: 'CCC', has_especification: true)
	Product.create(brand_id: 1, name: 'Producto 4', sub_category_id: 1, code: 'DDD', has_especification: false)
	Product.create(brand_id: 1, name: 'Producto 5', sub_category_id: 1, code: 'EEE', has_especification: false)
end

# Generando api keys

unless ApiKey.all.exists?
	10.times do ApiKey.create end
end