class Comment < ApplicationRecord
  #include Visible
  belongs_to :article
  has_many :users
  
 
end
