class ProjectUser < ActiveRecord::Base
  #belongs_to :user
  belongs_to :project
  belongs_to :user
  accepts_nested_attributes_for :user

  
  #belongs_to :project, :inverse_of => :project_users
end
