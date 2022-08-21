class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :stock, :created_at, :updated_at
end
