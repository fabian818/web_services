collection :@products
attributes :id, :name, :price, :description, :stock, :minimum_stock
node(:sub_category) { |product| product.sub_category.name }
node(:category) { |product| product.sub_category.category.name }
node(:brand) { |product| product.brand.name }