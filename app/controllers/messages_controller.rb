class MessagesController < ApplicationController
  
  
  respond_to :json, :html
    
  def index
    respond_to do |format|
      format.json{ Message.all }
      format.html{ Message.all}
    end
  end

  def new
  end

  def show
  end
  
  def edit
    @message = Message.find_by_id(params[:id])
    respond_with @message
  end
  
  def update
    message = Message.find(params[:id])
    message.update_attributes(params[:message])
    respond_with message
  end
  
end
