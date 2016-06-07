class Project < ActiveRecord::Base
 
	has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :project_materials, dependent: :destroy
  has_many :materials, through: :project_materials
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  accepts_nested_attributes_for :project_materials, :materials, allow_destroy: true, reject_if: :all_blank

  private
  
  def destroy_users_and_materials
  	self.users.delete_all   
    self.materials.delete_all 
 	end

end
