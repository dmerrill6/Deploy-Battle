App.messages = App.cable.subscriptions.create('DeployMessagesChannel', {
  received: function(data) {
    if(data.message_type == "success"){
      hideAll();
      $('.state-success').show();
      setTimeout(function () {
        hideAll();
        $('.state-standby').show();
      }, 30000);

    }
    else if(data.message_type == "failure"){
      hideAll();
      $('.state-error').show();
      setTimeout(function () {
        hideAll();
        $('.state-standby').show();
      }, 30000);


    }
    else if(data.message_type == "start"){
      hideAll();
      $('.state-inprogress').show();
    }

    updateCommitter(data.committer_name, data.message_type);
    sortTable();
  }
});

var hideAll = function(){
  $('.state-container .state').hide();
}

var updateCommitter = function(committerName, messageType){
  var uploadedFieldSelector = ".push-number";
  if(messageType == "success")
    uploadedFieldSelector = ".success-number";
  else if (messageType == "failure")
    uploadedFieldSelector = ".failure-number";

  // Check if element exists
  if ( $( "#committer-" +  committerName).length == 0) {
    // If it doesn't exist, append another row to the table
    $('.ranking').append("<div class='ranking-user' id='committer-" + committerName + "'> <div class='ranking-col ranking-col--avatar'>" + committerName + "</div> <div class='ranking-col push-number'>0</div> <div class='ranking-col failure-number'>0</div> <div class='ranking-col success-number'>0</div> </div>" );
  }
  // In any case, update push number
  var currAmount = parseInt($("#committer-" + committerName + " " + uploadedFieldSelector).text());
  $("#committer-" + committerName + " " + uploadedFieldSelector).text(currAmount + 1);
}

var sortTable = function(){
  rows = $('.ranking .ranking-body .ranking-user').sort(function(a, b) {
      keyA = parseInt($('.success-number', a).text()) - parseInt($('.failure-number', a).text());
      keyB = parseInt($('.success-number', b).text()) - parseInt($('.failure-number', b).text());
      return (keyA < keyB) ? 1 : 0;  // B bigger than A, sorting descending

  });

  rows.each(function(index, row){
    $('.ranking-body').append(row);                  // append rows after sort
  });
}
