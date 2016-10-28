class DeployMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'deploy_messages'
  end
end
