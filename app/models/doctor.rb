# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :receptions
  has_many :users, through: :receptions
  has_one_attached :avatar
  enum :category, {
    pediatrician:     'pediatrician',
    endocrinologist:  'endocrinologist',
    neurologist:      'neurologist',
    rheumatologist:   'rheumatologist',
    psychiatrist:     'psychiatrist'
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
