require 'rails_helper'

RSpec.describe "UserReceptions", type: :request do
  describe "POST /user/receptions" do
    let(:doctor) { build(:doctor) }

    it "create new reception for current user" do
      doctor.save
      current_user = build :user
      sign_in current_user

      expect { 
        post '/users/receptions', params: {
          id:  current_user.id ,
          reception: {
            doctor_id: doctor.id,
            description: Faker::Lorem.paragraph(sentence_count: 3),
          }
        }

      }.to change { Reception.count }.by(1)
    end
  end
end
