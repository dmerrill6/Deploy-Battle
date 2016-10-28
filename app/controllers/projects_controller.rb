class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show]

  def new
  end

  def show
    
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end


end
