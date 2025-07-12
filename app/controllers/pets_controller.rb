class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :expire_vaccination]

  def index
    render json: Pet.all
  end

  def show
    render json: @pet
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      render json: pet, status: :created
    else
      render json: pet.errors, status: :unprocessable_entity
    end
  end

  def expire_vaccination
    if @pet.update(vaccinated: false)
      VaccinationExpiryJob.perform_later(@pet.id)
      render json: { message: "Vaccination expired and notification enqueued." }
    else
      render json: { error: "Unable to update." }, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :age, :vaccinated)
  end
end