window.Message = window.Message || {};

$(function($){
 'use strict';
 window.Message.MessageEdit = Backbone.View.extend({
   template: JST["messages/edit"],
   el: "#edit_area",                                        /*The form submission was not working, but as soon as i put up el, it started working*/
   events:{
     'submit form' : "savenow"  
   },
   render: function(){
        $(this.el).html(this.template( this.model ));
        $("#edit_area").html($(this.el).html());
   },
   savenow: function(e){
    e.preventDefault();
     console.log("hello")
     console.log(this.model)
     return false
   } 
 });
    
});
