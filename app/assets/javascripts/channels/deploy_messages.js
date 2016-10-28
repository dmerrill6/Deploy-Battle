App.messages = App.cable.subscriptions.create('DeployMessagesChannel', {
  received: function(data) {
    if(data.message_type == "success"){
      hideAll();
      $('.state-success').show();
      setTimeout(function () {
        $('.state-standby').show();
      }, 5000);

    }
    else if(data.message_type == "failure"){
      hideAll();
      $('.state-error').show();
      setTimeout(function () {
        $('.state-standby').show();
      }, 5000);


    }
    else if(data.message_type == "start"){
      hideAll();
      $('.state-inprogress').show();
    }
  }
});

var hideAll = function(){
  $('.state-container .state').hide();
}
