class Doctor < ApplicationRecord

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
