class MessagesController < ApplicationController
  
  
  respond_to :json
    
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
end
