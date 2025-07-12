class Pet < ApplicationRecord

  validates :name, :breed, :age, presence: true

end
