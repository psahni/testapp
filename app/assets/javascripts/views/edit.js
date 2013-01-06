window.Message = window.Message || {};

$(function($){
 'use strict';
 window.Message.MessageEdit = Backbone.View.extend({
   template: JST["messages/edit"],
   el: "#edit_area",                                        /*The form submission was not working, but as soon as i put up el, it started working*/
   events:{
     "change .input": "captureValues",
     'submit form' : "savenow"  
   },
   render: function(){
        $(this.el).html(this.template( this.model.toJSON()));
        $("#edit_area").html($(this.el).html());
   },
   captureValues: function(event){
    var field = event.target,
        name = field.name,
        value = field.value;
        this.model.set(name, value);
   },
   savenow: function(){
     this.model.save({});
     return false;
   } 
 });
    
});
