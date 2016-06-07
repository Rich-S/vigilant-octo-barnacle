class Material < ActiveRecord::Base
  has_many :projects, through: :project_materials	
  has_many :project_materials, dependent: :destroy 
  validates :name, presence: true, uniqueness: true
end
