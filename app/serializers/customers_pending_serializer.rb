class CustomersPendingSerializer < ActiveModel::Serializer
  attributes :id, :first_name

  def id
    object.first[:id] if object.first
  end
  
  def first_name
    object.first[:first_name] if object.first
  end
end