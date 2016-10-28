class DeployMessagesController < ApplicationController
  before_filter :set_project
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def new

  end

  # Call with:
  # curl -XPOST 'http://{URL}/projects/{ProjectId}/deploy_messages?deploy_message[message_type]={success|failure|start}'
  def create
    deploy_message = DeployMessage.new(deploy_message_params)
    deploy_message.project_id = @project.id
    if deploy_message.save
      ActionCable.server.broadcast 'deploy_messages',
          message_type: deploy_message.message_type
        head :ok
    else
      redirect_to projects_path
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def deploy_message_params
    params.require(:deploy_message).permit([:message_type, :project_id])
  end
end
