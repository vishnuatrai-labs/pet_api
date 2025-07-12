class VaccinationExpiryJob < ApplicationJob
  queue_as :default

  def perform(pet_id)
    pet = Pet.find(pet_id)
    Rails.logger.info "Simulated email: Vaccination expired for #{pet.name} (#{pet.breed})"
    # notification service to be integrated here
  end
end
