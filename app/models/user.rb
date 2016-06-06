class User < ActiveRecord::Base
  has_many :project_users, :dependent => :destroy, :inverse_of => :user
  has_many :projects, through: :project_users
  validates :name, :email, presence: true, uniqueness: true
  #has_many :project_users, :dependent => :destroy, :autosave => true , :inverse_of => :project
  #accepts_nested_attributes_for :project_users, :allow_destroy => true, :reject_if => :all_blank
  #has_many :projects, :through => :project_users
end
