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
      redirect_to appointments_path, notice: 'Wizyta została umówiona'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
      @appointment = Appointment.find(params[:id])
    
      if @appointment.update(appointment_params)
        redirect_to patient_appointments_path(@appointment.patient_id), notice: 'Wizyta została pomyślnie zaktualizowana.'
      else
        render :edit
      end
  end

  def patient_appointments
    @patient = Patient.find(params[:patient_id])
    @appointments = Appointment.where(patient_id: @patient.id)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to patient_appointments_path(@appointment.patient_id), notice: 'Wizyta została pomyślnie usunięta.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :date, :time, :price)
  end
end
