class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new(patient_id: params[:patient_id])
  end

  def index
    @appointments = Appointment.includes(:doctor, :patient).all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'The appointment has been booked.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def patient_appointments
    @patient = Patient.find(params[:patient_id])
    @appointments = Appointment.where(patient_id: @patient.id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :date, :time, :price)
  end
end
