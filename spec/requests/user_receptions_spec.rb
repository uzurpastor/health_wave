# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserReceptions', type: :request do
  describe 'POST /user/receptions' do
    let(:doctor) { build(:doctor) }

    it 'create new reception for current user' do
      doctor.save
      current_user = build :user
      sign_in current_user

      expect do
        post '/users/receptions', params: {
          id: current_user.id,
          reception: {
            doctor_id: doctor.id,
            description: Faker::Lorem.paragraph(sentence_count: 3)
          }
        }
      end.to change { Reception.count }.by(1)
    end
  end
end
