class BestDaySerializer < ActiveModel::Serializer
  attributes :best_day

  def best_day
    object.first[:created_at]
  end
end