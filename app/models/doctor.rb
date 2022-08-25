# frozen_string_literal: true

class Doctor < ApplicationRecord
  include DoctorHelper
  has_many :receptions
  has_many :users, through: :receptions
  belongs_to :category

  has_one_attached :avatar

  scope :find_free_now, ->{ find_by_sql [DoctorHelper::FIND_FREE, 10] }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
