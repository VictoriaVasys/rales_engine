class CustomersPendingSerializer < ActiveModel::Serializer
  attributes :customers
  
  def customers
    object
  end
  
end