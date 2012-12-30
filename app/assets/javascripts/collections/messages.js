window.Message = window.Message || {};

$(function(){
   'use strict';
    window.Message.Collection = Backbone.Collection.extend({
        url: '/messages',
        model: window.Message.MessageModel
    });
    
});

