window.Message = window.Message || {};

$(function(){
        'use strict';
     window.Message.MessageModel = Backbone.Model.extend({
        defaults:{
            subject: "Type Subject Here..",
            body: "Type Message Here.."
        }     
    });
});
