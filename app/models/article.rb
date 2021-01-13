class Article < ApplicationRecord
  #include Visible
  has_many :comments,dependent: :destroy
  has_many :users
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path,:headers=> true) do |row|
      Article.create! row.to_hash
    end
  end
 
end
