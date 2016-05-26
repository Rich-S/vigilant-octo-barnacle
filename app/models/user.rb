class User < ActiveRecord::Base
  #test	
  validates :name, :email, presence: true
end
