# frozen_string_literal: true

class Reception < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  enum :status, {
    considering: 'considering',
    waiting: 'waiting',
    reply: 'reply'
  }

  validates_presence_of :description, :user_id, :doctor_id
  validate :number_of_doctors_reception_less_then_10
    
  private def number_of_doctors_reception_less_then_10
    return true  if self.doctor_id.blank?
    doctor = Doctor.find self.doctor_id
    receptions = doctor.receptions.select {|r| !r.reply?}
    errors.add(:doctor_id, "cannot have more than 10 patients at the same time ") unless receptions.count > 10
  end
end
