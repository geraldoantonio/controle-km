class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_format_of :email, with: /\@solutis\.com\.br/, message: 'Você deve ter um email de solutis.com.br'
  
end
