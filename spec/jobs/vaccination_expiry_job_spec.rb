# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VaccinationExpiryJob, type: :job do
  let(:pet) { FactoryBot.create(:pet) }

  describe '#perform' do
    it 'sends the expiration notification' do
      expect(Rails.logger).to receive(:info).with("Simulated email: Vaccination expired for #{pet.name} (#{pet.breed})")

      described_class.new.perform(pet.id)
    end
  end
end
