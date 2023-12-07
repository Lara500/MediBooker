class PatientsController < ApplicationController
  def index
    @pagy, @patients = pagy(Patient.all, items: 50)
  end

  def show
  end

  def new
  end

  def create
  end
end
