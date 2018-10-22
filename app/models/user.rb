class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :functionary, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :functionary, allow_destroy: true, reject_if: :all_blank

  validates_associated :functionary, on: :create
  validates_format_of :email, with: /\@solutis\.com\.br/, message: 'Você deve ter um email de solutis.com.br'
 
  
  def active_for_authentication?
    super && self.functionary.active?  # i.e. super && self.is_active
  end
  
  def inactive_message
    "Desculpe, sua conta está desativada. Fale com seu Líder!"
  end

end
