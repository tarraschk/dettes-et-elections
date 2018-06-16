class Commune < ApplicationRecord
  has_many :donnees
  has_many :chomages
end
