/*
    As soon as instance of single message view is created, events are registered
*/
window.Message = window.Message || {};
$(function($){
    'use strict';
    window.Message.MessageView =  Backbone.View.extend({
        tagName: "li",
        template: JST["messages/message"],
        initialize: function(){
         this.model.on('change', this.render, this );
        },
        events:{
        },
        render: function(){
            this.$el.html(this.template( this.model.toJSON() ));
            return this;
        },
        edit: function(){

        }
    });
});
