# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :receptions
  has_many :doctors, through: :receptions

  validates :phone, phone: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
