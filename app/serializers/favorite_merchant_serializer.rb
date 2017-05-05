class FavoriteMerchantSerializer < ActiveModel::Serializer
  attributes :favorite_merchant

  def favorite_merchant
    object.first.id
  end
end