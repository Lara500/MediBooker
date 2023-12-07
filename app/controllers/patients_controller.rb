class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
  end

  def new
  end

  def create
  end
end
