class Transaction < ApplicationRecord
  belongs_to :invoice
  scope :succesful, -> {where(result: 'success')}
end
