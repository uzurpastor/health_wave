# frozen_string_literal: true

class Doctor < ApplicationRecord
  include DoctorHelper
  has_many :receptions
  has_many :users, through: :receptions

  has_one_attached :avatar

  scope :find_free_now, ->{ find_by_sql [DoctorHelper::FIND_FREE, 10] }

  enum :category, {
    pediatrician: 'pediatrician',
    endocrinologist: 'endocrinologist',
    neurologist: 'neurologist',
    rheumatologist: 'rheumatologist',
    psychiatrist: 'psychiatrist'
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
