App.messages = App.cable.subscriptions.create('DeployMessagesChannel', {
  received: function(data) {
    if(data.message_type == "success"){
      alert("Mensaje de éxito recibido.");
    }
    else if(data.message_type == "failure"){
      alert("Mensaje de fracaso recibido.");

    }
    else if(data.message_type == "start"){
      alert("Mensaje de inicio recibido.");

    }
  }
});
