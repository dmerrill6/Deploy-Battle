class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update]

  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def show

  end

  def edit
  	
  end

  def create
  	@project = Project.new(project_params)

  	respond_to do |format|
  		if @project.save
  			format.html { redirect_to @project , :notice => "Lo logre padre" }
  		else
  			format.html { redirect_to :new, :notice => "no lo logre pabre" }
  		end
  	end
  end

  def update
  	
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
  	params.require(:project).permit(:name, :successful_deploy_url, :unsuccessful_deploy_url, :pending_deploy_url)
  end


end
