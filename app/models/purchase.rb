class Purchase < ApplicationRecord
  belongs_to :crypto
  belongs_to :portfolio
end
