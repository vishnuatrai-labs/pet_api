# frozen_string_literal: true

class Pet < ApplicationRecord
  validates :name, :breed, :age, presence: true
end
