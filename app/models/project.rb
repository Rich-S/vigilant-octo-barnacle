class Project < ActiveRecord::Base

	before_destroy :destroy_users
	has_many :project_users
  has_many :users, through: :project_users
  has_many :project_materials
  has_many :materials, through: :project_materials
	validates :name, :description, presence: true
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :materials
	
  private
  
   	def destroy_users
   		self.users.delete_all   
      self.materials.delete_all 
   	end

end
