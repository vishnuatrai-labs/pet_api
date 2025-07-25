# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:breed) }
  it { should validate_presence_of(:age) }
end
