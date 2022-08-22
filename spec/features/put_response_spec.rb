require 'rails_helper'

RSpec.feature "PutResponse", type: :feature do
    let(:current_doctor) { build :doctor }
    let(:reception) { build :reception}
    let(:user) { build(:user)}

    before(:each) do
      current_doctor.save
      user.save
      reception.save
    end

  scenario 'Doctor send reception feedback' do 
    visit '/doctors/sign_in'
    fill_in 'email', with: current_doctor.email
    fill_in 'password', with: current_doctor.password
    click_button 'Log in'

    visit "/doctors/receptions/#{reception.id}/response"
    response = Faker::Lorem.paragraph(sentence_count: 3)
    fill_in 'response', with: response
    click_button 'Set response'
    
    expect(reception.reload.response).to eq(response)
  end
end
