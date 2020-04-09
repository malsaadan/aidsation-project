class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_inclusion_of  :type,   
         :in => %w( Recipient Provider )

  def recipient?
    type == 'Recipient'
  end

  def provider?
    type == 'Provider'
  end
end
