class Project < ActiveRecord::Base
 

	has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  
  has_many :project_materials, dependent: :destroy#, inverse_of: :project
  has_many :materials, through: :project_materials

	
  #accepts_nested_attributes_for :project_users
  accepts_nested_attributes_for :project_materials, reject_if: :all_blank#, :allow_destroy => true, :reject_if => :all_blank

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  private
  
  def destroy_users_and_materials
  	self.users.delete_all   
    self.materials.delete_all 
 	end

end
