class ProjectsController < ApplicationController
 
  respond_to :js,:json,:html 
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.order(name: :asc)
  end

  def show
    @project = Project.find(params[:id])
    @users = @project.users
    @materials = @project.project_materials
    respond_to do |format|
      format.html { render :partial => "show" }
    end
  end

  def new
    @project = Project.new
    @material = @project.project_materials.build
    @material.build_material
  end

  def edit
    @project = Project.find(params[:id])
    @material = @project.project_materials.build
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def index_users
    @users = User.order(name: :asc)
    respond_to do |format|
      format.html { render :partial => "show_users" }
    end
  end
  
  private

  def set_project
  	@project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, { :user_ids => [] }, { :project_materials_attributes => [:id, :material_id, :project_id, :quantity, :_destroy] })
  end

end
