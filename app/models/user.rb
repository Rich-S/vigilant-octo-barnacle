class User < ActiveRecord::Base
  has_many :project_users
  has_many :projects, through: :project_users
  validates :name, :email, presence: true
end
