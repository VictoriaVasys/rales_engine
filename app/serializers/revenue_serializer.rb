class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object
  end
end
