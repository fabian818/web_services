collection :@products
attributes :id, :name, :price, :description
# child(:user) { attributes :full_name }
# node(:read) { |post| post.read_by?(@user) }