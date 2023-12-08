class PatientsController < ApplicationController
  def index
    @q = Patient.ransack(params[:q])
    @pagy, @patients = pagy(@q.result(distinct: true), items: 50)
  end

  def show
  end

  def new
  end

  def create
  end
end
