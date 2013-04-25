window.Message = window.Message || {};
$(function($){
    'use strict';
     window.Message.MessageIndexView =  Backbone.View.extend({
      template: JST["messages"],// Do not need template, the view is defined in rails view
        initialize: function(){
          this.collection.on("reset", this.render);
          window.Message.listing_container = $("#message-list");
        },
        render: function(){
        //  console.log("Message Index: render view");
          window.Message.listing_container.html("");
         $(this.el).html(this.template());
          this.collection.each(this.displayOne, this);
          return this;
        },
        displayOne: function( message ){
            console.log("displaying..")
            var view = new window.Message.MessageView({model: message });
            var element = view.render().el
            Message.listing_container.append($(element));
        },
        displayAll: function(){
           window.Message.Collection.each(this.displayOne, this)
        }
    });
     
});
