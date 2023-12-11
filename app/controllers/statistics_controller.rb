class StatisticsController < ApplicationController
    def index
        patients = Patient.select(:birth_date).where.not(birth_date: nil).map { |p| p.birth_date.year }
        @birth_years = patients.group_by { |year| year }.transform_values(&:count).sort.to_h
    end
end
  
