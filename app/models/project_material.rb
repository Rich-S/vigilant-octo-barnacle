class ProjectMaterial < ActiveRecord::Base
  belongs_to :project
  belongs_to :material
  #accepts_nested_attributes_for :material
end
