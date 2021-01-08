class User < ApplicationRecord
  belongs_to :article,:optional => true
  belongs_to :comments,:optional => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  



end
