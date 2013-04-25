window.Message = window.Message || {}
$(function($) {
   'use strict';
    window.message_container = $("#container");
		window.Message.MessageRouter  = Backbone.Router.extend({
			 routes: {
			  "": "index",
			  "all" : "all",
			  ":id/edit": "edit"
			 },
	    events:{
        "change .input": "captureValues",
        'submit form' : "savenow"  
        },
	   initialize: function(){
	    console.log("== Router initialize")
	     window.Message.listing_area = $("#" + window.message_container.data("listing-area"));
	     window.Message.edit_area = $('#' + window.message_container.data("edit-area"));
	     this.collection =  new window.Message.Collection;
	     this.container =   window.message_container;
	     window.Message.messages = this.container.data("messages");
	     window.message_collection  = this.collection.reset(this.container.data("messages"));
	   },
	   all: function(){
	     window.message_container = window.message_container || $("#container");
	     window.Message.listing_area.show();
	     window.Message.edit_area.hide();
         //var view = new window.Message.MessageIndexView({collection: this.collection});
         //return this.container.html(view.render().el); 
	   },
	   index: function(){
         this.container.empty();
         window.Message.listing_area.show();
			   window.Message.edit_area.hide();
		       var view = new window.Message.MessageIndexView({collection: this.collection}); //"imp"
		       return this.container.html(view.render().el); 
			  },
	   edit: function(id){
	     window.Message.listing_area.hide();
	     var obj = window.message_collection.get(id);
	     window.Message.edit_area.show();
	     var edit_message_view = new window.Message.MessageEdit({ model: obj });
	     edit_message_view.render();
	     /* Not the right way
	      Message.messages.forEach(function(obj, index){
	         if( obj.id == id ){
	          var edit_message_view = new window.Message.MessageEdit({ model: obj });
	           edit_message_view.render();
	         }
	     })*/
	   }
	    
	});
	
	//Backbone.history.start({});
});


/*
    Backbone history exception: undefined method start for undefined
    http://stackoverflow.com/questions/7343357/cannot-call-start-of-undefined-when-starting-backbone-js-history
    
    we have to specify atleast one route to get it start
*/
