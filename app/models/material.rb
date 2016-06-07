class Material < ActiveRecord::Base
  has_many :projects, through: :project_materials	
  has_many :project_materials, dependent: :destroy 
  accepts_nested_attributes_for :project_materials, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true, uniqueness: true
end
