AjaxErrorRepresenter = {},
AjaxErrorHelper = {};



(function($){

    AjaxErrorHelper = {
        showNotice: function(msg){
            var notice;
            if( $('.ajax-notice').length ){
               notice =  $('.ajax-notice');
               notice.html(msg);
            }
            else{
                notice = $("<div/>").addClass('ajax-notice');
                notice.html(msg).appendTo("body").hide();
            }
            notice.slideDown();
            setTimeout(function(){
                AjaxErrorHelper.hideNotice()
            }, 2500);
        },
        hideNotice: function(){
            $("div.ajax-notice").slideUp('slow').fadeOut();
        },
        hideErrors: function(){
            $("span.ajax-error").remove();
        }

    };


    AjaxErrorRepresenter = function(entity_type, options){
        this.initialize(entity_type, options);
    }

    $.extend(AjaxErrorRepresenter.prototype,{
        initialize: function(entity_type, options){
            this.entity_type = entity_type;
            this.form_id = options['form_id'];
            this.form    = $("#" + this.form_id);
            this.bindCallbacks();
        },
        bindCallbacks: function(){
            var self = this;
            $(this.form).bind("ajax:beforeSend", function(){
               AjaxErrorHelper.hideErrors();
               AjaxErrorHelper.hideNotice();

            }).bind("ajax:error", function(evt, xhr, status, error){
                self.errors = JSON.parse(xhr.responseText);
                self.showErrors();
            }).bind("ajax:success", function(evt, data, status, xhr){
                  self.success(data);
            });
        },
        showErrors: function(){
            var self = this;
            $.each(self.errors, function(attribute, error){
               var field = $("#" + self.entity_type + "_" + attribute);
               var error = $("<span/>").addClass('ajax-error').html(error)
               error.insertAfter(field);
            });
        },

        success: function(data){
            if(data.notice) AjaxErrorHelper.showNotice(data.notice);
            this.form[0].reset();
        }

    })  ;
}(jQuery));