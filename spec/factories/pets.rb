# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { "MyString" }
    breed { "MyString" }
    age { 1 }
    vaccinated { false }
  end
end
