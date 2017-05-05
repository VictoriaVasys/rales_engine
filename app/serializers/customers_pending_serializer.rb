class CustomersPendingSerializer < ActiveModel::Serializer
  attributes :id, :first_name

  def id
    object.first[:id]
  end
  
  def first_name
    object.first[:first_name]
  end
end