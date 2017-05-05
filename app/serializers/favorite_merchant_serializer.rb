class FavoriteMerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  def id
    object.first[:id]
  end
  
  def name
    object.first[:name]
  end
end