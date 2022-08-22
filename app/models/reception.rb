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
  validates_presence_of :time, on: :update
  validate :number_of_doctors_reception_less_then10

  private

  def number_of_doctors_reception_less_then10
    return true if doctor_id.blank?

    doctor = Doctor.find doctor_id
    receptions = doctor.receptions.reject(&:reply?)
    errors.add(:doctor_id, 'cannot have more than 10 patients at the same time ') unless receptions.count < 10
  end
end
