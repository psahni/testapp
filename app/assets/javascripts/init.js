window.Message = window.Message || {};
var ENTER_KEY = 13;


window.Message = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new window.Message.MessageRouter();
    Backbone.history.start({});
  } 
};

$(document).ready(function(){
  Message.initialize();
});




// Router:     window.Message.MessageRouter
// View: window.Message.MessageView
// Collection: window.Message.Collection
// Model: window.Message.MessageModel
